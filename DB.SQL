create database if not exists tienda;

create table if not exists tienda.empleado(
	id_empleado INT NOT NULL auto_increment,
    nombree varchar(50) not null,
    edad varchar(3)not null,
    email varchar(50)not null,
    telefono varchar(10)not null,
    direccion varchar(100) not null,
    fecha_contratacion varchar(50) NOT NULL,
    cargo enum('Gerente','Administrador','Empleado','Limpieza'),
    turnos enum('matutino','vespertino'),
    PRiMARY KEY (id_empleado)
);
create table if not exists tienda.producto(
	id_producto INT NOT NULL auto_increment,
    nombrep varchar(50) not null,
    descripcion varchar(100)not null,
    precio_compra varchar(10)not null,
    precio_venta varchar(10)not null,
    Fecha_Caducidad varchar(50) not null,
    PRiMARY KEY (id_producto)
);
create table if not exists tienda.cliente(
	id_cliente INT NOT NULL auto_increment,
    nombrec varchar(50) not null,
    edad INT (3)not null,
    email varchar(50)not null,
    telefono INT (10)not null,
    miembro enum('si','no'),
    PRiMARY KEY (id_cliente)
);
create table if not exists tienda.venta(
	id_venta INT NOT NULL auto_increment,
    fecha varchar(25) not null,
    id_empleado INT not null,
    id_cliente INT not null,
    compra_total INT (10)not null,
    PRiMARY KEY (id_venta)
);
create table if not exists tienda.factura(
	id_factura INT NOT NULL auto_increment,
    id_cliente INT not null ,
    id_producto INT not null,
    id_venta INT not null,
    PRiMARY KEY (id_factura)
);



ALTER TABLE tienda.venta
ADD foreign key (id_cliente) 
references tienda.cliente(id_cliente) 
ON UPDATE CASCADE on delete CASCADE;

ALTER table tienda.venta 
add foreign key (id_empleado) 
references tienda.empleado(id_empleado) 
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER table tienda.factura 
add foreign key (id_cliente) 
references tienda.cliente(id_cliente) 
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER table tienda.factura 
add foreign key (id_producto) 
references tienda.producto(id_producto) 
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER table tienda.factura 
add foreign key (id_venta) 
references tienda.venta(id_venta) 
ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO tienda.empleado (nombree, edad, email, telefono, direccion, fecha_contratacion, cargo, turno) 
VALUES 
('Juan Perez', '35', 'juan@example.com', '1234567890', 'Calle 123, Ciudad', '2024-01-15', 'Gerente', 'matutino'),
('Maria Lopez', '28', 'maria@example.com', '9876543210', 'Avenida 456, Ciudad', '2024-02-20', 'Administrador', 'vespertino'),
('Pedro Ramirez', '22', 'pedro@example.com', '5678901234', 'Plaza 789, Ciudad', '2024-03-10', 'Empleado', 'matutino'),
('Ana Martinez', '30', 'ana@example.com', '3456789012', 'Calle 234, Ciudad', '2024-04-05', 'Empleado', 'vespertino'),
('Luisa Fernandez', '33', 'luisa@example.com', '7890123456', 'Avenida 567, Ciudad', '2024-05-15', 'Limpieza', 'matutino'),
('Diego Garcia', '40', 'diego@example.com', '2345678901', 'Plaza 890, Ciudad', '2024-06-20', 'Empleado', 'vespertino'),
('Laura Torres', '26', 'laura@example.com', '8901234567', 'Calle 345, Ciudad', '2024-07-10', 'Empleado', 'matutino'),
('Fernando Sanchez', '29', 'fernando@example.com', '4567890123', 'Avenida 678, Ciudad', '2024-08-05', 'Gerente', 'vespertino'),
('Carla Ramirez', '32', 'carla@example.com', '9012345678', 'Plaza 123, Ciudad', '2024-09-15', 'Empleado', 'matutino'),
('Daniel Cruz', '27', 'daniel@example.com', '6789012345', 'Calle 456, Ciudad', '2024-10-20', 'Administrador', 'vespertino');

INSERT INTO tienda.producto (nombrep, descripcion, precio_compra, precio_venta, Fecha_Caducidad) 
VALUES 
('Camisa', 'Camisa de algodón de manga corta', '20.00', '35.00', '2025-05-01'),
('Pantalón', 'Pantalón de mezclilla para hombre', '30.00', '50.00', '2025-06-01'),
('Zapatos', 'Zapatos de cuero para mujer', '40.00', '60.00', '2025-07-01'),
('Bufanda', 'Bufanda de lana suave y cálida', '15.00', '25.00', '2025-08-01'),
('Gorra', 'Gorra deportiva ajustable', '10.00', '20.00', '2025-09-01'),
('Bolso', 'Bolso de mano elegante para mujer', '50.00', '80.00', '2025-10-01'),
('Reloj', 'Reloj de pulsera analógico unisex', '60.00', '100.00', '2025-11-01'),
('Lentes de sol', 'Lentes de sol polarizados', '25.00', '40.00', '2025-12-01'),
('Paraguas', 'Paraguas plegable resistente al viento', '18.00', '30.00', '2026-01-01'),
('Calcetines', 'Calcetines de algodón suaves y cómodos', '8.00', '15.00', '2026-02-01');

INSERT INTO tienda.cliente (nombrec, edad, email, telefono, miembro) 
VALUES 
('Roberto Martinez', '45', 'roberto@example.com', '5551234567', 'si'),
('Elena Rodriguez', '29', 'elena@example.com', '5559876543', 'no'),
('Pablo Garcia', '35', 'pablo@example.com', '5552345678', 'si'),
('Isabel Fernandez', '50', 'isabel@example.com', '5553456789', 'no'),
('Carmen Sanchez', '27', 'carmen@example.com', '5554567890', 'si'),
('Raul Torres', '38', 'raul@example.com', '5555678901', 'no'),
('Andrea Ramirez', '33', 'andrea@example.com', '5556789012', 'si'),
('Javier Cruz', '42', 'javier@example.com', '5557890123', 'no'),
('Monica Lopez', '31', 'monica@example.com', '5558901234', 'si'),
('David Martinez', '28', 'david@example.com', '5559012345', 'no');

INSERT INTO TIENDA.venta (fecha, id_empleado, id_cliente, compra_total) 
VALUES 
('2024-05-01', '1', '1', '100.00'),
('2024-05-02', '2', '2', '80.00'),
('2024-05-03', '3', '3', '120.00'),
('2024-05-04', '4', '4', '70.00'),
('2024-05-05', '5', '5', '90.00'),
('2024-05-06', '6', '6', '110.00'),
('2024-05-07', '7', '7', '130.00'),
('2024-05-08', '8', '8', '60.00'),
('2024-05-09', '9', '9', '140.00'),
('2024-05-10', '10', '10', '75.00');
INSERT INTO TIENDA.factura (id_cliente, id_producto, id_venta) 
VALUES 
('1', '1', '1'),
('2', '2', '2'),
('3', '3', '3'),
('4', '4', '4'),
('5', '5', '5'),
('6', '6', '6'),
('7', '7', '7'),
('8', '8', '8'),
('9', '9', '9'),
('10', '10', '10');
