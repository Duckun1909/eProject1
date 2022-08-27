<?php
    include_once('conn.php');

    if(isset($_GET['addPrd'])){
        $sql = "SELECT * from user";
        $row = $conn->query($sql)->fetch_assoc();
        echo json_encode(($row));
    }

?>