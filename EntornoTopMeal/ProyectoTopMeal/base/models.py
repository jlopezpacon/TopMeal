from django.db import models
from django.core.exceptions import ValidationError

class Usuarios(models.Model):
    nombre = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    contraseña = models.CharField(max_length=255)
    telefono = models.CharField(max_length=20)
    tarjeta = models.CharField(max_length=20)
    cad_tarjeta = models.CharField(max_length=5)  
    cvv_tarjeta = models.CharField(max_length=3)
    direccion = models.CharField(max_length=100)

    def clean(self):
        if len(self.tarjeta) < 14:
            raise ValidationError("La tarjeta debe tener al menos 14 caracteres.")
        if len(self.cvv_tarjeta) < 3:
            raise ValidationError("El CVV debe tener al menos 3 caracteres.")

    def __str__(self):
        return f"{self.nombre}"

class Repartidores(models.Model):
    nombre = models.CharField(max_length=100)
    telefono = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre

class Restaurantes(models.Model):
    nombre = models.CharField(max_length=100)
    direccion = models.CharField(max_length=100)
    tipo = models.CharField(max_length=20)
    precio_medio = models.DecimalField(max_digits=6, decimal_places=2)
    media_valoracion = models.DecimalField(max_digits=3, decimal_places=2)
    hora_apertura = models.TimeField()
    hora_cierre = models.TimeField()
    imagen_url = models.URLField(max_length=255, default='https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/7b/44/2a/carbon-2.jpg?w=900&h=500&s=1')

    def valoracion_percent(self):
        try:
            return round((float(self.media_valoracion) / 5) * 100)
        except:
            return 0
    
    def __str__(self):
        return self.nombre

class Menu(models.Model):
    restaurante = models.ForeignKey(Restaurantes, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    imagen_url = models.URLField(max_length=255, default='https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/7b/44/2a/carbon-2.jpg?w=900&h=500&s=1')

    def __str__(self):
        return f"{self.nombre} - {self.restaurante.nombre}"

class Productos(models.Model):
    menu = models.ForeignKey(Menu, on_delete=models.CASCADE)
    tipo = models.CharField(max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=6, decimal_places=2)

    def __str__(self):
        return f"{self.nombre} ({self.tipo})"

class Reservas(models.Model):
    usuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    restaurante = models.ForeignKey(Restaurantes, on_delete=models.CASCADE)
    fecha = models.DateField()
    hora = models.TimeField()
    numero_personas = models.IntegerField()

    def __str__(self):
        return f"{self.usuario.nombre} - {self.restaurante.nombre} ({self.fecha} {self.hora})"

class Opiniones(models.Model):
    usuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    restaurante = models.ForeignKey(Restaurantes, on_delete=models.CASCADE)
    puntuacion = models.DecimalField(max_digits=3, decimal_places=2)
    comentario = models.TextField()

    def clean(self):
        if not (1 <= self.puntuacion <= 5):
            raise ValidationError("La puntuación debe estar entre 1 y 5.")

    def __str__(self):
        return f"{self.usuario.nombre} - {self.restaurante.nombre} ({self.puntuacion})"

class Pedido(models.Model):
    ESTADO_CHOICES = [
        ('Pendiente', 'Pendiente'),
        ('En preparación', 'En preparación'),
        ('En camino', 'En camino'),
        ('Entregado', 'Entregado'),
    ]

    usuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    restaurante = models.ForeignKey(Restaurantes, on_delete=models.CASCADE)
    repartidor = models.ForeignKey(Repartidores, on_delete=models.CASCADE)
    direccion_entrega = models.TextField()
    total = models.DecimalField(max_digits=8, decimal_places=2)
    fecha = models.DateTimeField()
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES)

    def __str__(self):
        return f"Pedido #{self.id} - {self.usuario.nombre} - {self.restaurante.nombre}"

class DetallePedido(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    producto = models.ForeignKey(Productos, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    subtotal = models.DecimalField(max_digits=8, decimal_places=2)

    class Meta:
        unique_together = ('pedido', 'producto')

    def __str__(self):
        return f"Pedido #{self.pedido.id} - {self.producto.nombre} x{self.cantidad}"
