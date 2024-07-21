-- Creación de la base de datos
CREATE DATABASE VideoClub;
GO

USE VideoClub;
GO

-- Creación de la tabla SOCIO
CREATE TABLE Socio (
    Codigo INT PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(200),
    Telefono NVARCHAR(20)
);
GO

-- Creación de la tabla DIRECTOR
CREATE TABLE Director (
    DirectorID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

-- Creación de la tabla ACTOR
CREATE TABLE Actor (
    ActorID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

-- Creación de la tabla GENERO
CREATE TABLE Genero (
    GeneroID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);
GO

-- Creación de la tabla PELICULA
CREATE TABLE Pelicula (
    PeliculaID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(100) NOT NULL,
    DirectorID INT,
    GeneroID INT,
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    FOREIGN KEY (GeneroID) REFERENCES Genero(GeneroID)
);
GO

-- Creación de la tabla REPARTO
CREATE TABLE Reparto (
    PeliculaID INT,
    ActorID INT,
    PRIMARY KEY (PeliculaID, ActorID),
    FOREIGN KEY (PeliculaID) REFERENCES Pelicula(PeliculaID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID)
);
GO

-- Creación de la tabla CINTA
CREATE TABLE Cinta (
    CintaID INT IDENTITY(1,1) PRIMARY KEY,
    Numero INT NOT NULL,
    PeliculaID INT,
    FOREIGN KEY (PeliculaID) REFERENCES Pelicula(PeliculaID)
);
GO

-- Creación de la tabla PRESTAMO
CREATE TABLE Prestamo (
    PrestamoID INT IDENTITY(1,1) PRIMARY KEY,
    SocioID INT,
    CintaID INT,
    FechaPrestamo DATE NOT NULL,
    FechaDevolucion DATE,
    FOREIGN KEY (SocioID) REFERENCES Socio(Codigo),
    FOREIGN KEY (CintaID) REFERENCES Cinta(CintaID)
);
GO

-- Creación de la tabla LISTAESPERA
CREATE TABLE ListaEspera (
    ListaEsperaID INT IDENTITY(1,1) PRIMARY KEY,
    PeliculaID INT,
    SocioID INT,
    FechaSolicitud DATE NOT NULL,
    FOREIGN KEY (PeliculaID) REFERENCES Pelicula(PeliculaID),
    FOREIGN KEY (SocioID) REFERENCES Socio(Codigo)
);
GO

-- Creación de la tabla PREFERENCIAS
CREATE TABLE Preferencias (
    SocioID INT,
    DirectorID INT,
    ActorID INT,
    GeneroID INT,
    PRIMARY KEY (SocioID, DirectorID, ActorID, GeneroID),
    FOREIGN KEY (SocioID) REFERENCES Socio(Codigo),
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    FOREIGN KEY (GeneroID) REFERENCES Genero(GeneroID)
);
GO

-- Insertar datos en la tabla DIRECTOR
INSERT INTO Director (Nombre) VALUES 
('Pete Docter'), ('Jon Watts'), ('Aaron Horvath'), ('Anthony Russo'),
('Josh Cooley'), ('Anthony Russo'), ('Lee Unkrich'), ('James Cameron'),
('Jon Favreau'), ('Greta Gerwig');
GO

-- Insertar datos en la tabla GENERO
INSERT INTO Genero (Nombre) VALUES 
('Animación'), ('Acción'), ('Aventura'), ('Ciencia ficción'),
('Fantasía'), ('Comedia'), ('Drama');
GO

-- Insertar datos en la tabla PELICULA
INSERT INTO Pelicula (Titulo, DirectorID, GeneroID) VALUES 
('Intensamente 2', 1, 1), ('Spider-Man: Sin Camino a Casa', 2, 2), 
('Super Mario Bros.: La Película', 3, 1), ('Avengers: Endgame', 4, 4),
('Toy Story 4', 5, 1), ('Avengers: Infinity War', 6, 4), 
('Coco', 7, 1), ('Avatar: El Camino del Agua', 8, 4), 
('El Rey León', 9, 1), ('Barbie', 10, 5);
GO

-- Insertar datos en la tabla CINTA
INSERT INTO Cinta (Numero, PeliculaID) VALUES 
(1, 1), (2, 1), (3, 2), (4, 3), (5, 4), 
(6, 5), (7, 6), (8, 7), (9, 8), (10, 9), (11, 10);
GO

-- Insertar datos en la tabla ACTOR
INSERT INTO Actor (Nombre) VALUES 
('Amy Poehler'), ('Tom Holland'), ('Chris Pratt'), ('Robert Downey Jr.'),
('Tom Hanks'), ('Chris Hemsworth'), ('Anthony Gonzalez'), ('Sam Worthington'),
('Donald Glover'), ('Margot Robbie');
GO

-- Insertar datos en la tabla REPARTO
INSERT INTO Reparto (PeliculaID, ActorID) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);
GO

-- Insertar datos en la tabla SOCIO
INSERT INTO Socio (Codigo, Nombre, Direccion, Telefono) VALUES 
(1, 'Juan Perez', 'Av. Siempre Viva 123', '123456789'), 
(2, 'Ana Gomez', 'Calle Falsa 456', '987654321'), 
(3, 'Luis Martinez', 'Paseo del Parque 789', '555555555');
GO

-- Insertar datos en la tabla PRESTAMO
INSERT INTO Prestamo (SocioID, CintaID, FechaPrestamo, FechaDevolucion) VALUES 
(1, 1, '2024-06-01', NULL), 
(2, 3, '2024-06-02', NULL), 
(3, 5, '2024-06-03', NULL);
GO

-- Insertar datos en la tabla LISTAESPERA
INSERT INTO ListaEspera (PeliculaID, SocioID, FechaSolicitud) VALUES 
(1, 2, '2024-06-04'), 
(2, 3, '2024-06-05'), 
(3, 1, '2024-06-06');
GO

-- Insertar datos en la tabla PREFERENCIAS
INSERT INTO Preferencias (SocioID, DirectorID, ActorID, GeneroID) VALUES 
(1, 1, 1, 1), 
(2, 2, 2, 2), 
(3, 3, 3, 3);
GO