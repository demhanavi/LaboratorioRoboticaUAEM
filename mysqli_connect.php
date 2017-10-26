<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "endodoncia";

$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8");

if ($conn->connect_error) {
    die($conn->connect_error);
}
