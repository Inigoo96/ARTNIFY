CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    id_cuenta TEXT,
    tipo_usuario VARCHAR(20) CHECK (tipo_usuario IN ('normal', 'creador', 'admin')) DEFAULT 'normal'
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE videos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    duracion INT NOT NULL, -- Se mantiene como INT para evitar conversiones
    url_video TEXT NOT NULL,
    usuario_id INT NOT NULL,  
    categoria_id INT NOT NULL,  
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) CHECK (estado IN ('publicado', 'oculto', 'eliminado')) DEFAULT 'publicado',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
);

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    usuario_id INT NOT NULL,
    precio DECIMAL(10,2) DEFAULT 0.00,  
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE lecciones (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    curso_id INT NOT NULL,
    video_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE
);

CREATE TABLE inscripciones (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE,
    UNIQUE (usuario_id, curso_id)
);

CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    video_id INT NOT NULL,
    contenido TEXT NOT NULL,
    fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE
);

CREATE TABLE calificaciones (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    video_id INT,
    curso_id INT,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE
);

CREATE TABLE favoritos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    video_id INT NOT NULL,
    tipo VARCHAR(10) CHECK (tipo IN ('like', 'dislike')) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    UNIQUE (usuario_id, video_id)
);

CREATE TABLE suscripciones (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    creador_id INT NOT NULL,
    fecha_suscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (creador_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    UNIQUE (usuario_id, creador_id)
);


INSERT INTO usuarios (username, password, email, telefono, tipo_usuario)
VALUES
    ('admin', 'AdminPass2025', 'admin@aiformation.com', '600123456', 'admin'),
    ('Iñigo', '123456', 'inigo@gmail.com', '645789123', 'normal'),
    ('Arturo', '123456', 'arturo@gmail.com', '622334455', 'normal'),
    ('Lucia', '123456', 'lucia@gmail.com', '655667788', 'normal'),
    ('Jairo', '123456', 'jairo@gmail.com', '611223344', 'creador'),
    ('Dani', '123456', 'dani@gmail.com', '633445566', 'creador');

INSERT INTO categorias (nombre)
VALUES
    ('Programación'),
    ('Ciencia y Tecnología'),
    ('Entretenimiento'),
    ('Educación'),
    ('Música'),
    ('Negocios'),
    ('Salud y Bienestar');

INSERT INTO videos (titulo, descripcion, duracion, url_video, usuario_id, categoria_id)
VALUES
    ('Curso de PostgreSQL desde Cero', 'Aprende a manejar bases de datos relacionales con PostgreSQL', 24768, 'https://youtu.be/OuJerKzV5T0', 2, 1),
    ('Introducción a Machine Learning', 'Conceptos básicos de aprendizaje automático', 420, 'https://youtu.be/xrQ1YH0PnrM', 2, 2),
    ('Historia del Universo', 'Un documental educativo sobre el origen del cosmos', 11940, 'https://youtu.be/0F1rzZHDcaI', 3, 2),
    ('Guitarra para principiantes', 'Aprende a tocar tus primeras canciones en guitarra', 1440, 'https://youtu.be/S_QIaGgLJ-0', 4, 5),
    ('Estrategias de Marketing Digital', 'Cómo hacer crecer tu negocio en redes sociales', 720, 'https://youtu.be/hsIowKV9bVk', 3, 6);

INSERT INTO cursos (titulo, descripcion, usuario_id, precio)
VALUES
    ('Python para Principiantes', 'Curso completo de Python desde cero', 5, 49.99),
    ('Desarrollo Web con React', 'Aprende a crear aplicaciones modernas con React', 6, 79.99);

INSERT INTO inscripciones (usuario_id, curso_id)
VALUES
    (2, 1), 
    (3, 1),  
    (4, 2);

INSERT INTO comentarios (usuario_id, video_id, contenido)
VALUES
    (2, 1, 'Muy buen curso, explicado paso a paso.'),
    (3, 1, 'Me ayudó mucho a entender SQL, gracias!'),
    (4, 2, 'Interesante, pero me gustaría más ejemplos prácticos.'),
    (3, 4, 'Me encantó este curso de guitarra, ¡muy recomendado!');

INSERT INTO favoritos (usuario_id, video_id, tipo)
VALUES
    (2, 1, 'like'),
    (3, 1, 'like'),
    (4, 2, 'dislike'),
    (2, 4, 'like'),
    (3, 4, 'like');

INSERT INTO suscripciones (usuario_id, creador_id)
VALUES
    (2, 5),
    (3, 5),
    (4, 6);




