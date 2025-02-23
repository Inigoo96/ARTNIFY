CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telf VARCHAR(15) DEFAULT NULL,
    password TEXT NOT NULL,
    presupuesto DECIMAL(10,2) DEFAULT 100.00,
    img_perfil TEXT DEFAULT 'defaultAvatar.png',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rol VARCHAR(10) NOT NULL CHECK (rol IN ('admin', 'creador', 'normal')) DEFAULT 'normal'
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE videos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    url_video TEXT NOT NULL,
    creador_id INT NOT NULL,  
    categoria_id INT NOT NULL,  
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) CHECK (estado IN ('publicado', 'oculto', 'eliminado')) DEFAULT 'publicado',
    FOREIGN KEY (creador_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
);

CREATE TABLE likes_videos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    video_id INT NOT NULL,
    tipo VARCHAR(10) CHECK (tipo IN ('like', 'dislike')) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    UNIQUE (usuario_id, video_id)
);


CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    creador_id INT NOT NULL,
    precio DECIMAL(10,2) DEFAULT 0.00,  
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (creador_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE lecciones (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    curso_id INT NOT NULL,
    video_id INT NOT NULL,
    tema INT NOT NULL,
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

CREATE TABLE favoritos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    video_id INT,  
    curso_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE,
    CHECK (
        (video_id IS NOT NULL AND curso_id IS NULL) OR 
        (curso_id IS NOT NULL AND video_id IS NULL)
    ),
    UNIQUE (usuario_id, video_id, curso_id)
);

CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    video_id INT,  
    curso_id INT,
    resenia TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE,
    CHECK (
        (video_id IS NOT NULL AND curso_id IS NULL) OR 
        (curso_id IS NOT NULL AND video_id IS NULL)
    )
);

CREATE TABLE likes_comentarios (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    comentario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (comentario_id) REFERENCES comentarios(id) ON DELETE CASCADE,
    UNIQUE (usuario_id, comentario_id)
);

CREATE TABLE transacciones (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    curso_id INT NOT NULL,
    creador_id INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE,
    FOREIGN KEY (creador_id) REFERENCES usuarios(id) ON DELETE CASCADE
);










