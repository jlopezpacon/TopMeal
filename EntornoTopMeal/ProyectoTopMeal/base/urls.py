from django.urls import path
from django.contrib.auth import views as auth_views
from .views import InicioListView, Register, Login, logout_view, AcercaView, ContactoView, LegalesView, RestauranteDetailView
from . import views

from .views import Login, PedidoDomicilioView

urlpatterns = [
    path('', InicioListView.as_view(), name='inicio'),
    path('register/', Register.as_view(), name='register'),
    path('login/', Login.as_view(), name='login'),  # ← Usa tu vista personalizada
    path('logout/', views.logout_view, name='logout'),
    path('acerca/', AcercaView.as_view(), name='acerca'),
    path('contacto/', ContactoView.as_view(), name='contacto'),
    path('legales/', LegalesView.as_view(), name='legales'),
    path('restaurante/<int:pk>/', RestauranteDetailView.as_view(), name='restaurante_detail'),
    path('api/reservar/<int:restaurante_id>/', views.api_reservar, name='api_reservar'),
    path('pedido-domicilio/<int:pk>/', PedidoDomicilioView.as_view(), name='pedido_domicilio'),
    
    path('crear-sesion-pago/', views.crear_sesion_pago, name='crear_sesion_pago'),
    path('pedido/exito/', views.pedido_exito, name='pedido_exito'),
    path('pedido/cancelado/', views.pedido_cancelado, name='pedido_cancelado'),
]