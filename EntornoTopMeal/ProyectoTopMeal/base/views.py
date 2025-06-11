from django.views.generic import TemplateView , ListView
from .models import Restaurantes , Opiniones
import random


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

class Login(TemplateView):
    template_name = "base/login.html"
