create database laboratorio_robotica;
use laboratorio_robotica;

CREATE TABLE `materia` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL
);

CREATE TABLE `mat_prof` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `prof` INTEGER,
  `idmateria` INTEGER
);

ALTER TABLE `mat_prof` ADD CONSTRAINT `fk_mat_prof__materia` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`id`);

CREATE TABLE `pifi` (
  `id` VARCHAR(255) PRIMARY KEY AUTO_INCREMENT,
  `desc` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `fecha` DATE
);

CREATE TABLE `articulo` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `clave` VARCHAR(255) NOT NULL,
  `desc` VARCHAR(255) NOT NULL,
  `foto` LONGBLOB, 
  `costo` DOUBLE,
  `pifi` VARCHAR(255),
  `stock` INTEGER
);

ALTER TABLE `articulo` ADD CONSTRAINT `fk_articulo__p_i_f_i` FOREIGN KEY (`pifi`) REFERENCES `pifi` (`id`);

CREATE TABLE `pres_arti` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `idart` INTEGER,
  `cantart` INTEGER,
  `idprest` INTEGER
);

ALTER TABLE `pres_arti` ADD CONSTRAINT `fk_pres_arti__articulo` FOREIGN KEY (`idart`) REFERENCES `articulo` (`id`);

CREATE TABLE `prestamo` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `ideq` VARCHAR(255) NOT NULL,
);

ALTER TABLE `prestamo` ADD CONSTRAINT `fk_prestamo__pres_arti` FOREIGN KEY (`ideprest`) REFERENCES `prestamo` (`id`);

CREATE TABLE `equipo` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `clase` INTEGER
);

;

ALTER TABLE `equipo` ADD CONSTRAINT `fk_equipo__materia` FOREIGN KEY (`clase`) REFERENCES `materia` ();

ALTER TABLE `prestamo` ADD CONSTRAINT `fk_equipo__prestamo` FOREIGN KEY (`ideq`) REFERENCES `equipo` (`id`);

CREATE TABLE `eq_alumno` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `ideq` INTEGER,
  `idalumno` VARCHAR(255),
);

ALTER TABLE `eq_alumno` ADD CONSTRAINT `fk_eq_alumno__equipo` FOREIGN KEY (`ideq`) REFERENCES `equipo` (`id`);

CREATE TABLE `alumno` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `appat` VARCHAR(255) NOT NULL,
  `apmat` VARCHAR(255) NOT NULL,
  `eq__alumno` INTEGER NOT NULL
);

ALTER TABLE `eq_alumno` ADD CONSTRAINT `fk_alumno__eq__alumno` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`id`);

CREATE TABLE `profesor` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL
);

ALTER TABLE `mat_prof` ADD CONSTRAINT `fk_profesor__mat_prof` FOREIGN KEY (`prof`) REFERENCES `profesor` (`id`)
