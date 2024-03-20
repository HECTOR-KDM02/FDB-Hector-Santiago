create database if not exists TIENDA;
create table if not exists TIENDA.empleado(
	ID_empleado INT NOT NULL auto_increment,
    nombreE varchar(50) not null,
    edad varchar(3)not null,
    Email varchar(50)not null,
    Telefono varchar(10)not null,
    Direccion varchar(100) not null,
    fecha_contratacion varchar(50) NOT NULL,
    Cargo enum('Gerente','Administrador','Empleado','Limpieza')
    Turno enum('matutino','vespertino'),
    PRiMARY KEY (ID_empleado)
)
create table if not exists TIENDA.producto(
	ID_producto INT NOT NULL auto_increment,
    nombreP varchar(50) not null,
    Descripccion varchar(100)not null,
    precio_compra varchar(10)not null,
    precio_venta varchar(10)not null,
    Fecha_Caducidad varchar(50) not null,
    PRiMARY KEY (ID_producto)
)
