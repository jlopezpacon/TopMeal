from django.urls import path
from .views import InicioListView, Register, Login

urlpatterns = [
    path('',InicioListView.as_view(),name='inicio'),
    path('login/', Login.as_view(), name='login'),
    path('resgister/', Register.as_view(), name='register'),
]