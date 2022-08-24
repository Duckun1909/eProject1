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

        if(empty($fullname) || empty($username) || empty($password) || empty($comfirm_pass) || empty($phone) || empty($address) || empty($email)){
            $checkRegister = 0;
        }
    
        if($password != $comfirm_pass){
            $checkRegister = 0;
        }

        if($checkRegister == 0){
            echo '0';
        }else{
            $sql = sprintf("INSERT into user values(null, '%s', '%s', '%s', %d, null, N'%s', N'%s')", $username, sha1($password), $email, $phone, $address, $fullname);
            if($conn->query($sql)){
                echo '1';
            }else{
                echo '0';
            }
        }
    }

    if(isset($_POST['nameCheck'])){
        $checkDuplicate = $_POST['checkDuplicate'];
        $nameCheck = $_POST['nameCheck'];

        switch($nameCheck){
            case 'username': 
            $sql = "SELECT * from user where user_name = '".$checkDuplicate."'";
            $result = $conn->query($sql);
            echo $result->num_rows > 0?'0':'1';
            break;

            case 'email':
            $sql = "SELECT * from user where user_email = '".$checkDuplicate."'";
            $result = $conn->query($sql);
            echo $result->num_rows > 0?'0':'1';
            break;

            case 'phone':
            $sql = "SELECT * from user where user_phone = '".$checkDuplicate."'";
            $result = $conn->query($sql);
            echo $result->num_rows > 0?'0':'1';
            break;
        }
    }

    
?>