<?php
    include('conn.php');
    if(isset($_POST['getCate'])){
        $sql = "SELECT * from categories";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

    if(isset($_POST['getPrd'])){
        $sql = "SELECT prd.*, cate_name, brand_name, material_name from `product` as prd JOIN `categories` as cate  ON prd.product_cate = cate.id 
        JOIN `brand` ON prd.product_brand = brand.id JOIN `material` on prd.product_material = material.id ORDER BY prd.id";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

    if(isset($_POST['getGallery'])){
        $prdID = $_POST['prdID'];
        $sql = "SELECT img from gallery where product_id=".$prdID."";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_array(MYSQLI_NUM);
            echo json_encode($row);
        }
    }

    if(isset($_POST['addComment'])){
        $userid = $_POST['userid'];
        $prdID = $_POST['prdID'];
        $content = $_POST['content'];
        $date = $_POST['date'];
        $sql = sprintf("INSERT into comments values(null, %d, '%s', null, '%s', %d)", $prdID, $content, $date, $userid);
        if($conn->query($sql)){
            echo '1';
        }
    }

    if(isset($_POST['getComment'])){
        $sql = "SELECT comments.*, user.user_name, user.user_avt from comments JOIN `user` on user_id = user.id";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

    if(isset($_POST['removeCmt'])){
        $cmtID = $_POST['removeCmt'];
        $sql = "DELETE from comments where id = ".$cmtID."";
        if($conn->query($sql)){
            echo 1;
        }
    }

    if(isset($_POST['updateCmt'])){
        $cmtID = $_POST['updateCmt'];
        $contentEdit = $_POST['contentEdit'];
        $date = $_POST['date'];
        $sql = "UPDATE comments set content = '".$contentEdit."', cmt_date='".$date."' where id = ".$cmtID."";
        if($conn->query($sql)){
            echo 1;
        }
    }

    if(isset($_POST['getSomething'])){
        $thing = $_POST['thing'];
        $sql = "SELECT * from ".$thing."";
        $result=$conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

    if(isset($_POST['getUser'])){
        $userid = $_POST['userid'];
        $sql = "SELECT * from user where id = ".$userid."";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_assoc();
            echo json_encode($row);
        }
    }


    if(isset($_POST['addOrder'])){
        $userid = $_POST['user_id'];
        $shipAddress = $_POST['shippingAddress'];
        $shipPhone = $_POST['shippingPhone'];
        $shipName = $_POST['shippingName'];
        $shipDate = $_POST['shippingDate'];
        $shipNote = $_POST['shippingNote'];
        
        if(empty($shipAddress || $shipName || $shipPhone)){
            echo 0;
        }else{
            $sql = sprintf("INSERT into orders values(null, %d, '%s', '%s', '%s', '%s', '%s')", $userid, $shipName, $shipPhone, $shipAddress, $shipNote, $shipDate);
            $result= $conn->query($sql);
            if($result){
                $sql = "SELECT id from orders where user_id=".$userid." and shipping_date ='".$shipDate."'";
                $row = $conn->query($sql)->fetch_assoc();
                $orderid = $row['id'];
                if(!empty($row)){
                    $sql = "SELECT * from cart join product on product.id = cart.product_id where user_id = ".$userid."";
                    $row = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
                    foreach($row as $val){
                        $sql = sprintf("INSERT into orderdetails values(null, %d, %d, %d, %d)", $orderid, $val['product_id'], $val['quantity'], $val['product_price']);
                        if($conn->query($sql)){
                            $sql = "DELETE from cart where user_id = ".$userid."";
                            if($conn->query($sql)){
                                echo '1';
                            }
                        }
                    }
                }
            }
        }
    }

    if(isset($_POST['addOrderDetails'])){
        $userid = $_POST['userid'];
        $date = $_POST['date'];
        
    }
?>