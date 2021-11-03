DROP DATABASE campanita;
CREATE DATABASE campanita;
USE campanita;
CREATE TABLE Usuario (
	ID_Usuario int NOT NULL PRIMARY KEY,
	Nombre varchar(60) NOT NULL,
	Perfil SET('Directora','Docente','Estudiante') NOT NUlL,
	Email varchar(40)
);

CREATE TABLE Mensaje (
	ID_Mensaje int NOT NULL PRIMARY KEY,
	ID_Remitente int NOT NULL,
	ID_Destinatario int NOT NULL,
	Contenido varchar(2000) NOT NULL,
	Fecha DATETIME NOT NULL,
	FOREIGN KEY (ID_Remitente) REFERENCES Usuario(ID_Usuario),
	FOREIGN KEY (ID_Destinatario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Grupo (
	ID_Grupo int NOT NULL PRIMARY KEY,
	Nombre varchar(40) NOT NULL
);

CREATE TABLE Contiene (
	ID_Grupo_Usuario int NOT NULL PRIMARY KEY,
	ID_Grupo int NOT NULL,
	ID_Usuario int NOT NULL,
	FOREIGN KEY (ID_Grupo) REFERENCES Grupo(ID_Grupo),
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Anuncio (
	ID_Anuncio int NOT NULL PRIMARY KEY,
	Descripcion varchar(2000) NOT NULL
);


CREATE TABLE Recibe (
	ID_Grupo_Anuncio int NOT NULL PRIMARY KEY,
	ID_Grupo int NOT NULL,
	ID_Anuncio int NOT NULL,
	FOREIGN KEY (ID_Grupo) REFERENCES Grupo(ID_Grupo),
	FOREIGN KEY (ID_Anuncio) REFERENCES Anuncio(ID_Anuncio)
);

CREATE TABLE Evento (
	ID_Evento int NOT NULL PRIMARY KEY,
	Descripcion varchar(2000) NOT NULL,
	Fecha DATETIME NOT NULL
);

CREATE TABLE Agenda (
	ID_Grupo_Evento int NOT NULL PRIMARY KEY,
	ID_Grupo int NOT NULL,
	ID_Evento int NOT NULL,
	FOREIGN KEY (ID_Grupo) REFERENCES Grupo(ID_Grupo),
	FOREIGN KEY (ID_Evento) REFERENCES Evento(ID_Evento)
);

CREATE TABLE Clase (
	ID_Clase int NOT NULL PRIMARY KEY,
	Titulo varchar(60) NOT NULL,
	Fecha DATETIME NOT NULL,
	Link varchar(120) NOT NULL
);

CREATE TABLE Asiste (
	ID_Grupo_Clase int NOT NULL PRIMARY KEY,
	ID_Grupo int NOT NULL,
	ID_Clase int NOT NULL,
	FOREIGN KEY (ID_Grupo) REFERENCES Grupo(ID_Grupo),
	FOREIGN KEY (ID_Clase) REFERENCES Clase(ID_Clase)
);

CREATE TABLE Documento (
	ID_Documento int NOT NULL PRIMARY KEY,
	Ruta varchar(120) NOT NULL,
	Fecha DATETIME NOT NULL
);

CREATE TABLE Descarga (
	ID_Grupo_Clase int NOT NULL PRIMARY KEY,
	ID_Grupo int NOT NULL,
	ID_Documento int NOT NULL,
	FOREIGN KEY (ID_Grupo) REFERENCES Grupo(ID_Grupo),
	FOREIGN KEY (ID_Documento) REFERENCES Documento(ID_Documento)
);