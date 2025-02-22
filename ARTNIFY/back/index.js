require('dotenv').config(); // Cargar variables de entorno
const express = require('express');
const pool = require('./db'); // Importar conexión a PostgreSQL
const app = express();
const PORT = 3000;

app.use(express.json()); // Middleware para procesar JSON

// Ruta principal
app.get('/', (req, res) => {
    res.send('Servidor ARTNIFY en funcionamiento');
});

// Ruta para obtener todos los usuarios
app.get('/api/usuarios', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM usuarios');
        res.json(result.rows);
    } catch (error) {
        console.error('Error al obtener usuarios:', error);
        res.status(500).json({ error: 'Error al obtener usuarios' });
    }
});

// Ruta para obtener todos los cursos
app.get('/api/cursos', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM cursos');
        res.json(result.rows);
    } catch (error) {
        console.error('Error al obtener cursos:', error);
        res.status(500).json({ error: 'Error al obtener cursos' });
    }
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor ARTNIFY corriendo en http://localhost:${PORT}/`);
});
