from django.urls import path
from django.contrib.auth import views as auth_views
from .views import InicioListView, Register, Login, logout_view, AcercaView, ContactoView, LegalesView
from . import views

from .views import Login

urlpatterns = [
    path('', InicioListView.as_view(), name='inicio'),
    path('register/', Register.as_view(), name='register'),
    path('login/', Login.as_view(), name='login'),  # ← Usa tu vista personalizada
    path('logout/', views.logout_view, name='logout'),
    path('acerca/', AcercaView.as_view(), name='acerca'),
    path('contacto/', ContactoView.as_view(), name='contacto'),
    path('legales/', LegalesView.as_view(), name='legales'),
]