<?php
    $host = 'sql106.infinityfree.com';
    $username = 'epiz_32650604';
    $password = 'GzfN1ntxr2';
    $db = 'epiz_32650604_FanimationPage';

    $conn = new mysqli($host, $username, $password, $db);

    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }
    $conn -> set_charset("UTF8");
?>
