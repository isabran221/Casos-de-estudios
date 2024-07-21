-- Creación de la base de datos
CREATE DATABASE CompaniaAerea;
GO

USE CompaniaAerea;
GO

-- Creación de la tabla BASE
CREATE TABLE Base (
    BaseID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

-- Creación de la tabla PERSONA
CREATE TABLE Persona (
    PersonaID INT IDENTITY(1,1) PRIMARY KEY,
    Codigo INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Tipo NVARCHAR(50) NOT NULL CHECK (Tipo IN ('Piloto', 'Miembro')),
    HorasVuelo INT NULL,
    BaseID INT,
    FOREIGN KEY (BaseID) REFERENCES Base(BaseID)
);
GO

-- Creación de la tabla AVION
CREATE TABLE Avion (
    AvionID INT IDENTITY(1,1) PRIMARY KEY,
    Codigo NVARCHAR(50) NOT NULL,
    Tipo NVARCHAR(100) NOT NULL,
    BaseID INT,
    FOREIGN KEY (BaseID) REFERENCES Base(BaseID)
);
GO

-- Creación de la tabla VUELO
CREATE TABLE Vuelo (
    VueloID INT IDENTITY(1,1) PRIMARY KEY,
    NumVuelo NVARCHAR(20) NOT NULL,
    Origen NVARCHAR(100) NOT NULL,
    Destino NVARCHAR(100) NOT NULL,
    Hora TIME NOT NULL,
    Fecha DATE NOT NULL,
    AvionID INT,
    PilotoID INT,
    FOREIGN KEY (AvionID) REFERENCES Avion(AvionID),
    FOREIGN KEY (PilotoID) REFERENCES Persona(PersonaID)
);
GO

-- Creación de la tabla TRIPULACION_VUELO
CREATE TABLE TripulacionVuelo (
    VueloID INT,
    MiembroID INT,
    PRIMARY KEY (VueloID, MiembroID),
    FOREIGN KEY (VueloID) REFERENCES Vuelo(VueloID),
    FOREIGN KEY (MiembroID) REFERENCES Persona(PersonaID)
);
GO

-- Insertar datos en la tabla BASE
INSERT INTO Base (Nombre) VALUES 
('Base Aérea de Santa Lucía'), ('Base Aérea de Tijuana'), 
('Base Aérea de Monterrey'), ('Base Aérea de Guadalajara');
GO

-- Insertar datos en la tabla AVION
INSERT INTO Avion (Codigo, Tipo, BaseID) VALUES 
('Vought F10F-4 Panther', 'Caza', 1), 
('North American F-86 Sabre', 'Caza', 1), 
('Dassault Mirage 5', 'Caza', 2), 
('Aeritalia AMX', 'Ataque a tierra', 2), 
('Sukhoi Su-27 Flanker', 'Caza', 3), 
('Lockheed Martin F-16 Fighting Falcon', 'Caza', 3), 
('Boeing 727', 'Pasajeros', 4), 
('McDonnell Douglas DC-9', 'Pasajeros', 4), 
('Embraer ERJ-145', 'Pasajeros', 1), 
('Bombardier CRJ-700', 'Pasajeros', 2);
GO

-- Insertar datos en la tabla PERSONA para Pilotos
INSERT INTO Persona (Codigo, Nombre, Tipo, HorasVuelo, BaseID) VALUES 
(1001, 'Francisco Sarabia Tinoco', 'Piloto', 2000, 1), 
(1002, 'Gustavo Díaz Ordaz Bolaños', 'Piloto', 1500, 1), 
(1003, 'Valentín Terrazas', 'Piloto', 1800, 2), 
(1004, 'Poncho Rivera', 'Piloto', 1600, 2), 
(1005, 'Eduardo Salas Cravioto', 'Piloto', 2200, 3), 
(1006, 'Carmen Moreno de Vega', 'Piloto', 1900, 3), 
(1007, 'Rodolfo Castillo Torres', 'Piloto', 2100, 4), 
(1008, 'Vicente "Chava" Ruiz', 'Piloto', 1700, 4), 
(1009, 'Lorena Valero', 'Piloto', 2000, 1), 
(1010, 'Tania Deniz', 'Piloto', 1600, 2);
GO

-- Insertar datos en la tabla PERSONA para Miembros de tripulación
INSERT INTO Persona (Codigo, Nombre, Tipo, BaseID) VALUES 
(2001, 'Tripulación del Vuelo 702 de Aeroméxico', 'Miembro', 1), 
(2002, 'Tripulación del Vuelo 2433 de Mexicana', 'Miembro', 2);
GO

-- Insertar datos en la tabla VUELO
INSERT INTO Vuelo (NumVuelo, Origen, Destino, Hora, Fecha, AvionID, PilotoID) VALUES 
('IB-8830', 'Palma', 'Alicante', '13:50', '2024-07-15', 1, 1), 
('AM-1234', 'Ciudad de México', 'Guadalajara', '09:00', '2024-07-16', 2, 2), 
('MX-5678', 'Tijuana', 'Monterrey', '14:30', '2024-07-17', 3, 3), 
('IB-8831', 'Alicante', 'Palma', '17:00', '2024-07-18', 4, 4), 
('AM-1235', 'Guadalajara', 'Ciudad de México', '12:00', '2024-07-19', 5, 5);
GO

-- Insertar datos en la tabla TRIPULACION_VUELO
INSERT INTO TripulacionVuelo (VueloID, MiembroID) VALUES 
(1, 1), 
(2, 2), 
(3, 1), 
(4, 2), 
(5, 1);
GO