<?php
    $host = 'localhost';
    $username = 'root';
    $password = '';
    $db = 'fanimationPage';

    $conn = new mysqli($host, $username, $password, $db);

    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }
    $conn -> set_charset("UTF8");
?>