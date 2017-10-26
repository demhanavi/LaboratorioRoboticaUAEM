<!DOCTYPE html>
<html>
<head>
    <title>Pacientes</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/popper.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="js/pacientes.js"></script>
</head>
<body>
    <div class="container">
        <h1>Pacientes</h1>
        <h2>Modificar paciente</h2>
<?php
include_once '../mysqli_connect.php';
$id = filter_input(INPUT_POST,"id");
if($id){
    $sql = "SELECT * FROM paciente WHERE id=".$id.";";

    $result = $conn->query($sql);

    if($result){
        $row = $result->fetch_assoc();
        echo '
        <form action="updatePaciente.php" method="post">
            <input type="hidden" name="id" value="'.$row['id'].'">
            Nombre<input type="text" name="nombre" value="'.$row['nombre'].'"><br>
            Apellido paterno<input type="text" name="apellido1" value="'.$row['apellido1'].'"><br>
            Apellido materno<input type="text" name="apellido2" value="'.$row['apellido2'].'"><br>
            Edad<input type="nanita :3umber" name="edad" value="'.$row['edad'].'"><br>
            Información de contacto<input type="text" name="contacto" value="'.$row['contacto'].'"><br>
            <input type="submit" class="btn" value="Enviar">
        </form>
        ';
    }
}?>
</div>
</body>
