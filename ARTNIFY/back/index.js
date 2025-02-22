//importar el modulo HTTP de index.js
const http = require('http');
const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Servidor ARTNIFY en marcha');
});

//iniciar el servidor en el peurto 3000
server.listen(3000, () => {
    console.log('Servidor ARTNIFY corriendo en el http://localhost:3000/');
})


