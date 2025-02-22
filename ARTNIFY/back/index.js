const http = require('http');   // importar el modulo HTTP

const PORT = 3000;  // puerto en el que se ejecutará el servidor

const server = http.createServer((req, res) => {
    if(req.url === '/') {   //Ruta principal
        res.writeHead(200, {'Content-Type': 'text/plain'});
        res.end('Servidor ARTNIFY en marcha');
    } else if(req.url === '/api') { //Nuevas rutas
        res.writeHead(200, {'Content-Type': 'application/json'});
        res.end(JSON.stringify({message: 'Bienvenido a la API de ARTNIFY'}));
    } else {
        res.writeHead(404, {'Content-Type': 'text/plain'});
        res.end('Error 404: Ruta no encontrada');
    }
});

// Iniciar el servidor
server.listen(PORT, () => {
    console.log(`Servidor ARTNIFY corriendo en http://localhost:${PORT}/`);
});
