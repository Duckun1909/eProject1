<?php
    include_once('conn.php');

    if(isset($_POST['login'])){
        $username = htmlspecialchars(($_POST['username']));
        $password = htmlspecialchars(($_POST['password']));
        $password = $conn->real_escape_string($password);

        $checkLogin = 1;

        if(empty($username) || empty($password)){
            $checkLogin = 0;
        }

        if($checkLogin == 0){
            echo '0';
        }else{
            $sql = sprintf("SELECT * from user where user_name = '%s' and user_password = '%s'", $username, sha1($password));
            $result = $conn->query($sql);
            if($result->num_rows>0){
                echo '1';
                session_start();
                $_SESSION["login"] = $username;
            }else{
                echo'0';
            }
        }
    }
?>