create database laboratorio_robotica;
use laboratorio_robotica;

create table paciente(
  id int auto_increment,
  nombre varchar(32),
  apellido1 varchar(64),
  apellido2 varchar(64),
  edad int,
  contacto varchar(255),
  primary key (id)
);
