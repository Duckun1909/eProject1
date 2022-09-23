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
        $sql = "SELECT * from product";
        $result = $conn->query($sql);
        if($result){
            $row = $result->fetch_all(MYSQLI_ASSOC);
            echo json_encode($row);
        }
    }

?>