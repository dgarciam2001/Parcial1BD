create database parcial;
use parcial;

create table puesto(
id_puesto int primary key auto_increment
, nombre_puesto varchar(128) not null

)engine=innodb;

create table cliente(
id_cliente int primary key auto_increment
, nombre_cliente varchar(128) not null
, direccion_cliente varchar(128) not null
, nit_cliente varchar(128) not null
, telefono_cliente int(8) not null
, correo_cliente varchar(128) not null
, estatus_cliente bit not null

)engine=innodb;

create table producto(
id_producto int primary key auto_increment
, nombre_producto varchar(128) not null
, precio_producto double(10,2) not null
, fecha_caducidad date not null

)engine=innodb;

create table proveedor(
id_proveedor int primary key auto_increment
, nombre_proveedor varchar(128) not null
, direccion_proveedor varchar(128) not null
, telefono_proveedor int(8) not null
, estatus_proveedor bit not null

)engine=innodb;


create table empleado(
id_empleado int primary key auto_increment
, nombre_empleado varchar(128) not null
, apellido_empleado varchar(128) not null
, fecha_de_nacimiento date not null
, genero varchar(1) not null
, telefono int(8) not null
, direccion varchar(128) not null
, estatus bit not null
, nombre_puesto varchar(128) not null 
, id_puesto int not null

, foreign key(id_puesto) references puesto(id_puesto)

)engine=innodb;





create table inventario(
id_inventario int primary key auto_increment 
, existencia_producto_inventario int not null
, id_producto int not null
, id_proveedor int not null

, foreign key (id_producto) references producto(id_producto)
, foreign key (id_proveedor) references proveedor(id_proveedor)

)engine=innodb;

create table factura(
id_factura int primary key auto_increment
, nit varchar(128) not null
, fecha_factura date not null
, ciudad varchar(128) not null
, direccion varchar(128) not null
, telefono int(8) not null
, total double(10,2) not null
, id_cliente int not null
, id_empleado int not null
, id_producto int not null

, foreign key(id_cliente) references cliente(id_cliente)
, foreign key(id_empleado) references empleado(id_empleado)
, foreign key(id_producto) references producto(id_producto)
)engine=innodb; 

create table pedido(
id_pedido int primary key auto_increment
, cantidad int not null
, id_producto int not null
, id_cliente int not null

, foreign key (id_producto) references producto(id_producto)
, foreign key (id_cliente) references cliente(id_cliente)
)engine=innodb;



create table venta(
id_venta int primary key auto_increment
, id_cliente int not null
, id_producto int not null

, foreign key(id_cliente) references cliente(id_cliente)
, foreign key(id_producto) references producto(id_producto)

)engine=innodb;

create table compra(
id_compra int primary key auto_increment
, id_proveedor int not null
, id_producto int not null

, foreign key(id_proveedor) references proveedor(id_proveedor)
, foreign key(id_producto) references producto(id_producto)

)engine=innodb;

create table usuario(
id_usuario int primary key auto_increment
, nombre_usuario varchar(128) not null
, contraseña_usuario varchar(128) not null
, id_empleado int not null
, foreign key (id_empleado) references empleado(id_empleado)
)engine=innodb;