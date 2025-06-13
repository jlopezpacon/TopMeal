def usuario_nombre(request):
    return {
        'usuario_nombre': request.session.get('usuario_nombre')
    }
