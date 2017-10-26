<?php
include_once '../mysqli_connect.php';
$sql = "SELECT * FROM practicante";
$result = $conn->query($sql);

function generateManagementButtons($id){
    $buttons='<button class="btn btn-info" id="btnInspeccionar">Inspeccionar</button>
    <button class="btn btn-warning" id="btnModificar">Modificar</button>
    <button class="btn btn-danger" id="btnDanger">Eliminar</button>';
    return $buttons;
}

if ($result) {
    echo
    "<table class='table'>".
        "<tr>".
            "<th>ID</th>".
            "<th>Número de cuenta</th>".
            "<th>Nombre del practicante</th>".
            "<th>Administrar</th>".
        "</tr>";
    while($row = $result->fetch_assoc()) {
        echo 
        "<tr>".
            "<td>".$row["id"]."</td>".
            "<td>".$row["nocta"]."</td>".
            "<td>".$row["nombre"]." ".$row["apellido1"]." ".$row["apellido2"]."</td>".
            "<td><div class='btn-group'>".generateManagementButtons($row["id"])."</div></td>".
        "</tr>";
    }
    echo
    "</table>";
} else {
    echo "<h2>No hay practicantes en la base de datos>/h2>";
}
$conn->close();