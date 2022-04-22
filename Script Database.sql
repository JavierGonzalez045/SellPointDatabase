CREATE DATABASE SellPoint;
USE SellPoint;

CREATE TABLE Entidades
(
IdEntidad INT IDENTITY PRIMARY KEY,
Descripcion VARCHAR(120) NOT NULL,
Direccion VARCHAR(100) NOT NULL,
Localidad VARCHAR(40) NOT NULL,
TipoEntidad VARCHAR(8) CHECK (TipoEntidad IN ('Física', 'Jurídica')) DEFAULT ('Jurídica'),
TipoDocumento VARCHAR(9) CHECK (TipoDocumento IN ('RNC', 'Cédula', 'Pasaporte')) DEFAULT ('RNC'),
NumeroDocumento INT NOT NULL UNIQUE CHECK (NumeroDocumento NOT LIKE '%[^0-9]%' AND LEN (NumeroDocumento) = 15),
Telefono VARCHAR(60) NOT NULL UNIQUE CHECK (Telefono NOT LIKE '%[^0-9]%'),
URLPaginaWeb VARCHAR(120),
URLFacebook VARCHAR(120),
URLInstagram VARCHAR(120),
URLTwitter VARCHAR(120),
URLTikTok VARCHAR(120),
Id_GrupoEntidad INT NOT NULL,
FOREIGN KEY (Id_GrupoEntidad) REFERENCES GrupoEntidades (IdGrupoEntidad),
Id_TipoEntidad INT NOT NULL,
FOREIGN KEY (Id_TipoEntidad) REFERENCES TiposEntidades (IdTipoEntidad),
LimiteCredito VARCHAR(15) DEFAULT(0),
UserNameEntidad VARCHAR(60) NOT NULL,
PassworEntidad VARCHAR(30) NOT NULL,
RolUserEntidad VARCHAR(10) CHECK (RolUserEntidad IN ('Admin', 'Supervisor','User')) DEFAULT ('User'),
Comentario VARCHAR(100),
EStatus VARCHAR(10) CHECK (EStatus IN ('Activa', 'Inactiva')) DEFAULT ('Activa'),
NoEliminable CHAR(1) CHECK (NoEliminable IN ('1','0')) DEFAULT ('0'),
FechaRegistro DATE DEFAULT(GETDATE())
);


CREATE TABLE GrupoEntidades
(
IdGrupoEntidad INT IDENTITY PRIMARY KEY,
Descripcion VARCHAR(120) NOT NULL,
Comentario VARCHAR(100),
GStatus VARCHAR(10) CHECK (GStatus IN ('Activa', 'Inactiva')) DEFAULT ('Activa'),
NoEliminable CHAR(1) CHECK (NoEliminable IN ('1', '0')) DEFAULT ('0'),
FechaRegistro DATE DEFAULT(GETDATE())
);


CREATE TABLE TiposEntidades
(
IdTipoEntidad INT IDENTITY PRIMARY KEY,
Descripcion VARCHAR(120) NOT NULL,
IdGrupoEntidad_ INT NOT NULL,
FOREIGN KEY (IdGrupoEntidad_) REFERENCES GrupoEntidades (IdGrupoEntidad),
Comentario VARCHAR(100),
TEStatus VARCHAR(10) CHECK (TEStatus IN ('Activa', 'Inactiva')) DEFAULT ('Activa'),
NoEliminable CHAR(1) CHECK (NoEliminable IN ('1','0')) DEFAULT ('0'),
FechaRegistro DATE DEFAULT(GETDATE())
);


SELECT * FROM Entidades;

SELECT * FROM GrupoEntidades;

SELECT * FROM TiposEntidades;

