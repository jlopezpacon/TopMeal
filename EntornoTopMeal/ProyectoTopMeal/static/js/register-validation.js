const form = document.getElementById('registerForm');
const submitBtn = document.getElementById('submitBtn');
const fields = [
    'nombre', 'email', 'contraseña', 'confirmar_contraseña', 'telefono', 'direccion'
];

const validators = {
    nombre: v => v.trim().length > 0 && v.trim().length <= 100,
    email: v => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v) && v.length <= 254,
    contraseña: v => v.length >= 6 && v.length <= 255,
    confirmar_contraseña: v => v === document.getElementById('contraseña').value && v.length >= 6 && v.length <= 255,
    telefono: v => /^[0-9+\s\-()]{7,20}$/.test(v),
    direccion: v => v.trim().length > 0 && v.trim().length <= 100
};

const errorMsgs = {
    nombre: "Introduce tu nombre (máx 100 caracteres).",
    email: "Introduce un correo válido (ej: usuario@email.com).",
    contraseña: "La contraseña debe tener al menos 6 caracteres.",
    confirmar_contraseña: "Las contraseñas no coinciden.",
    telefono: "Introduce un teléfono válido (7-20 dígitos).",
    direccion: "Introduce tu dirección (máx 100 caracteres)."
};

function validateField(field) {
    const input = document.getElementById(field);
    const value = input.value;
    const group = document.getElementById('group-' + field);
    const error = document.getElementById('error-' + field);
    if (!validators[field](value)) {
        group.classList.remove('valid');
        group.classList.add('invalid');
        error.textContent = errorMsgs[field];
        return false;
    } else {
        group.classList.remove('invalid');
        group.classList.add('valid');
        error.textContent = '';
        return true;
    }
}

function validateAllFields() {
    let valid = true;
    for (const field of fields) {
        const input = document.getElementById(field);
        if (!validators[field](input.value)) {
            valid = false;
            break;
        }
    }
    submitBtn.disabled = !valid;
    return valid;
}

fields.forEach(field => {
    document.getElementById(field).addEventListener('input', () => {
        validateField(field);
        if (field === 'contraseña' || field === 'confirmar_contraseña') {
            validateField('confirmar_contraseña');
        }
        validateAllFields();
    });
});

form.addEventListener('submit', function(e) {
    if (!validateAllFields()) {
        e.preventDefault();
    }
});
