const express = require('express');
const pool = require('./db'); // Conexión a PostgreSQL
const app = express();
const PORT = 3000;

app.use(express.json()); // Middleware para procesar JSON
// Middleware para CORS
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

// Middleware para logging
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

// Ruta principal
app.get('/', (req, res) => {
    res.send('Servidor ARTNIFY en funcionamiento');
});

// REGISTRO DE USUARIO
app.post('/api/register', async (req, res) => {
    console.log('Body recibido:', req.body); // Para depuración
    
    const { nombre, apellido, email, password, telf, rol = 'normal' } = req.body;

    // VALIDACIÓN: Verificar que no haya campos vacíos (excepto telf que es opcional)
    if (!nombre || !apellido || !email || !password) {
        console.log('Campos recibidos:', { 
            nombre: !!nombre, 
            apellido: !!apellido, 
            email: !!email, 
            password: !!password, 
            telf: !!telf // telf puede ser opcional
        }); // Para depuración
        return res.status(400).json({ error: 'Nombre, apellido, email y password son obligatorios' });
    }

    try {
        // Verificar si el usuario ya existe
        const userExists = await pool.query('SELECT id FROM usuarios WHERE email = $1', [email]);
        if (userExists.rows.length > 0) {
            return res.status(400).json({ error: 'El usuario ya está registrado' });
        }

        // Insertar el nuevo usuario (dejamos que presupuesto use el valor por defecto)
        const result = await pool.query(
            'INSERT INTO usuarios (nombre, apellido, email, password, telf, rol, img_perfil) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *',
            [nombre, apellido, email, password, telf || null, rol, 'defaultAvatar.png']
        );

        res.status(201).json({ message: 'Usuario registrado con éxito', usuario: result.rows[0] });
    } catch (error) {
        console.error('Error en el registro:', error);
        res.status(500).json({ error: 'Error al registrar usuario' });
    }
});

// LOGIN DE USUARIO
app.post('/api/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        // Verificar si el usuario existe
        const result = await pool.query('SELECT * FROM usuarios WHERE email = $1', [email]);
        if (result.rows.length === 0) {
            return res.status(400).json({ error: 'Usuario no encontrado' });
        }

        const usuario = result.rows[0];

        // Comparar la contraseña ingresada con la almacenada en la base de datos
        if (password !== usuario.password) {
            return res.status(401).json({ error: 'Contraseña incorrecta' });
        }

        res.json({ message: 'Inicio de sesión exitoso', usuario });
    } catch (error) {
        console.error('Error en login:', error);
        res.status(500).json({ error: 'Error al iniciar sesión' });
    }
});


// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor ARTNIFY corriendo en http://localhost:${PORT}/`);
});
