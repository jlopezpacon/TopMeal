from django import template

register = template.Library()

def interpolate_color(val, color1, color2):
    # val: 0.0 - 1.0
    c1 = [int(color1[i:i+2], 16) for i in (1, 3, 5)]
    c2 = [int(color2[i:i+2], 16) for i in (1, 3, 5)]
    c = [int(c1[i] + (c2[i] - c1[i]) * val) for i in range(3)]
    return f'#{c[0]:02x}{c[1]:02x}{c[2]:02x}'

@register.filter
def rating_color(value):
    """
    Devuelve un color HEX interpolado:
    0 = rojo (#e63946)
    3 = naranja (#facc15)
    4 = naranja verdoso (#a6c915)
    5 = verde fuerte (#22c55e)
    """
    try:
        v = float(value)
    except:
        return "#e63946"
    if v <= 3:
        # Rojo a naranja
        t = max(0, min((v-0)/3, 1))
        return interpolate_color(t, "#e63946", "#facc15")
    elif v <= 4:
        # Naranja a naranja verdoso
        t = max(0, min((v-3)/1, 1))
        return interpolate_color(t, "#facc15", "#a6c915")
    else:
        # Naranja verdoso a verde fuerte
        t = max(0, min((v-4)/1, 1))
        return interpolate_color(t, "#a6c915", "#22c55e")
