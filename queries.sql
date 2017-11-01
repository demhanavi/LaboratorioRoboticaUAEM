create database laboratorio_robotica;
use laboratorio_robotica;

CREATE TABLE `materia` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL
);

CREATE TABLE `materia_prof` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `profesor_id` INTEGER,
  `materia_id` INTEGER
);


CREATE TABLE `materia_alumno`(
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `materia_id` INTEGER,
  `alumno_id` INTEGER
);

CREATE TABLE `equipo` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `materia_id` INTEGER
);

CREATE TABLE `profesor` (
  `id` INTEGER PRIMARY KEY,
  `nombre` VARCHAR(255) NOT NULL
);

CREATE TABLE `equipo_alumno` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `equipo_id` INTEGER,
  `alumno_id` INTEGER
);

CREATE TABLE `alumno` (
  `id` INTEGER PRIMARY KEY NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido1` VARCHAR(255) NOT NULL,
  `apellido2` VARCHAR(255) NOT NULL
);

CREATE TABLE `prestamo` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `equipo_id` INTEGER
);

CREATE TABLE `prestamo_arti` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `articulo_id` INTEGER,
  `cantart` INTEGER,
  `prestamo_id` INTEGER
);

CREATE TABLE `articulo` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `clave` VARCHAR(255) NOT NULL,
  `descrip` VARCHAR(255) NOT NULL,
  `foto` LONGBLOB, 
  `costo` DOUBLE,
  `pifi_id` VARCHAR(255),
  `stock` INTEGER
);

CREATE TABLE `pifi` (
  `id` VARCHAR(255) PRIMARY KEY,
  `descrip` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `fecha` DATE
);

ALTER TABLE `materia_prof` ADD CONSTRAINT `fk_mat_prof__materia` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`);
ALTER TABLE `materia_prof` ADD CONSTRAINT `fk_profesor__mat_prof` FOREIGN KEY (`profesor_id`) REFERENCES `profesor` (`id`);
ALTER TABLE `equipo` ADD CONSTRAINT `fk_equipo__materia` FOREIGN KEY (`materia_id`) REFERENCES `materia` (id);
ALTER TABLE `equipo_alumno` ADD CONSTRAINT `fk_alumno__eq__alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`);
ALTER TABLE `equipo_alumno` ADD CONSTRAINT `fk_eq_alumno__equipo` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`);
ALTER TABLE `prestamo_arti` ADD CONSTRAINT `fk_prestamo_arti__articulo` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`);
ALTER TABLE `prestamo_arti` ADD CONSTRAINT `fk_prestamo__pres_arti` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamo` (`id`);
ALTER TABLE `prestamo` ADD CONSTRAINT `fk_prestamo__equipo` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`);
ALTER TABLE `materia_alumno` ADD CONSTRAINT `fk_mat_al__materia` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`);
ALTER TABLE `materia_alumno` ADD CONSTRAINT `fk_mat_al__alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`);
ALTER TABLE `articulo` ADD CONSTRAINT `fk_articulo__p_i_f_i` FOREIGN KEY (`pifi_id`) REFERENCES `pifi` (`id`);
