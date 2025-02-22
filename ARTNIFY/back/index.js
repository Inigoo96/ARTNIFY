const express = require('express'); // Importamos Express
const pool = require('./db'); // Importamos la conexión a PostgreSQL
const app = express(); // Creamos la aplicación
const PORT = 3000; // Puerto del servidor

// Middleware para procesar JSON en las solicitudes POST
app.use(express.json());





// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor ARTNIFY corriendo en http://localhost:${PORT}/`);
});
