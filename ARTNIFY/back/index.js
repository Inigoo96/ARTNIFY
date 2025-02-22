const express = require('express'); // Importamos Express
const app = express(); // Creamos la aplicación
const PORT = 3000; // Puerto del servidor

// Ruta principal
app.get('/', (req, res) => {
    res.send('Servidor ARTNIFY con Express');
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor ARTNIFY corriendo en http://localhost:${PORT}/`);
});
