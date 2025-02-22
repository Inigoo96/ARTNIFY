require('dotenv').config(); // Cargar variables de entorno
const { Pool } = require('pg');

// Configurar la conexión con PostgreSQL usando variables de entorno
const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

module.exports = pool; // Exportamos la conexión
