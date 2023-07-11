-- Crear la base de datos SoporteApp (si no existe)
CREATE DATABASE IF NOT EXISTS SoporteApp;

-- Usar la base de datos SoporteApp
USE SoporteApp;

-- Crear la tabla Usuario
CREATE TABLE Usuario (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Edad INT,
  Correo_Electrónico VARCHAR(100),
  NumeroVecesApp INT DEFAULT 1
);

-- Crear la tabla Operario
CREATE TABLE Operario (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Edad INT,
  Correo_Electrónico VARCHAR(100),
  NumeroVecesSoporte INT DEFAULT 1
);

-- Crear la tabla Soporte
CREATE TABLE Soporte (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  OperarioId INT,
  UsuarioId INT,
  Fecha DATE,
  Evaluacion INT,
  Comentario VARCHAR(255),
  Correo_Electrónico VARCHAR(100),
  FOREIGN KEY (OperarioId) REFERENCES Operario(Id),
  FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);

-- se asigna usuario "admin" con todos los privilegios en la base de datos, contraseña "root".
USE SoporteApp;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON SoporteApp.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

-- Agregar 5 usuarios:
INSERT INTO Usuario (Nombre, Apellido, Edad, Correo_Electrónico, NumeroVecesApp)
VALUES
  ('Juan', 'Bahamondez', 30, 'juan.b@gmail.com', 3),
  ('María', 'Fuentes', 25, 'maria.f@hotmail.com', 2),
  ('Pedro', 'Ramirez', 40, 'pedro.ramirez@gmail.com', 1),
  ('Laura', 'López', 35, 'laurita@yahoo.com', 4),
  ('Carlos', 'Velazquez', 28, 'velazquez.carlos@gmail.com', 2);

-- Agregar 5 operarios:
INSERT INTO Operario (Nombre, Apellido, Edad, Correo_Electrónico, NumeroVecesSoporte)
VALUES
  ('Anita', 'Gonzalez', 32, 'a.gonzalez1212@gmail.com', 5),
  ('Julio', 'Fernández', 27, 'fernandez.ju@hotmail.com', 3),
  ('Sofía', 'Machuca', 31, 'sofi.m.a@gmail.com', 2),
  ('Javier', 'Flores', 29, 'flowers.jota@yahoo.com', 4),
  ('Elena', 'Díaz', 33, 'ely.d@gmail.com', 1);

-- Agregar 10 soportes:
INSERT INTO Soporte (OperarioId, UsuarioId, Fecha, Evaluacion, Comentario, Correo_Electrónico)
VALUES
  (1, 1, '2023-06-01', 6, 'Buena atención', 'juan.b@gmail.com'),
  (2, 2, '2023-06-02', 7, 'Excelente servicio', 'maria.f@hotmail.com'),
  (3, 3, '2023-06-03', 5, 'Podría mejorar', 'pedro.ramirez@gmail.com'),
  (4, 4, '2023-06-04', 7, 'Muy amable y eficiente', 'laurita@yahoo.com'),
  (5, 5, '2023-06-05', 4, 'Tiempo de respuesta lento', 'velazquez.carlos@gmail.com'),
  (1, 3, '2023-06-06', 6, 'Atención satisfactoria', 'juan.b@gmail.com'),
  (2, 4, '2023-06-07', 7, 'Recomendaría a otros', 'maria.f@hotmail.com'),
  (3, 5, '2023-06-08', 7, 'Muy profesional', 'pedro.ramirez@gmail.com'),
  (4, 1, '2023-06-09', 5, 'Algunas respuestas confusas', 'laurita@yahoo.com'),
  (5, 2, '2023-06-10', 6, 'Buena disposición', 'velazquez.carlos@gmail.com');

-- Seleccione las 3 operaciones con mejor evaluación.
SELECT * FROM Soporte
ORDER BY Evaluacion DESC
LIMIT 3;

-- Seleccione las 3 operaciones con menos evaluación.
SELECT * FROM Soporte
ORDER BY Evaluacion ASC
LIMIT 3;

-- Seleccione al operario que más soportes ha realizado.
SELECT OperarioId, COUNT(*) AS TotalSoportes FROM Soporte
GROUP BY OperarioId
ORDER BY TotalSoportes DESC
LIMIT 1;

-- Seleccione al cliente que menos veces ha utilizado la aplicación.
SELECT UsuarioId, COUNT(*) AS TotalUsos FROM Soporte
GROUP BY UsuarioId
ORDER BY TotalUsos ASC
LIMIT 1;

-- Agregue 10 años a los tres primeros usuarios registrados.
UPDATE Usuario
SET Edad = Edad + 10
ORDER BY Id
LIMIT 3;

-- Renombrar todas las columnas "coreo elecronico" a " email" 
-- Renombrar columna 'correo electrónico' a 'email' en la tabla Usuario
ALTER TABLE Usuario
CHANGE COLUMN `Correo_Electrónico` email VARCHAR(100);

-- Renombrar columna 'correo electrónico' a 'email' en la tabla Operario
ALTER TABLE Operario
CHANGE COLUMN `Correo_Electrónico` email VARCHAR(100);

-- Renombrar columna 'correo electrónico' a 'email' en la tabla Soporte
ALTER TABLE Soporte
CHANGE COLUMN `Correo_Electrónico` email VARCHAR(100);

-- Seleccione solo los operarios mayores de 20 años.
SELECT * FROM Operario
WHERE Edad > 20;





