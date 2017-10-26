create database endodoncia;
use endodoncia;

create table practicante(
  id int auto_increment,
  nombre varchar(32),
  apellido1 varchar(64),
  apellido2 varchar(64),
  nocta varchar(7) unique,
  primary key (id)
);

create table paciente(
  id int auto_increment,
  nombre varchar(32),
  apellido1 varchar(64),
  apellido2 varchar(64),
  edad int,
  contacto varchar(255),
  primary key (id)
);
