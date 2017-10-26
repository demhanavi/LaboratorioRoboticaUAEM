<?php
include_once '../mysqli_connect.php';
$sql = "SELECT * FROM paciente";
$result = $conn->query($sql);

function generateManagementButtons($tablename,$id){
    $buttons='
    <div class="btn-group">
    <form action="updatePacienteForm.php" method="post">
        <input type="hidden" name="id" value="'.$id.'">
        <input type="submit" class="btn btn-warning" id="btnModificarPaciente" value="Modificar">
    </form>
    <form action="deletePaciente.php" method="post">
        <input type="hidden" name="tablename" value="'.$tablename.'">
        <input type="hidden" name="id" value="'.$id.'">
        <input type="submit" class="btn btn-danger" id="btnEliminarPaciente" value="Eliminar">
    </form>
    </div>';
    return $buttons;
}

if ($result) {
    echo
    "<button id='btnAgregarPaciente' class='btn'>Agregar paciente</button>".
    "<table class='table'>".
        "<tr>".
            "<th>Nombre del paciente</th>".
            "<th>Edad</th>".
            "<th>Contacto</th>".
            "<th>Administrar</th>".
        "</tr>";
    while($row = $result->fetch_assoc()) {
        echo 
        "<tr>".
            "<td>".$row["nombre"]." ".$row["apellido1"]." ".$row["apellido2"]."</td>".
            "<td>".$row["edad"]."</td>".
            "<td>".$row["contacto"]."</td>".
            "<td><div class='btn-group'>".generateManagementButtons('paciente',$row["id"])."</div></td>".
        "</tr>";
    }
    echo
    "</table>";
} else {
    echo "<h2>No hay practicantes en la base de datos>/h2>";
}
$conn->close();