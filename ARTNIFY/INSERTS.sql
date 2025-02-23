-- Insertar categorías
INSERT INTO categorias (nombre) VALUES
('Programación'),
('Diseño Gráfico'),
('Marketing Digital'),
('Desarrollo Personal'),
('Idiomas'),
('Música'),
('Negocios'),
('Fotografía');

-- Insertar usuarios (passwords hasheadas de ejemplo)
INSERT INTO usuarios (nombre, apellido, email, telf, password, presupuesto, rol) VALUES
('Admin', 'Admin', 'admin@gmail.com', '611223344', 'admin1234', 500.00, 'admin'),
('Carlos', 'García', 'carlos.garcia@gmail.com', '622334455', 'carlos1234', 250.00, 'creador'),
('Laura', 'Rodríguez', 'laura.rodriguez@email.com', '633445566', 'laura1234', 150.00, 'creador'),
('Miguel', 'López', 'miguel.lopez@email.com', '644556677', 'miguel1234', 100.00, 'normal'),
('Patricia', 'Sánchez', 'patricia.sanchez@email.com', '655667788', 'patricia1234', 300.00, 'normal');

-- Insertar videos
INSERT INTO videos (titulo, descripcion, url_video, creador_id, categoria_id, estado) VALUES
('Introducción a Python', 'Aprende los fundamentos de Python desde cero', 'https://youtu.be/_6N18g3ewnw?si=2UJtR0cTekbK5ZKq', 2, 1, 'publicado'),
('Diseño de Logos Profesionales', 'Técnicas avanzadas de diseño de logos', 'https://youtu.be/blsrqSEsJAA?si=2euQIRMhzzFVV3f0', 3, 2, 'publicado'),
('Marketing en Redes Sociales', 'Estrategias efectivas para redes sociales', 'https://youtu.be/hgqRvnyjQak?si=dhTdLk6PbS6JuYDj', 2, 3, 'publicado'),
('Desarrollo de Aplicaciones Web', 'Curso completo de desarrollo web', 'https://youtu.be/4Azc4Gs2nlU?si=sFuBnn59l18aYqsK', 2, 1, 'publicado'),
('Fotografía Digital Básica', 'Principios de la fotografía digital', 'https://youtu.be/Ar_h-uwUvDs?si=lZfXRnmZPk0UaC0F', 3, 8, 'publicado'),
('Inglés para Negocios', 'Vocabulario y expresiones comerciales', 'https://youtu.be/7nP-V55Om9I?si=UmmX2RXBT612-C6d', 3, 5, 'publicado'),
('Gestión del Tiempo', 'Mejora tu productividad personal', 'https://youtu.be/RK9hMZ7t1fU?si=lNU6_CcmOj1p3OYT', 2, 4, 'oculto');

-- Insertar cursos
INSERT INTO cursos (titulo, descripcion, creador_id, precio) VALUES
('Python desde Cero', 'Curso completo de Python para principiantes', 2, 49.99),
('Máster en Diseño Gráfico', 'Domina las herramientas de diseño más populares', 3, 89.99),
('Marketing Digital Completo', 'Todo lo que necesitas saber sobre marketing digital', 2, 69.99),
('Fotografía Profesional', 'De principiante a profesional en fotografía', 3, 79.99);

-- Insertar lecciones
INSERT INTO lecciones (titulo, curso_id, video_id, tema) VALUES
('Introducción a Python', 1, 1, 1),
('Desarrollo Web con Python', 1, 4, 2),
('Fundamentos de Diseño', 2, 2, 1),
('Marketing en Redes Sociales', 3, 3, 1),
('Básicos de Fotografía', 4, 5, 1);