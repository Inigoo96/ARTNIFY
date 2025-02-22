const express = require('express'); // Importamos Express
const app = express(); // Creamos la aplicación
const PORT = 3000; // Puerto del servidor

// Middleware para procesar JSON en las solicitudes POST
app.use(express.json());

// Ruta principal
app.get('/', (req, res) => {
    res.send('Servidor ARTNIFY con Express');
});

// Nueva ruta: Información del servidor
app.get('/api/info', (req, res) => {
    res.json({
        nombre: "ARTNIFY API",
        version: "1.0.0",
        estado: "En funcionamiento"
    });
});

// Nueva ruta: Recibir un mensaje con POST
app.post('/api/mensaje', (req, res) => {
    const { mensaje } = req.body;
    res.json({ respuesta: `Mensaje recibido: ${mensaje}` });
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor ARTNIFY corriendo en http://localhost:${PORT}/`);
});
