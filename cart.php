<?php
    include_once('conn.php');
    if(isset($_POST['addCart'])){
        $prdID = $_POST['prdid'];
        $quantity = $_POST['quantity'];
        $total=$_POST['total'];
        $userID = $_POST['userid'];
        $sql = "SELECT * from cart where user_id = ".$userID." and product_id=".$prdID."";
        $row = $conn->query($sql)->fetch_assoc();
        if(empty($row)){
            $sql = "INSERT into cart values(null, ".$prdID.", ".$quantity.", ".$userID.")";
            if($conn->query($sql)){
                echo 1;
            }
        }else{
            $quantity+=$row['quantity'];
            if($quantity<=$total){
                $sql = "UPDATE cart set quantity = ".$quantity." where user_id = ".$userID." and product_id=".$prdID."";
                if($conn->query($sql)){
                    echo 1;
                }
            }else{
                echo 0;
            }
        }
    }


    if(isset($_POST['getCart'])){
        $userID = $_POST['userid'];
        $sql = "SELECT cart.*, product.product_name, product.product_price, product.product_avt, product.product_quantity from cart JOIN product on cart.product_id = product.id where user_id = ".$userID."";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

    if(isset($_POST['modifyCart'])){
        $cartID = $_POST['cartID'];
        $newQuanCart = $_POST['newQuanCart'];
        $total = $_POST['total'];
        if($newQuanCart<=$total){
            $sql = "UPDATE cart set quantity = ".$newQuanCart." where id = ".$cartID."";
            if($conn->query($sql)){
                echo 1;
            }
        }else{
            echo 0;
        }
    }


    if(isset($_POST['removeCart'])){
        $cartID = $_POST['cartID'];
        $sql = "DELETE from cart where id = ".$cartID."";
        if($conn->query($sql)){
            echo 1;
        }
    }

?>