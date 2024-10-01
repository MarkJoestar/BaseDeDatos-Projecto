CREATE TABLE Categoria
(
  Categoria_id INT NOT NULL,
  Nombre INT NOT NULL,
  PRIMARY KEY (Categoria_id)
);

CREATE TABLE Cliente
(
  Id_Cliente INT NOT NULL,
  Nombre INT NOT NULL,
  DNI_Cliente INT NOT NULL,
  Correo INT NOT NULL,
  PRIMARY KEY (Id_Cliente),
  UNIQUE (DNI_Cliente)
);

CREATE TABLE Rol
(
  Rol_id INT NOT NULL,
  Rol_nombre INT NOT NULL,
  PRIMARY KEY (Rol_id)
);

CREATE TABLE Usuario
(
  Id_Usuario INT NOT NULL,
  DNI_Usuario INT NOT NULL,
  Correo INT NOT NULL,
  Contraseña INT NOT NULL,
  Estado INT NOT NULL,
  Rol_id INT NOT NULL,
  PRIMARY KEY (Id_Usuario),
  FOREIGN KEY (Rol_id) REFERENCES Rol(Rol_id),
  UNIQUE (DNI_Usuario)
);

CREATE TABLE Provedor
(
  id_provedor INT NOT NULL,
  Nombre INT NOT NULL,
  DNI INT NOT NULL,
  Correo INT NOT NULL,
  Telefono INT NOT NULL,
  PRIMARY KEY (id_provedor)
);

CREATE TABLE Permiso
(
  Id_Permiso INT NOT NULL,
  Nombre INT NOT NULL,
  Rol_id INT NOT NULL,
  PRIMARY KEY (Id_Permiso),
  FOREIGN KEY (Rol_id) REFERENCES Rol(Rol_id)
);

CREATE TABLE Venta
(
  id_Venta INT NOT NULL,
  MontoPago INT NOT NULL,
  MontoTotal INT NOT NULL,
  FechaRegistro DATE NOT NULL,
  Id_Usuario INT NOT NULL,
  Id_Cliente INT NOT NULL,
  PRIMARY KEY (id_Venta),
  FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
  FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

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
  PRIMARY KEY (id_Producto),
  FOREIGN KEY (Categoria_id) REFERENCES Categoria(Categoria_id)
);

CREATE TABLE Compra
(
  id_Compra INT NOT NULL,
  Monto_Total INT NOT NULL,
  Fecha_Registro INT NOT NULL,
  id_provedor INT NOT NULL,
  PRIMARY KEY (id_Compra),
  FOREIGN KEY (id_provedor) REFERENCES Provedor(id_provedor)
);

CREATE TABLE Detalle_Venta
(
  Precio_Venta INT NOT NULL,
  Cantidad INT NOT NULL,
  SubTotal INT NOT NULL,
  id_Venta INT NOT NULL,
  id_Producto INT NOT NULL,
  PRIMARY KEY (id_Venta, id_Producto),
  FOREIGN KEY (id_Venta) REFERENCES Venta(id_Venta),
  FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto)
);

CREATE TABLE Detalle_Compra
(
  Precio_Compra INT NOT NULL,
  Cantidad INT NOT NULL,
  Monto_Total INT NOT NULL,
  id_Compra INT NOT NULL,
  id_Producto INT NOT NULL,
  PRIMARY KEY (id_Compra, id_Producto),
  FOREIGN KEY (id_Compra) REFERENCES Compra(id_Compra),
  FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto)
);
