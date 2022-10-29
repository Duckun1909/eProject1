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
                $sql = "SELECT id from user where user_name = '".$username."'";
                $result = $conn->query($sql);
                echo '1';
                // if($result){
                //     echo $result->fetch_row()[0];
                // }
                session_start();
                $_SESSION["login"] = [$username, $result->fetch_row()[0]];
            }else{
                echo'0';
            }
        }
    }

    if(isset($_POST['checkLogin'])){
        session_start();
        if(isset($_SESSION['login'])){
            $user = $_SESSION['login'];
            $json = array(
                'user' => $user,
                'login' => true

            );
            echo json_encode($json);
        }
    }

    if(isset($_POST['logout'])){
        session_start();
        if(isset($_SESSION['login'])){
            session_unset();
            echo '1';
        }
    }
?>