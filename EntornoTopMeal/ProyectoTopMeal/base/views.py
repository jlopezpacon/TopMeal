from django.views.generic import TemplateView , ListView
from .models import Restaurantes , Opiniones
import random
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuarios


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
        # Añade el nombre del usuario si está en sesión
        context['usuario_nombre'] = self.request.session.get('usuario_nombre')
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
