<?php
    include('conn.php');
    if(isset($_POST['register'])){
        $fullname = htmlspecialchars($_POST['userFullname']);
        $username = htmlspecialchars($_POST['username']);
        $password = htmlspecialchars($_POST['password']);
        $comfirm_pass =htmlspecialchars($_POST['confirmPassword']);
        $phone = htmlspecialchars($_POST['phone']);
        $email = htmlspecialchars($_POST['email']);
        $address = htmlspecialchars($_POST['address']);
        $securCode = htmlspecialchars($_POST['securCode']);

        $password = $conn->real_escape_string($password);

        $checkRegister = 1;

        if(empty($fullname) || empty($username) || empty($password) || empty($comfirm_pass) || empty($phone)){
            $checkRegister = 0;
        }
    
        if($checkRegister == 0){
            echo '0';
        }else{
            $sql = sprintf("INSERT into user values(null, '%s', '%s', '%s', %d, null, '%s', N'%s')", $username, sha1($password), $email, $phone, $address, $fullname);
            if($conn->query($sql)){
                var_dump($sql);
                // echo '1';
            }else{
                var_dump($sql);
            }

        }
    }
?>