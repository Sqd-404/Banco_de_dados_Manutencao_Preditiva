CREATE DATABASE IF NOT EXISTS Predictive_Maintence;

USE Predictive_Maintence;

CREATE TABLE IF NOT EXISTS maquina (
    machineID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(20),
    age TINYINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS comp (
	compID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS erro_tipo (
	errorID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS telemetria (
    date_time DATETIME,
    machineID SMALLINT UNSIGNED,
    volt DECIMAL(7,4),
    rotate_ DECIMAL(7,4),
    pressure DECIMAL(7,4),
    vibration DECIMAL(7,4),
    FOREIGN KEY (machineID) REFERENCES maquina(machineID),
    PRIMARY KEY (date_time, machineID)
);

CREATE TABLE IF NOT EXISTS erro (
    date_time DATETIME,
    machineID SMALLINT UNSIGNED,
    errorID TINYINT UNSIGNED,
    FOREIGN KEY (machineID) REFERENCES maquina(machineID),
	FOREIGN KEY (errorID) REFERENCES erro_tipo(errorID),
    PRIMARY KEY (date_time, machineID, errorID)
);

CREATE TABLE IF NOT EXISTS falha (
    date_time DATETIME,
    machineID SMALLINT UNSIGNED,
    compID TINYINT UNSIGNED,
    failure VARCHAR(10),
    FOREIGN KEY (machineID) REFERENCES maquina(machineID),
    FOREIGN KEY (compID) REFERENCES comp(compID),
    PRIMARY KEY (date_time, machineID, failure)
);

CREATE TABLE IF NOT EXISTS manutencao (
    date_time DATETIME,
    machineID SMALLINT UNSIGNED,
    compID TINYINT UNSIGNED,
    FOREIGN KEY (machineID) REFERENCES maquina(machineID),
    FOREIGN KEY (compID) REFERENCES comp(compID),
    PRIMARY KEY (date_time, machineID, compID)
);


INSERT INTO erro_tipo (nome) VALUES
('error1'),
('error2'),
('error3'),
('error4'),
('error5'),
('error6'),
('error7'),
('error8'),
('error9'),
('error10');

INSERT INTO comp (nome) VALUES
('comp1'),
('comp2'),
('comp3'),
('comp4'),
('comp5'),
('comp6'),
('comp7'),
('comp8'),
('comp9'),
('comp10');

INSERT INTO maquina (model, age) VALUES
('model3', 18),
('model4', 7),
('model3', 8),
('model3', 7),
('model3', 2),
('model3', 7),
('model3', 20),
('model3', 16),
('model4', 7),
('model3', 10);

INSERT INTO telemetria (date_time, machineID, volt, rotate_, pressure, vibration) VALUES 
('2015-01-01 09:00:00', 1, 176.2179, 418.5041, 113.0779, 45.0877),
('2015-01-01 06:00:00', 2, 178.1123, 419.1021, 112.0090, 46.1234),
('2015-01-01 05:00:00', 3, 175.0876, 416.0010, 115.0135, 44.2345),
('2015-01-01 03:00:00', 4, 177.0098, 420.2023, 112.4321, 45.3456),
('2015-01-01 01:00:00', 5, 174.6789, 415.7654, 116.0765, 43.4567),
('2015-01-01 02:00:00', 6, 176.3210, 417.0987, 113.1111, 45.5678),
('2015-01-01 10:00:00', 7, 178.1234, 420.8765, 111.0909, 47.6789),
('2015-01-01 16:00:00', 8, 174.4444, 415.9876, 117.0444, 42.7890),
('2015-01-01 14:00:00', 9, 177.0000, 419.1111, 114.0555, 45.8901),
('2015-01-01 20:00:00', 10, 179.2222, 422.3333, 110.0666, 48.9012);

INSERT INTO erro (date_time, machineID, errorID) VALUES 
('2023-01-06 08:30:00', 1, 1),
('2023-05-22 09:15:00', 2, 3),
('2023-06-06 10:00:00', 3, 2),
('2023-07-01 11:45:00', 1, 1),
('2023-08-02 12:30:00', 2, 4),
('2023-08-05 13:15:00', 3, 5),
('2023-09-01 14:00:00', 1, 2),
('2023-09-08 14:45:00', 2, 1),
('2023-11-06 15:30:00', 4, 3),
('2023-12-06 16:15:00', 5, 4);

INSERT INTO falha (date_time, machineID, compID, failure) VALUES 
('2023-01-13 08:30:00', 1, 1, 'comp1'),
('2023-02-15 09:15:00', 2, 2, 'comp2'),
('2023-03-22 10:00:00', 3, 3, 'comp3'),
('2023-04-30 11:45:00', 4, 4, 'comp4'),
('2023-05-15 12:30:00', 5, 5, 'comp5'),
('2023-07-10 13:15:00', 6, 6, 'comp6'),
('2023-09-11 14:00:00', 7, 7, 'comp7'),
('2023-10-06 14:45:00', 8, 8, 'comp8'),
('2023-11-08 15:30:00', 9, 9, 'comp9'),
('2023-11-25 16:15:00', 10, 10, 'comp10');

INSERT INTO manutencao (date_time, machineID, compID) VALUES 
('2023-01-13 08:30:00', 1, 1),
('2023-02-15 09:15:00', 2, 2),
('2023-03-22 10:00:00', 3, 3),
('2023-04-30 11:45:00', 4, 4),
('2023-05-15 12:30:00', 5, 5),
('2023-07-10 13:15:00', 6, 6),
('2023-09-11 14:00:00', 7, 7),
('2023-10-06 14:45:00', 8, 8),
('2023-11-08 15:30:00', 9, 9),
('2023-11-25 16:15:00', 10, 10);
