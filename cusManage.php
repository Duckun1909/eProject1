<?php
    include_once('conn.php');
    $target_file = '';
    function uploadFile($Avt){
        global $target_file;
        $name = basename($Avt['name']);
        $tmp_name = $Avt['tmp_name'];
        $size = $Avt['size'];
        $type = pathinfo($name, PATHINFO_EXTENSION);
        $error = $Avt['error'];

        // thư mục lưu file upload
        $target_dir = 'assets/uploadUser/';

        // vị trí lưu tạm trong server (file sẽ lưu trong uploads với tên giống tên ban đầu)
        $target_file = $target_dir . $name;

        // biến check
        $checkUpload = true;

        // check file đã tồn tại chưa
        if(file_exists($target_file)){
            $checkUpload = false;
        }

        // check size
        if($size > 2000000){
            $checkUpload = false;
        }

        // check đuổi mở rộng
        $typeArr = ['jpg', 'png', 'jpeg'];
        if(!in_array($type, $typeArr)){
            $checkUpload = false;
        }

        if($checkUpload){
            move_uploaded_file($tmp_name, $target_file);
        }

        return $checkUpload;
    }

    // Add user
    if(isset($_POST['addUser'])){
        $userName = htmlspecialchars($_POST['username']);
        $password = htmlspecialchars(($_POST['password']));
        $email = htmlspecialchars(($_POST['email']));
        $phone = htmlspecialchars(($_POST['phone']));
        $fullname = htmlspecialchars(($_POST['fullname']));
        $addrress = htmlspecialchars(($_POST['address']));
        $userAvt = $_FILES['uploadFile'];
        
        $checkAdd = 1;
        if(empty($userName) || empty($password) || empty($email) || empty($phone) || empty($fullname) || empty($addrress)){
            $checkAdd = 0;
        }
        if($checkAdd==1){
            if(!empty($userAvt['name'])){
                if(uploadFile($userAvt)){
                    $sql = sprintf("INSERT into user values(null, '%s', '%s', '%s', '%s', '%s', '%s', '%s')", $userName, $password, $email, $phone, $target_file, $addrress, $fullname);
                    $result = $conn->query($sql);
                }else{
                    echo '2';
                }
            }else{
                $sql = sprintf("INSERT into user values(null, '%s', '%s', '%s', '%s', '%s', '%s', '%s')", $userName, $password, $email, $phone, $target_file, $addrress, $fullname);
                $result = $conn->query($sql);
            }
            if($result){
                echo '1';
            }else{
                echo $conn->error_list[0]['sqlstate'];
            }
        }
    }

    if(isset($_POST['getUserInPage'])){
        $sql = "SELECT * from user";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

    if(isset($_POST['getTotalUser'])){
        $sql = "SELECT count(*) from user";
        $result = $conn->query($sql);
        if($result){
            $total = $result->fetch_assoc();
            echo $total['count(*)'];
        }
    }


    // Remove user
    if(isset($_POST['removeUser'])){
        $delID = htmlspecialchars($_POST['id']);
        $pathImg = $_POST['path'];
        $sql = "DELETE from user where id = ".$delID."";

        if($conn->query($sql)){
            echo '1';
            if(!empty($pathImg)){
                unlink($pathImg);
            }
        }else{
            echo '0';
        }
    }

    // if(isset($_POST['removeAll'])){
    //     $removeArr = $_POST['removeArr'];
    //     $imgArr = $_POST['imgArr'];
    //     $checkRemove = 1;
    //     foreach($removeArr as $val){
    //         $sql = "DELETE from user where id = '".$val."'";
    //         if(!$conn->query($sql)){
    //             $checkRemove = 0;
    //         }
    //     }

    //     if($checkRemove == 1){
    //         foreach($imgArr as $val){
    //             unlink($val);
    //         }
    //         echo '1';
    //     }else{
    //         echo '0';
    //     }
    // }


    // // Edit user
    // if(isset($_POST['getPrd'])){
    //     $prdID = htmlspecialchars($_POST['prdID']);
    //     $sql = "SELECT * from user where id = '".$prdID."'";
    //     $result = $conn->query($sql);
    //     if($result){
    //         $row = $result->fetch_all(MYSQLI_ASSOC);
    //         echo json_encode($row);
    //     }
    // }

    // if(isset($_POST['editPrd'])){
    //     $prdID = htmlspecialchars($_POST['prdID']);
    //     $prdName = htmlspecialchars($_POST['prdName']);
    //     $prdQuantity = htmlspecialchars($_POST['prdQuantity']);
    //     $prdQuality = htmlspecialchars($_POST['prdQuality']);
    //     $prdCate = htmlspecialchars($_POST['prdCate']);
    //     $prdBrand = htmlspecialchars($_POST['prdBrand']);
    //     $prdStatus = htmlspecialchars($_POST['prdStatus']);
    //     $prdPrice = htmlspecialchars($_POST['prdPrice']);
    //     $prdDiscount = htmlspecialchars($_POST['prdDiscount']);
    //     $prdMaterial = htmlspecialchars($_POST['prdMaterial']);
    //     $prdDescribe = htmlspecialchars($_POST['prdDescribeEdit']);
    //     $prdAvt = $_FILES['uploadFileEdit'];
    //     $pathImg = $_POST['path'];

    //     if(!empty($prdID) && !empty($prdName) && !empty($prdQuantity) && !empty($prdQuality) && !empty($prdCate) && !empty($prdBrand) && !empty($prdStatus) && !empty($prdPrice) && !empty($prdMaterial) && !empty($prdDescribe)){
    //         if(empty($prdAvt['name'])){
    //             $sql = sprintf("UPDATE user set user_name = '%s', user_quantity = %d, user_quality = %d, user_brand = %d, user_price = %.2f, 
    //             user_cate = %d, user_status = %d, user_material = %d, user_describe = '%s' where id = %d ", $prdName, $prdQuantity, $prdQuality, $prdBrand, $prdPrice, $prdCate, $prdStatus, $prdMaterial, $prdDescribe, $prdID);
    //             if($conn->query($sql)){
    //                 $sql = "SELECT user.id, user_name, user_avt, user_quantity, status.status_name, user_price, categories.cate_name  from user JOIN status ON user_status = status.id JOIN categories ON user_cate = categories.id where user.id = ".$prdID."";
    //                 $row = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
    //                 echo json_encode($row);
    //             }else{
    //                 echo '0';
    //             }  
    //         }else{
    //             if(uploadFile($prdAvt)){
    //                 unlink($pathImg);
    //                 $sql = sprintf("UPDATE user set user_name = '%s', user_quantity = %d, user_quality = %d, user_brand = %d, user_price = %.2f, 
    //                 user_cate = %d, user_status = %d, user_material = %d, user_describe = '%s', user_avt = '%s' where id = %d ", $prdName, $prdQuantity, $prdQuality, $prdBrand, $prdPrice, $prdCate, $prdStatus, $prdMaterial, $prdDescribe, $target_file, $prdID);
    //                 if($conn->query($sql)){
    //                     $sql = "SELECT user.id, user_name, user_avt, user_quantity, status.status_name, user_price, categories.cate_name  from user JOIN status ON user_status = status.id JOIN categories ON user_cate = categories.id where user.id = ".$prdID."";
    //                     $row = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
    //                     echo json_encode($row);
    //                 }else{
    //                     echo '0';
    //                 }    
    //             }else{
    //                 echo '2';
    //             }
    //         }
    //     }
    // }

    // // Search user
    // if(isset($_POST['getTotalPrdSearch'])){
    //     $searchVal = $_POST['searchVal'];

    //     $sql = "SELECT count(*) from user where user_name like '".'%'.$searchVal.'%'."'";
    //     $result = $conn->query($sql);
    //     if($result){
    //         echo $result->fetch_assoc()['count(*)'];
    //     }
    // }

    // if(isset($_POST['searchPrd'])){
    //     $searchVal = $_POST['searchVal'];
    //     $start = $_POST['start'];
    //     $limit = $_POST['limit'];
        
    //     $sql = "SELECT user.id, user_name, user_avt, user_quantity, status.status_name, user_price, categories.cate_name  from user JOIN status ON user_status = status.id JOIN categories ON user_cate = categories.id where user_name like '".'%'.$searchVal.'%'."' ORDER BY user.id  LIMIT ".$start.",".$limit." ";
    //     $result = $conn->query($sql);
    //     if($result){
    //         echo json_encode($result->fetch_all(MYSQLI_ASSOC));
    //     }
    // }

    // // Pagination
    // if(isset($_POST['getTotalPrd'])){
    //     $sql = "SELECT count(*) from user";
    //     $result = $conn->query($sql);
    //     if($result){
    //         echo $result->fetch_assoc()['count(*)'];
    //     }
    // }

    // if(isset($_POST['getPrdInPage'])){
    //     $start = $_POST['start'];
    //     $limit = $_POST['limit'];

    //     $sql = "SELECT user.id, user_name, user_avt, user_quantity, status.status_name, user_price, categories.cate_name  from user JOIN status ON user_status = status.id JOIN categories ON user_cate = categories.id ORDER BY user.id LIMIT ".$start.",".$limit." ";
    //     $result = $conn->query($sql);
    //     if($result){
    //         echo json_encode($result->fetch_all(MYSQLI_ASSOC));
    //     }
    // }
?>