<?php
include_once '../mysqli_connect.php';

$nombre = filter_input(INPUT_POST, "nombre");
$apellido1 = filter_input(INPUT_POST, "apellido1");
$apellido2 = filter_input(INPUT_POST, "apellido2");
$edad = filter_input(INPUT_POST, "edad");
$contacto = filter_input(INPUT_POST, "contacto");

$sql="INSERT INTO paciente(nombre,apellido1,apellido2,edad,contacto) VALUES('".$nombre."','".$apellido1."','".$apellido2."',".$edad.", '".$contacto."');";

$result = $conn->query($sql);

if(!$result){
    echo $conn->connect_error;
    $conn->close();
}else {
    include_once 'index.php';
}