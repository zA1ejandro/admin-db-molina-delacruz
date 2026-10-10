create database if not exists tarea4;
USE tarea4;

CREATE TABLE if not exists producto (
    id_producto     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    stock           INT NOT NULL CHECK (stock >= 0),
    precio          DECIMAL(10,2) NOT NULL CHECK (precio > 0)
) ENGINE=InnoDB;

CREATE TABLE if not exists pago (
    id_pago         INT AUTO_INCREMENT PRIMARY KEY,
    monto           DECIMAL(10,2) NOT NULL CHECK (monto > 0),
    estatus         VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE if not exists compra (
    id_compra       INT AUTO_INCREMENT PRIMARY KEY,
    id_pago         INT,
    CONSTRAINT fk_compra_pago
        FOREIGN KEY (id_pago) REFERENCES pago(id_pago)
) ENGINE=InnoDB;

CREATE TABLE if not exists detalle_compra (
    id_detalle_compra  INT AUTO_INCREMENT PRIMARY KEY,
    id_compra          INT NOT NULL,
    id_producto        INT NOT NULL,
    cantidad           INT NOT NULL,
    CONSTRAINT fk_detalle_compra
        FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
) ENGINE=InnoDB;

INSERT INTO producto (nombre_producto, stock, precio) VALUES
('Laptop HP 15', 25, 12999.00),
('Mouse Logitech M170', 80, 249.50),
('Teclado Mecánico Redragon', 40, 899.00),
('Monitor Samsung 24"', 15, 3499.00),
('Audífonos Sony WH-CH510', 60, 799.90),
('Silla Gamer Cougar', 10, 4599.00),
('Disco SSD Kingston 480GB', 35, 799.00),
('Webcam Logitech C920', 20, 1299.00);

INSERT INTO pago (monto, estatus) VALUES
(12999.00, 'COMPLETADO'),
(499.00, 'COMPLETADO'),
(899.00, 'PENDIENTE'),
(4599.00, 'COMPLETADO'),
(799.90, 'RECHAZADO'),
(1299.00, 'COMPLETADO');

INSERT INTO compra (id_pago) VALUES
(1),
(2),
(3),
(4),
(NULL),
(6);

INSERT INTO detalle_compra (id_compra, id_producto, cantidad) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 6, 1),
(5, 5, 1),
(6, 8, 1);
