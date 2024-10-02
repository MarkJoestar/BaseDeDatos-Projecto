CREATE TABLE Categoria
(
  Categoria_id INT NOT NULL,
  Nombre INT NOT NULL,
  CONSTRAINT PK_Categoria_Categoria_id PRIMARY KEY (Categoria_id)
);
GO

CREATE TABLE Cliente
(
  Id_Cliente INT NOT NULL,
  Nombre INT NOT NULL,
  DNI_Cliente INT NOT NULL,
  Correo INT NOT NULL,
  CONSTRAINT PK_Cliente_Id_Cliente PRIMARY KEY (Id_Cliente),
  CONSTRAINT UQ_Cliente_DNI_Cliente UNIQUE (DNI_Cliente)
);
GO

CREATE TABLE Rol
(
  Rol_id INT NOT NULL,
  Rol_nombre INT NOT NULL,
  CONSTRAINT PK_Rol_Rol_id PRIMARY KEY (Rol_id)
);
GO

CREATE TABLE Usuario
(
  Id_Usuario INT NOT NULL,
  DNI_Usuario INT NOT NULL,
  Correo INT NOT NULL,
  Contraseña INT NOT NULL,
  Estado INT NOT NULL,
  Rol_id INT NOT NULL,
  CONSTRAINT PK_Usuario_Id_Usuario PRIMARY KEY (Id_Usuario),
  CONSTRAINT FK_Usuario_Rol FOREIGN KEY (Rol_id) REFERENCES Rol(Rol_id),
  CONSTRAINT UQ_Usuario_DNI_Usuario UNIQUE (DNI_Usuario)
);
GO

CREATE TABLE Provedor
(
  id_provedor INT NOT NULL,
  Nombre INT NOT NULL,
  DNI INT NOT NULL,
  Correo INT NOT NULL,
  Telefono INT NOT NULL,
  CONSTRAINT PK_Provedor_id_provedor PRIMARY KEY (id_provedor)
);
GO

CREATE TABLE Permiso
(
  Id_Permiso INT NOT NULL,
  Nombre INT NOT NULL,
  Rol_id INT NOT NULL,
  CONSTRAINT PK_Permiso_Id_Permiso PRIMARY KEY (Id_Permiso),
  CONSTRAINT FK_Permiso_Rol FOREIGN KEY (Rol_id) REFERENCES Rol(Rol_id)
);
GO

CREATE TABLE Venta
(
  id_Venta INT NOT NULL,
  MontoPago INT NOT NULL,
  MontoTotal INT NOT NULL,
  FechaRegistro DATE NOT NULL,
  Id_Usuario INT NOT NULL,
  Id_Cliente INT NOT NULL,
  CONSTRAINT PK_Venta_id_Venta PRIMARY KEY (id_Venta),
  CONSTRAINT FK_Venta_Usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
  CONSTRAINT FK_Venta_Cliente FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);
GO

CREATE TABLE Producto
(
  id_Producto INT NOT NULL,
  Codigo INT NOT NULL,
  Nombre INT NOT NULL,
  Descripcion INT NOT NULL,
  Stock INT NOT NULL,
  Precio INT NOT NULL,
  Estado INT NOT NULL,
  Categoria_id INT NOT NULL,
  CONSTRAINT PK_Producto_id_Producto PRIMARY KEY (id_Producto),
  CONSTRAINT FK_Producto_Categoria FOREIGN KEY (Categoria_id) REFERENCES Categoria(Categoria_id)
);
GO

CREATE TABLE Compra
(
  id_Compra INT NOT NULL,
  Monto_Total INT NOT NULL,
  Fecha_Registro INT NOT NULL,
  id_provedor INT NOT NULL,
  CONSTRAINT PK_Compra_id_Compra PRIMARY KEY (id_Compra),
  CONSTRAINT FK_Compra_Proveedor FOREIGN KEY (id_provedor) REFERENCES Provedor(id_provedor)
);
GO

CREATE TABLE Detalle_Venta
(
  Precio_Venta INT NOT NULL,
  Cantidad INT NOT NULL,
  SubTotal INT NOT NULL,
  id_Venta INT NOT NULL,
  id_Producto INT NOT NULL,
  CONSTRAINT PK_Detalle_Venta PRIMARY KEY (id_Venta, id_Producto),
  CONSTRAINT FK_Detalle_Venta_Venta FOREIGN KEY (id_Venta) REFERENCES Venta(id_Venta),
  CONSTRAINT FK_Detalle_Venta_Producto FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto)
);
GO
  
CREATE TABLE Detalle_Compra
(
  Precio_Compra INT NOT NULL,
  Cantidad INT NOT NULL,
  Monto_Total INT NOT NULL,
  id_Compra INT NOT NULL,
  id_Producto INT NOT NULL,
  CONSTRAINT PK_Detalle_Compra PRIMARY KEY (id_Compra, id_Producto),
  CONSTRAINT FK_Detalle_Copmra_Compra FOREIGN KEY (id_Compra) REFERENCES Compra(id_Compra),
  CONSTRAINT FK_Detalle_Detalle_Compra_Producto FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto)
);
GO
