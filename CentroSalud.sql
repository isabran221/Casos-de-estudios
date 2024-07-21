-- Creación de la base de datos
CREATE DATABASE CentroSalud;
GO

USE CentroSalud;
GO

-- Creación de la tabla MEDICO
CREATE TABLE Medico (
    MedicoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(200) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL,
    Poblacion NVARCHAR(100) NOT NULL,
    Provincia NVARCHAR(100) NOT NULL,
    CodigoPostal NVARCHAR(10) NOT NULL,
    NIF NVARCHAR(20) NOT NULL,
    NumSeguridadSocial NVARCHAR(20) NOT NULL,
    NumColegiado NVARCHAR(20) NOT NULL,
    Tipo NVARCHAR(20) NOT NULL CHECK (Tipo IN ('Titular', 'Interino', 'Sustituto'))
);
GO

-- Creación de la tabla HORARIO_MEDICO
CREATE TABLE HorarioMedico (
    HorarioID INT IDENTITY(1,1) PRIMARY KEY,
    MedicoID INT NOT NULL,
    DiaSemana NVARCHAR(20) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID)
);
GO

-- Creación de la tabla SUSTITUCION_MEDICO
CREATE TABLE SustitucionMedico (
    SustitucionID INT IDENTITY(1,1) PRIMARY KEY,
    MedicoID INT NOT NULL,
    FechaAlta DATE NOT NULL,
    FechaBaja DATE NULL,
    FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID)
);
GO

-- Creación de la tabla EMPLEADO
CREATE TABLE Empleado (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(200) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL,
    Poblacion NVARCHAR(100) NOT NULL,
    Provincia NVARCHAR(100) NOT NULL,
    CodigoPostal NVARCHAR(10) NOT NULL,
    NIF NVARCHAR(20) NOT NULL,
    NumSeguridadSocial NVARCHAR(20) NOT NULL,
    Puesto NVARCHAR(50) NOT NULL CHECK (Puesto IN ('ATS', 'ATS Zona', 'Auxiliar Enfermeria', 'Celador', 'Administrativo'))
);
GO

-- Creación de la tabla VACACIONES
CREATE TABLE Vacaciones (
    VacacionesID INT IDENTITY(1,1) PRIMARY KEY,
    PersonaID INT NOT NULL,
    TipoPersona NVARCHAR(20) NOT NULL CHECK (TipoPersona IN ('Medico', 'Empleado')),
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);
GO

-- Creación de la tabla PACIENTE
CREATE TABLE Paciente (
    PacienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(200) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL,
    CodigoPostal NVARCHAR(10) NOT NULL,
    NIF NVARCHAR(20) NOT NULL,
    NumSeguridadSocial NVARCHAR(20) NOT NULL,
    MedicoID INT,
    FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID)
);
GO

-- Insertar datos en la tabla MEDICO
INSERT INTO Medico (Nombre, Direccion, Telefono, Poblacion, Provincia, CodigoPostal, NIF, NumSeguridadSocial, NumColegiado, Tipo) VALUES 
('Dr. Alejandro G. Contreras-Manzano', 'Calle 1, Cuernavaca, Morelos', '1234567890', 'Cuernavaca', 'Morelos', '62000', 'NIF001', 'SS001', 'NC001', 'Titular'),
('Dr. Carlos Alfonso Tovilla-Zarate', 'Calle 2, Comalcalco, Tabasco', '1234567891', 'Comalcalco', 'Tabasco', '86000', 'NIF002', 'SS002', 'NC002', 'Titular'),
('Dra. Isabelle Romieu', 'Calle 3, Cuernavaca, Morelos', '1234567892', 'Cuernavaca', 'Morelos', '62010', 'NIF003', 'SS003', 'NC003', 'Titular'),
('Dr. Oscar Arrieta', 'Calle 4, Ciudad de México', '1234567893', 'Ciudad de México', 'CDMX', '01000', 'NIF004', 'SS004', 'NC004', 'Interino'),
('Dr. Enrique Soto-Perez-de-Celis', 'Calle 5, Ciudad de México', '1234567894', 'Ciudad de México', 'CDMX', '01010', 'NIF005', 'SS005', 'NC005', 'Interino'),
('Dr. Carlos Alberto Becerra Laguna', 'Calle 6, Ciudad Juárez, Chihuahua', '1234567895', 'Ciudad Juárez', 'Chihuahua', '32000', 'NIF006', 'SS006', 'NC006', 'Sustituto'),
('Dr. Josué Enríquez Marín', 'Calle 7, Puebla, Puebla', '1234567896', 'Puebla', 'Puebla', '72000', 'NIF007', 'SS007', 'NC007', 'Sustituto'),
('Dr. Nain Maldonado Guzmán', 'Calle 8, Cancún, Quintana Roo', '1234567897', 'Cancún', 'Quintana Roo', '77500', 'NIF008', 'SS008', 'NC008', 'Titular'),
('Dr. José de Jesus Vargas Lares', 'Calle 9, Guadalajara, Jalisco', '1234567898', 'Guadalajara', 'Jalisco', '44100', 'NIF009', 'SS009', 'NC009', 'Titular'),
('Dr. Jesús Arturo Moyers Arevalo', 'Calle 10, Naucalpan de Juárez, Estado de México', '1234567899', 'Naucalpan de Juárez', 'Estado de México', '53000', 'NIF010', 'SS010', 'NC010', 'Interino');
GO

-- Insertar datos en la tabla EMPLEADO
INSERT INTO Empleado (Nombre, Direccion, Telefono, Poblacion, Provincia, CodigoPostal, NIF, NumSeguridadSocial, Puesto) VALUES 
('Mariana Hernández', 'Calle 15 de Mayo #10, Colonia Centro, Tlaxcala, Tlaxcala', '2345678901', 'Tlaxcala', 'Tlaxcala', '67000', 'NIF011', 'SS011', 'ATS'),
('Juan Pérez', 'Calle 5 de Febrero #23, Colonia San Gabriel, Tlaxcala, Tlaxcala', '2345678902', 'Tlaxcala', 'Tlaxcala', '67050', 'NIF012', 'SS012', 'Médico General'),
('Ana López', 'Avenida Independencia #45, Colonia La Joya, Tlaxcala, Tlaxcala', '2345678903', 'Tlaxcala', 'Tlaxcala', '67180', 'NIF013', 'SS013', 'Recepcionista'),
('Pedro García', 'Calle 20 de Noviembre #12, Colonia San Sebastián, Tlaxcala, Tlaxcala', '2345678904', 'Tlaxcala', 'Tlaxcala', '67020', 'NIF014', 'SS014', 'Camillero'),
('Isabel Ramírez', 'Calle Hidalgo #34, Colonia Tepehitec, Tlaxcala, Tlaxcala', '2345678905', 'Tlaxcala', 'Tlaxcala', '67040', 'NIF015', 'SS015', 'Trabajadora Social'),
('Carlos Gómez', 'Calle Morelos #56, Colonia Ocotlán, Tlaxcala, Tlaxcala', '2345678906', 'Tlaxcala', 'Tlaxcala', '67030', 'NIF016', 'SS016', 'Técnico de Laboratorio'),
('Laura Martínez', 'Calle Benito Juárez #78, Colonia Totolac, Tlaxcala, Tlaxcala', '2345678907', 'Tlaxcala', 'Tlaxcala', '67010', 'NIF017', 'SS017', 'Limpiadora'),
('David Flores', 'Calle Venustiano Carranza #90, Colonia Xaltocan, Tlaxcala, Tlaxcala', '2345678908', 'Tlaxcala', 'Tlaxcala', '67060', 'NIF018', 'SS018', 'Mantenimiento'),
('Patricia Sánchez', 'Calle Emiliano Zapata #102, Colonia San Nicolás, Tlaxcala, Tlaxcala', '2345678909', 'Tlaxcala', 'Tlaxcala', '67070', 'NIF019', 'SS019', 'Administradora'),
('Roberto Gutiérrez', 'Calle Francisco I. Madero #114, Colonia La Loma, Tlaxcala, Tlaxcala', '2345678910', 'Tlaxcala', 'Tlaxcala', '67080', 'NIF020', 'SS020', 'Contador');
GO

-- Insertar datos en la tabla PACIENTE
INSERT INTO Paciente (Nombre, Direccion, Telefono, CodigoPostal, NIF, NumSeguridadSocial, MedicoID) VALUES 
('José López', 'Calle 15 de Mayo #10, Colonia Centro, Tlaxcala, Tlaxcala', '3456789012', '67000', 'NIF021', 'SS021', 1),
('María Pérez', 'Calle 5 de Febrero #23, Colonia San Gabriel, Tlaxcala, Tlaxcala', '3456789013', '67050', 'NIF022', 'SS022', 2),
('Carlos Gómez', 'Avenida Independencia #45, Colonia La Joya, Tlaxcala, Tlaxcala', '3456789014', '67180', 'NIF023', 'SS023', 3),
('Ana Martínez', 'Calle Hidalgo #34, Colonia Tepehitec, Tlaxcala, Tlaxcala', '3456789015', '67040', 'NIF024', 'SS024', 4),
('Pedro Ramírez', 'Calle Morelos #56, Colonia Ocotlán, Tlaxcala, Tlaxcala', '3456789016', '67030', 'NIF025', 'SS025', 5),
('Laura Castillo', 'Calle Benito Juárez #78, Colonia Totolac, Tlaxcala, Tlaxcala', '3456789017', '67010', 'NIF026', 'SS026', 6),
('David Hernández', 'Calle Venustiano Carranza #90, Colonia Xaltocan, Tlaxcala, Tlaxcala', '3456789018', '67060', 'NIF027', 'SS027', 7),
('Patricia Flores', 'Calle Emiliano Zapata #102, Colonia San Nicolás, Tlaxcala, Tlaxcala', '3456789019', '67070', 'NIF028', 'SS028', 8),
('Roberto Ramírez', 'Calle Francisco I. Madero #114, Colonia La Loma, Tlaxcala, Tlaxcala', '3456789020', '67080', 'NIF029', 'SS029', 9),
('Isabel Gutiérrez', 'Calle 20 de Noviembre #12, Colonia San Sebastián, Tlaxcala, Tlaxcala', '3456789021', '67020', 'NIF030', 'SS030', 10);
GO

-- Insertar datos en la tabla VACACIONES
INSERT INTO Vacaciones (PersonaID, TipoPersona, FechaInicio, FechaFin) VALUES 
(1, 'Medico', '2024-08-01', '2024-08-15'),
(2, 'Medico', '2024-09-01', '2024-09-10'),
(3, 'Medico', '2024-07-20', '2024-07-30'),
(4, 'Medico', '2024-10-05', '2024-10-20'),
(5, 'Medico', '2024-08-20', '2024-08-30'),
(6, 'Empleado', '2024-07-01', '2024-07-10'),
(7, 'Empleado', '2024-08-10', '2024-08-20'),
(8, 'Empleado', '2024-09-15', '2024-09-25'),
(9, 'Empleado', '2024-07-15', '2024-07-25'),
(10, 'Empleado', '2024-10-01', '2024-10-10');
GO

-- Insertar datos en la tabla SUSTITUCION_MEDICO
INSERT INTO SustitucionMedico (MedicoID, FechaAlta, FechaBaja) VALUES 
(6, '2023-06-01', '2023-06-30'),
(7, '2023-07-01', '2023-07-15'),
(6, '2023-08-01', '2023-08-15'),
(7, '2023-09-01', '2023-09-10');
GO

-- Insertar datos en la tabla HORARIO_MEDICO
INSERT INTO HorarioMedico (MedicoID, DiaSemana, HoraInicio, HoraFin) VALUES 
(1, 'Lunes', '09:00', '13:00'),
(1, 'Martes', '09:00', '13:00'),
(2, 'Miércoles', '10:00', '14:00'),
(2, 'Jueves', '10:00', '14:00'),
(3, 'Viernes', '11:00', '15:00'),
(4, 'Lunes', '09:00', '12:00'),
(4, 'Miércoles', '09:00', '12:00'),
(5, 'Martes', '10:00', '13:00'),
(5, 'Jueves', '10:00', '13:00'),
(6, 'Viernes', '11:00', '14:00');
GO