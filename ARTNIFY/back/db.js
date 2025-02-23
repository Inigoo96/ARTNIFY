const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'ai-formation.cxeqa1ynhmmz.us-east-1.rds.amazonaws.com', 
    database: 'postgres',  
    password: 'aq123es.',
    port: 5432,
    ssl: { rejectUnauthorized: false }
});

module.exports = pool;
