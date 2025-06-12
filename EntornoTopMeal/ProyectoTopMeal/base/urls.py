from django.urls import path
from django.contrib.auth import views as auth_views
from .views import InicioListView, Register, Login
from . import views

urlpatterns = [
    path('',InicioListView.as_view(),name='inicio'),
    path('resgister/', Register.as_view(), name='register'),
]