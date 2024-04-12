create database if not exists TIENDA;

create table if not exists TIENDA.empleado(
	id_empleado INT NOT NULL auto_increment,
    nombree varchar(50) not null,
    edad varchar(3)not null,
    email varchar(50)not null,
    telefono varchar(10)not null,
    direccion varchar(100) not null,
    fecha_contratacion varchar(50) NOT NULL,
    cargo enum('Gerente','Administrador','Empleado','Limpieza')
    turno enum('matutino','vespertino'),
    PRiMARY KEY (id_empleado)
)

create table if not exists TIENDA.producto(
	id_producto INT NOT NULL auto_increment,
    nombrep varchar(50) not null,
    descripcion varchar(100)not null,
    precio_compra varchar(10)not null,
    precio_venta varchar(10)not null,
    Fecha_Caducidad varchar(50) not null,
    PRiMARY KEY (id_producto)
)

create table if not exists TIENDA.cliente(
	id_cliente INT NOT NULL auto_increment,
    nombrec varchar(50) not null,
    edad varchar(3)not null,
    email varchar(50)not null,
    telefono varchar(10)not null,
    miembro enum('si','no'),
    PRiMARY KEY (id_cliente)
)

create table if not exists TIENDA.venta(
	id_venta INT NOT NULL auto_increment,
    fecha varchar(25) not null,
    id_empleado varchar(25) not null,
    id_cliente varchar(15)not null,
    compra_total varchar(6)not null,
    PRiMARY KEY (id_venta)
)

create table if not exists TIENDA.factura(
	id_factura INT NOT NULL auto_increment,
    id_cliente varchar(15) not null,
    id_producto varchar(15)not null,
    id_venta varchar(15)not null,
    PRiMARY KEY (id_factura)
)
