from django.contrib import admin
from .models import (
    Usuarios, Repartidores, Restaurantes, Menu,
    Productos, Reservas, Opiniones, Pedido, DetallePedido
)

@admin.register(Usuarios)
class UsuariosAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'email', 'telefono', 'direccion')
    search_fields = ('nombre', 'email', 'telefono')


@admin.register(Repartidores)
class RepartidoresAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'telefono')
    search_fields = ('nombre', 'telefono')


@admin.register(Restaurantes)
class RestaurantesAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'direccion', 'tipo', 'precio_medio', 'media_valoracion')
    search_fields = ('nombre', 'direccion', 'tipo')
    list_filter = ('tipo',)


@admin.register(Menu)
class MenuAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'restaurante')
    search_fields = ('nombre',)
    list_filter = ('restaurante',)


@admin.register(Productos)
class ProductosAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'tipo', 'menu', 'precio')
    search_fields = ('nombre', 'tipo')
    list_filter = ('tipo', 'menu')


@admin.register(Reservas)
class ReservasAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'restaurante', 'fecha', 'hora', 'numero_personas')
    list_filter = ('fecha', 'restaurante')
    search_fields = ('usuario__nombre',)


@admin.register(Opiniones)
class OpinionesAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'restaurante', 'puntuacion')
    list_filter = ('puntuacion',)
    search_fields = ('usuario__nombre', 'comentario')


@admin.register(Pedido)
class PedidoAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'restaurante', 'repartidor', 'total', 'estado', 'fecha')
    list_filter = ('estado', 'fecha')
    search_fields = ('usuario__nombre',)


@admin.register(DetallePedido)
class DetallePedidoAdmin(admin.ModelAdmin):
    list_display = ('pedido', 'producto', 'cantidad', 'subtotal')
    search_fields = ('pedido__id', 'producto__nombre')
