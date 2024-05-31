CREATE DATABASE IF NOT EXISTS tienda;

CREATE TABLE IF NOT EXISTS tienda.empleado (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    edad INT(3) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    cargo ENUM('Gerente', 'Administrador', 'Empleado', 'Limpieza'),
    turno ENUM('matutino', 'vespertino'),
    PRIMARY KEY (id_empleado)
);

CREATE TABLE IF NOT EXISTS tienda.producto (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio_compra DECIMAL(10, 2) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    fecha_caducidad DATE NOT NULL,
    PRIMARY KEY (id_producto)
);

CREATE TABLE IF NOT EXISTS tienda.cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    edad INT(3) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    miembro ENUM('si', 'no'),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE IF NOT EXISTS tienda.venta (
    id_venta INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    compra_total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_empleado) REFERENCES tienda.empleado(id_empleado) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES tienda.cliente(id_cliente) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tienda.factura (
    id_factura INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    id_venta INT NOT NULL,
    PRIMARY KEY (id_factura),
    FOREIGN KEY (id_cliente) REFERENCES tienda.cliente(id_cliente) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES tienda.producto(id_producto) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_venta) REFERENCES tienda.venta(id_venta) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tienda.empleado (nombre, edad, email, telefono, direccion, fecha_contratacion, cargo, turno) 
VALUES 
('Juan Perez', 35, 'juan@example.com', '123456789', 'Calle 123, Ciudad', '2024-01-15', 'Gerente', 'matutino'),
('Maria Lopez', 28, 'maria@example.com', '987654321', 'Avenida 456, Ciudad', '2024-02-20', 'Administrador', 'vespertino'),
('Pedro Ramirez', 22, 'pedro@example.com', '567890123', 'Plaza 789, Ciudad', '2024-03-10', 'Empleado', 'matutino'),
('Ana Martinez', 30, 'ana@example.com', '345678901', 'Calle 234, Ciudad', '2024-04-05', 'Empleado', 'vespertino'),
('Luisa Fernandez', 33, 'luisa@example.com', '789012345', 'Avenida 567, Ciudad', '2024-05-15', 'Limpieza', 'matutino'),
('Diego Garcia', 40, 'diego@example.com', '234567890', 'Plaza 890, Ciudad', '2024-06-20', 'Empleado', 'vespertino'),
('Laura Torres', 26, 'laura@example.com', '890123456', 'Calle 345, Ciudad', '2024-07-10', 'Empleado', 'matutino'),
('Fernando Sanchez', 29, 'fernando@example.com', '457890123', 'Avenida 678, Ciudad', '2024-08-05', 'Gerente', 'vespertino'),
('Carla Ramirez', 32, 'carla@example.com', '901234578', 'Plaza 123, Ciudad', '2024-09-15', 'Empleado', 'matutino'),
('Daniel Cruz', 27, 'daniel@example.com', '678901245', 'Calle 456, Ciudad', '2024-10-20', 'Administrador', 'vespertino');

INSERT INTO tienda.producto (nombre, descripcion, precio_compra, precio_venta, fecha_caducidad) 
VALUES 
('Camisa', 'Camisa de algodón de manga corta', 20.00, 35.00, '2025-05-01'),
('Pantalón', 'Pantalón de mezclilla para hombre', 30.00, 50.00, '2025-06-01'),
('Zapatos', 'Zapatos de cuero para mujer', 40.00, 60.00, '2025-07-01'),
('Bufanda', 'Bufanda de lana suave y cálida', 15.00, 25.00, '2025-08-01'),
('Gorra', 'Gorra deportiva ajustable', 10.00, 20.00, '2025-09-01'),
('Bolso', 'Bolso de mano elegante para mujer', 50.00, 80.00, '2025-10-01'),
('Reloj', 'Reloj de pulsera analógico unisex', 60.00, 100.00, '2025-11-01'),
('Lentes de sol', 'Lentes de sol polarizados', 25.00, 40.00, '2025-12-01'),
('Paraguas', 'Paraguas plegable resistente al viento', 18.00, 30.00, '2026-01-01'),
('Calcetines', 'Calcetines de algodón suaves y cómodos', 8.00, 15.00, '2026-02-01');

INSERT INTO tienda.cliente (nombre, edad, email, telefono, miembro) 
VALUES 
('Roberto Martinez', 45, 'roberto@example.com', '551234567', 'si'),
('Elena Rodriguez', 29, 'elena@example.com', '555876543', 'no'),
('Pablo Garcia', 35, 'pablo@example.com', '555234678', 'si'),
('Isabel Fernandez', 50, 'isabel@example.com', '553456789', 'no'),
('Carmen Sanchez', 27, 'carmen@example.com', '555467890', 'si'),
('Raul Torres', 38, 'raul@example.com', '555567901', 'no'),
('Andrea Ramirez', 33, 'andrea@example.com', '555789012', 'si'),
('Javier Cruz', 42, 'javier@example.com', '555789123', 'no'),
('Monica Lopez', 31, 'monica@example.com', '555801234', 'si'),
('David Martinez', 28, 'david@example.com', '555012345', 'no');

INSERT INTO tienda.venta (fecha, id_empleado, id_cliente, compra_total) 
VALUES 
('2024-05-01', 1, 1, 100.00),
('2024-05-02', 2, 2, 80.00),
('2024-05-03', 3, 3, 120.00),
('2024-05-04', 4, 4, 60.00),
('2024-05-05', 5, 5, 150.00),
('2024-05-06', 6, 6, 90.00),
('2024-05-07', 7, 7, 110.00),
('2024-05-08', 8, 8, 70.00),
('2024-05-09', 9, 9, 130.00),
('2024-05-10', 10, 10, 50.00);

INSERT INTO tienda.factura (id_cliente, id_producto, id_venta) 
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

SELECT * FROM tienda.empleado;
SELECT * FROM tienda.producto;
SELECT * FROM tienda.cliente;
SELECT * FROM tienda.venta;
SELECT * FROM tienda.factura;

SELECT nombre, email FROM tienda.empleado;
SELECT nombre, precio_venta FROM tienda.producto;
SELECT nombre, telefono FROM tienda.cliente;

SELECT * FROM tienda.empleado WHERE edad > 30;
SELECT * FROM tienda.producto WHERE precio_venta < 50.00;
SELECT * FROM tienda.cliente WHERE miembro = 'si';

SELECT * FROM tienda.empleado ORDER BY nombre ASC;
SELECT * FROM tienda.producto ORDER BY precio_venta DESC;
SELECT * FROM tienda.cliente ORDER BY edad ASC;

SELECT COUNT(*) FROM tienda.empleado;
SELECT COUNT(*) FROM tienda.producto;
SELECT COUNT(*) FROM tienda.cliente;

SELECT SUM(compra_total) FROM tienda.venta;

SELECT MAX(precio_venta), MIN(precio_venta) FROM tienda.producto;

SELECT e.nombre, v.fecha, v.compra_total
FROM tienda.venta v
INNER JOIN tienda.empleado e ON v.id_empleado = e.id_empleado;

SELECT c.nombre, f.id_producto
FROM tienda.factura f
INNER JOIN tienda.cliente c ON f.id_cliente = c.id_cliente;

SELECT e.nombre AS empleado, c.nombre AS cliente, v.compra_total
FROM tienda.venta v
JOIN tienda.empleado e ON v.id_empleado = e.id_empleado
JOIN tienda.cliente c ON v.id_cliente = c.id_cliente
WHERE v.compra_total > 100.00;

SELECT p.nombre, p.precio_venta
FROM tienda.producto p
WHERE p.precio_venta > (
    SELECT AVG(precio_venta) FROM tienda.producto
);

SELECT nombre, fecha_contratacion
FROM tienda.empleado
WHERE YEAR(fecha_contratacion) = 2024;

SELECT nombre, 'Empleado' AS tipo
FROM tienda.empleado
UNION
SELECT nombre, 'Cliente' AS tipo
FROM tienda.cliente;

SELECT nombre, direccion
FROM tienda.empleado
WHERE direccion LIKE '%Calle%';

SELECT nombre
FROM tienda.producto
WHERE EXISTS (
    SELECT 1 FROM tienda.factura WHERE id_producto = producto.id_producto
);

SELECT nombre, precio_venta
FROM tienda.producto
ORDER BY precio_venta DESC
LIMIT 10 OFFSET 10;