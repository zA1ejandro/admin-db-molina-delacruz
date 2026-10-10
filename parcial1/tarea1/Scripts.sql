CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255)
);

CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fechaPrestamo TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

-- USUARIOS
INSERT INTO usuarios (id_usuario, nombreUsuario, email) VALUES
(1, 'Ana Gómez', 'ana@email.com'),
(2, 'Carlos Ruíz', 'carlos@email.com');

-- LIBROS
INSERT INTO libros (id_libro, titulo, autor) VALUES
(1, 'El Principito', 'Antoine de Saint-Exupéry'),
(2, 'Cien Años de Soledad', 'Gabriel García Márquez');

-- PRESTAMOS
INSERT INTO prestamos (id_prestamo, id_usuario, id_libro, fechaPrestamo) VALUES
(5001, 1, 1, '2026-03-01'),
(5002, 2, 2, '2026-03-02'),
(5003, 1, 2, '2026-03-05');

SELECT * FROM usuarios;