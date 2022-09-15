<?php
    include_once('conn.php');
    $target_file = '';
    function uploadFile($prdAvt){
        global $target_file;
        $name = basename($prdAvt['name']);
        $tmp_name = $prdAvt['tmp_name'];
        $size = $prdAvt['size'];
        $type = pathinfo($name, PATHINFO_EXTENSION);
        $error = $prdAvt['error'];

        // thư mục lưu file upload
        $target_dir = 'assets/uploadPrd/';

        // vị trí lưu tạm trong server (file sẽ lưu trong uploads với tên giống tên ban đầu)
        $target_file = $target_dir . $name;

        // biến check
        $checkUpload = true;

        // check file đã tồn tại chưa
        if(file_exists($target_file)){
            $checkUpload = false;
        }

        // check size
        if($size > 800000){
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

    if(isset($_POST['addPrd'])){
        $prdName = htmlspecialchars($_POST['product_name']);
        $prdQuantity = htmlspecialchars(($_POST['product_quantity']));
        $prdQuality = htmlspecialchars(($_POST['product_quality']));
        $prdCate = htmlspecialchars(($_POST['product_cate']));
        $prdBrand = htmlspecialchars(($_POST['product_brand']));
        $prdStatus = htmlspecialchars(($_POST['product_status']));
        $prdPrice = htmlspecialchars(($_POST['product_price']));
        $prdDiscount = htmlspecialchars(($_POST['product_discount']));
        $prdAvt = $_FILES['uploadFile'];
        $prdDescribe = htmlspecialchars(($_POST['product_describe']));
        $prdMaterial = htmlspecialchars(($_POST['product_material']));
        
        $checkAdd = 1;
        if(empty($prdName) || empty($prdQuantity) || empty($prdQuality) || empty($prdCate) || empty($prdBrand) || empty($prdStatus) || empty($prdPrice) || empty($prdAvt['name']) || empty($prdDescribe)){
            $checkAdd = 0;
        }
        if($checkAdd==1){
            if(uploadFile($prdAvt)){
                $sql = sprintf("INSERT into product values(null, N'%s', %d, %d, %d, %.2f, %d, '%s', %d, %d, N'%s', %d)", $prdName, $prdQuantity, $prdQuality, $prdBrand, $prdPrice, $prdCate, $target_file, $prdDiscount, $prdStatus, $prdDescribe, $prdMaterial);
                if($conn->query($sql)){
                    uploadFile($prdAvt);
                    echo '1';
                }else{
                    echo $conn->error_list[0]['sqlstate'];
                }
            }else{
                echo '2';
            }
    }
    }

    // Add value to select tag
    if(isset($_POST['addPrdSelect'])){
        switch($_POST['addPrdSelect']){
            case 'cate':
            $catename = $_POST['name'];
            $sql = "INSERT into categories values(null, '".$catename."')";
            if($conn->query($sql)){
                echo 'cate';
            }
            break;

            case 'brand':
            $brandname = $_POST['name'];
            $sql = "INSERT into brand values(null, '".$brandname."')";
            if($conn->query($sql)){
                echo 'brand';
            }
            break;

            case 'status':
            $statusname = $_POST['name'];
            $sql = "INSERT into status values(null, '".$statusname."')";
            if($conn->query($sql)){
                echo 'status';
            }
            break;

            case 'material':
            $materialname = $_POST['name'];
            $sql = "INSERT into material values(null, '".$materialname."')";
            if($conn->query($sql)){
                echo 'status';
            }
            break;
        }
    }


    // Render value to select tag
    if(isset($_POST['renderSelect'])){
        switch($_POST['renderSelect']){
            case 'cate': 
            $sql = "SELECT * from categories";
            $row = $conn->query($sql)->fetch_all();
            echo json_encode($row);
            break;

            case 'brand':
            $sql = "SELECT * from brand";
            $row = $conn->query($sql)->fetch_all();
            echo json_encode($row);
            break;

            case 'status':
            $sql = "SELECT * from status";
            $row = $conn->query($sql)->fetch_all();
            echo json_encode($row);
            break;

            case 'material':
            $sql = "SELECT * from material";
            $row = $conn->query($sql)->fetch_all();
            echo json_encode($row);
            break;
        }
    }


    // Remove product
    if(isset($_POST['delPrd'])){
        $delID = htmlspecialchars($_POST['id']);
        $pathImg = $_POST['path'];
        $sql = "DELETE from product where id = ".$delID."";

        if($conn->query($sql)){
            unlink($pathImg);
            echo '1';
        }else{
            echo '0';
        }
    }

    if(isset($_POST['removeAll'])){
        $removeArr = $_POST['removeArr'];
        $imgArr = $_POST['imgArr'];
        $checkRemove = 1;
        foreach($removeArr as $val){
            $sql = "DELETE from product where id = '".$val."'";
            if(!$conn->query($sql)){
                $checkRemove = 0;
            }
        }

        if($checkRemove == 1){
            foreach($imgArr as $val){
                unlink($val);
            }
            echo '1';
        }else{
            echo '0';
        }
    }


    // Edit product
    if(isset($_POST['getPrd'])){
        $prdID = htmlspecialchars($_POST['prdID']);
        $sql = "SELECT * from product where id = '".$prdID."'";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

    if(isset($_POST['editPrd'])){
        $prdID = htmlspecialchars($_POST['prdID']);
        $prdName = htmlspecialchars($_POST['prdName']);
        $prdQuantity = htmlspecialchars($_POST['prdQuantity']);
        $prdQuality = htmlspecialchars($_POST['prdQuality']);
        $prdCate = htmlspecialchars($_POST['prdCate']);
        $prdBrand = htmlspecialchars($_POST['prdBrand']);
        $prdStatus = htmlspecialchars($_POST['prdStatus']);
        $prdPrice = htmlspecialchars($_POST['prdPrice']);
        $prdDiscount = htmlspecialchars($_POST['prdDiscount']);
        $prdMaterial = htmlspecialchars($_POST['prdMaterial']);
        $prdDescribe = htmlspecialchars($_POST['prdDescribeEdit']);
        $prdAvt = $_FILES['uploadFileEdit'];
        $pathImg = $_POST['path'];

        if(!empty($prdID) && !empty($prdName) && !empty($prdQuantity) && !empty($prdQuality) && !empty($prdCate) && !empty($prdBrand) && !empty($prdStatus) && !empty($prdPrice) && !empty($prdMaterial) && !empty($prdDescribe)){
            if(empty($prdAvt['name'])){
                $sql = sprintf("UPDATE product set product_name = '%s', product_quantity = %d, product_quality = %d, product_brand = %d, product_price = %.2f, 
                product_cate = %d, product_status = %d, product_material = %d, product_describe = '%s' where id = %d ", $prdName, $prdQuantity, $prdQuality, $prdBrand, $prdPrice, $prdCate, $prdStatus, $prdMaterial, $prdDescribe, $prdID);
                if($conn->query($sql)){
                    $sql = "SELECT product.id, product_name, product_avt, product_quantity, status.status_name, product_price, categories.cate_name  from product JOIN status ON product_status = status.id JOIN categories ON product_cate = categories.id where product.id = ".$prdID."";
                    $row = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
                    echo json_encode($row);
                }else{
                    echo '0';
                }  
            }else{
                if(uploadFile($prdAvt)){
                    unlink($pathImg);
                    $sql = sprintf("UPDATE product set product_name = '%s', product_quantity = %d, product_quality = %d, product_brand = %d, product_price = %.2f, 
                    product_cate = %d, product_status = %d, product_material = %d, product_describe = '%s', product_avt = '%s' where id = %d ", $prdName, $prdQuantity, $prdQuality, $prdBrand, $prdPrice, $prdCate, $prdStatus, $prdMaterial, $prdDescribe, $target_file, $prdID);
                    if($conn->query($sql)){
                        $sql = "SELECT product.id, product_name, product_avt, product_quantity, status.status_name, product_price, categories.cate_name  from product JOIN status ON product_status = status.id JOIN categories ON product_cate = categories.id where product.id = ".$prdID."";
                        $row = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
                        echo json_encode($row);
                    }else{
                        echo '0';
                    }    
                }else{
                    echo '2';
                }
            }
        }
    }

    // Search product
    if(isset($_POST['getTotalPrdSearch'])){
        $searchVal = $_POST['searchVal'];

        $sql = "SELECT count(*) from product where product_name like '".'%'.$searchVal.'%'."'";
        $result = $conn->query($sql);
        if($result){
            echo $result->fetch_assoc()['count(*)'];
        }
    }

    if(isset($_POST['searchPrd'])){
        $searchVal = $_POST['searchVal'];
        $start = $_POST['start'];
        $limit = $_POST['limit'];
        
        $sql = "SELECT product.id, product_name, product_avt, product_quantity, status.status_name, product_price, categories.cate_name  from product JOIN status ON product_status = status.id JOIN categories ON product_cate = categories.id where product_name like '".'%'.$searchVal.'%'."' ORDER BY product.id  LIMIT ".$start.",".$limit." ";
        $result = $conn->query($sql);
        if($result){
            echo json_encode($result->fetch_all(MYSQLI_ASSOC));
        }
    }

    // Pagination
    if(isset($_POST['getTotalPrd'])){
        $sql = "SELECT count(*) from product";
        $result = $conn->query($sql);
        if($result){
            echo $result->fetch_assoc()['count(*)'];
        }
    }

    if(isset($_POST['getPrdInPage'])){
        $start = $_POST['start'];
        $limit = $_POST['limit'];

        $sql = "SELECT product.id, product_name, product_avt, product_quantity, status.status_name, product_price, categories.cate_name  from product JOIN status ON product_status = status.id JOIN categories ON product_cate = categories.id ORDER BY product.id LIMIT ".$start.",".$limit." ";
        $result = $conn->query($sql);
        if($result){
            echo json_encode($result->fetch_all(MYSQLI_ASSOC));
        }
    }
?>