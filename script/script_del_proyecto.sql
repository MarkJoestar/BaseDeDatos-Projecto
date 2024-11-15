
-- DEFINNICIÓN DEL MODELO DE DATOS
-- SISTEMA DE COMPRAS/VENTAS

CREATE DATABASE SistemaCompras_Proyecto_BdD
GO

CREATE TABLE Categoria
(
  Categoria_id INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Categoria_Categoria_id PRIMARY KEY (Categoria_id)
);
GO

CREATE TABLE Cliente
(
  Id_Cliente INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  DNI_Cliente INT NOT NULL,
  Correo VARCHAR(100) NOT NULL,
  CONSTRAINT PK_Cliente_Id_Cliente PRIMARY KEY (Id_Cliente),
  CONSTRAINT UQ_Cliente_DNI_Cliente UNIQUE (DNI_Cliente)
);
GO

CREATE TABLE Rol
(
  Rol_id INT IDENTITY(1,1) NOT NULL,
  Rol_nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Rol_Rol_id PRIMARY KEY (Rol_id)
);
GO

CREATE TABLE Usuario
(
  Id_Usuario INT IDENTITY(1,1) NOT NULL,
  DNI_Usuario INT NOT NULL,
  Correo VARCHAR(100) NOT NULL,
  Contraseña VARCHAR(100) NOT NULL,
  Estado INT NOT NULL,
  Rol_id INT NOT NULL,
  CONSTRAINT PK_Usuario_Id_Usuario PRIMARY KEY (Id_Usuario),
  CONSTRAINT FK_Usuario_Rol FOREIGN KEY (Rol_id) REFERENCES Rol(Rol_id),
  CONSTRAINT UQ_Usuario_DNI_Usuario UNIQUE (DNI_Usuario)
);
GO

CREATE TABLE Proveedor
(
  Id_Proveedor INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  DNI INT NOT NULL,
  Correo VARCHAR(100) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  CONSTRAINT PK_Proveedor_Id_Proveedor PRIMARY KEY (Id_Proveedor)
);
GO

CREATE TABLE Permiso
(
  Id_Permiso INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Rol_id INT NOT NULL,
  CONSTRAINT PK_Permiso_Id_Permiso PRIMARY KEY (Id_Permiso),
  CONSTRAINT FK_Permiso_Rol FOREIGN KEY (Rol_id) REFERENCES Rol(Rol_id)
);
GO

CREATE TABLE Venta
(
  Id_Venta INT IDENTITY(1,1) NOT NULL,
  MontoPago DECIMAL(10,2) NOT NULL,
  MontoTotal DECIMAL(10,2) NOT NULL,
  FechaRegistro DATE NOT NULL,
  Id_Usuario INT NOT NULL,
  Id_Cliente INT NOT NULL,
  CONSTRAINT PK_Venta_Id_Venta PRIMARY KEY (Id_Venta),
  CONSTRAINT FK_Venta_Usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
  CONSTRAINT FK_Venta_Cliente FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);
GO

CREATE TABLE Producto
(
  Id_Producto INT IDENTITY(1,1) NOT NULL,
  Codigo VARCHAR(50) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(255),
  Stock INT NOT NULL,
  Precio DECIMAL(10,2) NOT NULL,
  Estado INT NOT NULL,
  Categoria_id INT NOT NULL,
  CONSTRAINT PK_Producto_Id_Producto PRIMARY KEY (Id_Producto),
  CONSTRAINT FK_Producto_Categoria FOREIGN KEY (Categoria_id) REFERENCES Categoria(Categoria_id)
);
GO

CREATE TABLE Compra
(
  Id_Compra INT IDENTITY(1,1) NOT NULL,
  Monto_Total DECIMAL(10,2) NOT NULL,
  Fecha_Registro DATE NOT NULL,
  Id_Proveedor INT NOT NULL,
  CONSTRAINT PK_Compra_Id_Compra PRIMARY KEY (Id_Compra),
  CONSTRAINT FK_Compra_Proveedor FOREIGN KEY (Id_Proveedor) REFERENCES Proveedor(Id_Proveedor)
);
GO

CREATE TABLE Detalle_Venta
(
  Precio_Venta DECIMAL(10,2) NOT NULL,
  Cantidad INT NOT NULL,
  SubTotal DECIMAL(10,2) NOT NULL,
  Id_Venta INT NOT NULL,
  Id_Producto INT NOT NULL,
  CONSTRAINT PK_Detalle_Venta PRIMARY KEY (Id_Venta, Id_Producto),
  CONSTRAINT FK_Detalle_Venta_Venta FOREIGN KEY (Id_Venta) REFERENCES Venta(Id_Venta),
  CONSTRAINT FK_Detalle_Venta_Producto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);
GO
  
CREATE TABLE Detalle_Compra
(
  Precio_Compra DECIMAL(10,2) NOT NULL,
  Cantidad INT NOT NULL,
  Monto_Total DECIMAL(10,2) NOT NULL,
  Id_Compra INT NOT NULL,
  Id_Producto INT NOT NULL,
  CONSTRAINT PK_Detalle_Compra PRIMARY KEY (Id_Compra, Id_Producto),
  CONSTRAINT FK_Detalle_Compra_Compra FOREIGN KEY (Id_Compra) REFERENCES Compra(Id_Compra),
  CONSTRAINT FK_Detalle_Compra_Producto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);
GO
