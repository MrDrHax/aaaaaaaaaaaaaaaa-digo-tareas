-- Si existe la BD se elimina
DROP DATABASE IF EXISTS Tarea2;

-- Se crea la base de datos
CREATE DATABASE Tarea2
    DEFAULT CHARACTER SET = 'utf16';

USE Tarea2;

-- Se definen las tablas
CREATE TABLE PAIS
(
    id SMALLINT UNSIGNED NOT NUll AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(3) NOT NULL,
    numParticipantes int NOT NULL,
    numMedallas int NOT NULL
) ENGINE = InnoDB;

CREATE TABLE DEPORTISTA
(
    matricula VARCHAR(5) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    idPais SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (idPais) REFERENCES PAIS(id)
) ENGINE=InnoDB;

CREATE TABLE DISCIPLINA
(
    id SMALLINT UNSIGNED NOT NUll AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    diciplina VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE PRUEBA
(
    id SMALLINT UNSIGNED NOT NUll AUTO_INCREMENT PRIMARY KEY,
    idDisiplina SMALLINT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(50) NOT NULL,
    numeroDeportistasInscritos INT NOT NULL,
    naturaleza VARCHAR(10) NOT NULL,
    FOREIGN KEY (idDisiplina) REFERENCES DISCIPLINA(id)
) ENGINE=InnoDB;

CREATE TABLE CLASIFICACION
(
    id SMALLINT UNSIGNED NOT NUll AUTO_INCREMENT PRIMARY KEY,
    idPrueba SMALLINT UNSIGNED NOT NULL,
    idDeportista varchar(5) NOT NULL,
    rango INT NOT NULL,
    FOREIGN KEY (idPrueba) REFERENCES PRUEBA(id),
    FOREIGN KEY (idDeportista) REFERENCES DEPORTISTA(matricula)
) ENGINE=InnoDB;

CREATE TABLE RESULTADO
(
    id SMALLINT UNSIGNED NOT NUll AUTO_INCREMENT PRIMARY KEY,
    idDisiplina SMALLINT UNSIGNED NOT NULL,
    idDeportistaOro VARCHAR(5) NOT NULL,
    idDeportistaPlata VARCHAR(5) NOT NULL,
    idDeportistaBronce VARCHAR(5) NOT NULL,
    FOREIGN KEY (idDisiplina) REFERENCES DISCIPLINA(id),
    FOREIGN KEY (idDeportistaOro) REFERENCES DEPORTISTA(matricula),
    FOREIGN KEY (idDeportistaPlata) REFERENCES DEPORTISTA(matricula),
    FOREIGN KEY (idDeportistaBronce) REFERENCES DEPORTISTA(matricula)
) ENGINE=InnoDB;
