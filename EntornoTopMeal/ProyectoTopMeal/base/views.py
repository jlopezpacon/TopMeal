from django.views.generic import TemplateView , ListView
from .models import Restaurantes , Opiniones
import random
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuarios
from django.views.generic.detail import DetailView
from .models import Restaurantes , Menu , Opiniones , Productos
from django.http import JsonResponse
from .models import Reservas
from django.views.decorators.csrf import csrf_exempt
import json
import stripe
from django.conf import settings
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


# Create your views here.
class InicioListView(ListView):
    model = Restaurantes
    template_name = "base/inicio.html"
    context_object_name = 'restaurantes'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['restaurantes_destacados'] = Restaurantes.objects.order_by('-media_valoracion')[:3]
        opiniones = list(Opiniones.objects.all())
        context['opiniones'] = random.sample(opiniones, min(3, len(opiniones)))
        return context
    

class Register(TemplateView):
    template_name = "base/register.html"

    def post(self, request, *args, **kwargs):
        nombre = request.POST.get('nombre', '').strip()
        email = request.POST.get('email', '').strip()
        contraseña = request.POST.get('contraseña', '')
        confirmar_contraseña = request.POST.get('confirmar_contraseña', '')
        telefono = request.POST.get('telefono', '').strip()
        direccion = request.POST.get('direccion', '').strip()

        # Validación de correo único
        if Usuarios.objects.filter(email=email).exists():
            return self.render_to_response({
                'error_message': 'El correo electrónico ya está registrado.'
            })

        # Validación de contraseñas iguales
        if contraseña != confirmar_contraseña:
            return self.render_to_response({
                'error_message': 'Las contraseñas no coinciden.'
            })

        # Crear usuario
        usuario = Usuarios(
            nombre=nombre,
            email=email,
            contraseña=contraseña,
            telefono=telefono,
            direccion=direccion,
            tarjeta='', cad_tarjeta='', cvv_tarjeta=''  # Si tu modelo requiere estos campos
        )
        usuario.save()
        # Redirigir a login con parámetro de éxito
        return redirect('/login/?registro=ok')
    

# base/views.py
from django.views.generic import TemplateView
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuarios
from .forms import LoginForm

class Login(TemplateView):
    template_name = "base/login.html"

    def get(self, request, *args, **kwargs):
        form = LoginForm()
        return render(request, self.template_name, {'form': form})

    def post(self, request, *args, **kwargs):
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            contraseña = form.cleaned_data['contraseña']
            try:
                usuario = Usuarios.objects.get(email=email)
                if usuario.contraseña == contraseña:  # ⚠️ Inseguro (usa hash en producción)
                    request.session['usuario_id'] = usuario.id
                    request.session['usuario_nombre'] = usuario.nombre
                    messages.success(request, f"¡Bienvenido/a, {usuario.nombre}!")
                    return redirect('inicio')
                else:
                    messages.error(request, "Contraseña incorrecta")
            except Usuarios.DoesNotExist:
                messages.error(request, "Usuario no encontrado")
        return render(request, self.template_name, {'form': form})

def logout_view(request):
    request.session.flush()
    return redirect('inicio')

class AcercaView(TemplateView):
    template_name = "base/acerca.html"

class ContactoView(TemplateView):
    template_name = "base/contacto.html"

class LegalesView(TemplateView):
    template_name = "base/legales.html"

class RestauranteDetailView(DetailView):
    model = Restaurantes
    template_name = "base/restaurante_detail.html"
    context_object_name = "restaurante"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['menu'] = Menu.objects.filter(restaurante_id=self.object.id).first()
        opiniones_qs = Opiniones.objects.filter(restaurante_id=self.object.id)
        context['ultimas_opiniones'] = opiniones_qs.order_by('-id')[:3]
        context['num_opiniones_real'] = opiniones_qs.count()
        return context

@csrf_exempt
def api_reservar(request, restaurante_id):
    if request.method == "POST":
        if not request.session.get('usuario_id'):
            return JsonResponse({'success': False, 'error': 'Debes iniciar sesión.'})
        body = json.loads(request.body)
        fecha = body.get('fecha')
        hora = body.get('hora')
        numero_personas = body.get('numero_personas')
        usuario_id = request.session.get('usuario_id')
        # Comprobar si ya existe reserva para ese día/hora/restaurante
        existe = Reservas.objects.filter(
            restaurante_id=restaurante_id,
            fecha=fecha,
            hora=hora
        ).exists()
        if existe:
            return JsonResponse({'success': False, 'error': 'Esa hora ya está reservada.'})
        Reservas.objects.create(
            usuario_id=usuario_id,
            restaurante_id=restaurante_id,
            fecha=fecha,
            hora=hora,
            numero_personas=numero_personas
        )
        return JsonResponse({'success': True})
    return JsonResponse({'success': False, 'error': 'Método no permitido'})

class PedidoDomicilioView(DetailView):
    model = Restaurantes
    template_name = "base/pedido_domicilio.html"
    context_object_name = "restaurante"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        menu = Menu.objects.filter(restaurante_id=self.object.id).first()
        context['menu'] = menu
        # Obtener productos del menú de este restaurante
        if menu:
            context['productos'] = Productos.objects.filter(menu=menu)
        else:
            context['productos'] = []
        return context
    


stripe.api_key = settings.STRIPE_SECRET_KEY

@csrf_exempt
def crear_sesion_pago(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            total = data.get('total')  # total en céntimos
            if not total or not isinstance(total, int) or total < 1:
                return JsonResponse({'error': 'Total inválido.'})
            session = stripe.checkout.Session.create(
                payment_method_types=['card'],
                mode='payment',
                line_items=[{
                    'price_data': {
                        'currency': 'eur',
                        'unit_amount': total,  # total en céntimos
                        'product_data': {
                            'name': 'Pedido a domicilio',
                        },
                    },
                    'quantity': 1,
                }],
                success_url='http://localhost:8000/pedido/exito/',
                cancel_url='http://localhost:8000/pedido/cancelado/',
            )
            return JsonResponse({'url': session.url})
        except Exception as e:
            return JsonResponse({'error': str(e)})
def pedido_exito(request):
    return render(request, 'base/pedido_exito.html')

def pedido_cancelado(request):
    return render(request, 'base/pedido_cancelado.html')


