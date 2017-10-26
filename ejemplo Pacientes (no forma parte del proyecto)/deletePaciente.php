<?php
include_once '../mysqli_connect.php';

$tablename = filter_input(INPUT_POST,"tablename");
$id = filter_input(INPUT_POST,"id");

$sql = 'DELETE FROM '.$tablename.' WHERE id='.$id.";";

$result = $conn->query($sql);

if(!$result){
    die($conn->connect_error);
    $conn->close();
}
include_once 'index.php';