<?php
    include_once('conn.php');
    session_start();
    if(isset($_SESSION['login'])){
        mysqli_set_charset($conn, 'UTF8');
        $username = $_SESSION['login'];
        $sql = "SELECT * from user where user_name = '".$username."'";
        $userInfor = $conn->query($sql)->fetch_assoc();
        echo json_encode($userInfor);
    }
?>