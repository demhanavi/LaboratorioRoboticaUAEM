<?php
include_once '../mysqli_connect.php';

$id = filter_input(INPUT_POST, "id");
$nombre = filter_input(INPUT_POST, "nombre");
$apellido1 = filter_input(INPUT_POST, "apellido1");
$apellido2 = filter_input(INPUT_POST, "apellido2");
$edad = filter_input(INPUT_POST, "edad");
$contacto = filter_input(INPUT_POST, "contacto");

$sql="UPDATE paciente SET nombre='".$nombre."' , apellido1='".$apellido1."' , apellido2='".$apellido2."', edad=".$edad.", contacto='".$contacto."' WHERE id=".$id.";";
$result = $conn->query($sql);

if(!$result){
    echo $conn->connect_error;
    $conn->close();
}
include_once 'index.php';