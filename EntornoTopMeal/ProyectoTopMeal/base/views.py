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
        return redirect('login')
    

class Login(TemplateView):
    template_name = "base/login.html"
