<?php
include_once '../mysqli_connect.php';
?>
<form action="insertPaciente.php" method="post">
    Nombre<input type="text" name="nombre"><br>
    Apellido paterno<input type="text" name="apellido1"><br>
    Apellido materno<input type="text" name="apellido2" value=""><br>
    Edad<input type="number" name="edad"><br>
    Información de contacto<input type="text" name="contacto"><br>
    <input class="btn" type="submit" value="Enviar">
</form>