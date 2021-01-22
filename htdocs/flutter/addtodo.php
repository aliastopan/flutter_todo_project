<?php
require_once "dbconfig.php";

    if(isset($_POST['todoctrl'])){
        $to_do = $_POST['todoctrl']; 
    }else{
        $to_do = "defaultsample";
    }

    $query = "INSERT INTO `todo`(`to_do`) VALUES ('$to_do')";
    $result = mysqli_query($connection, $query);

    if($result){
        echo "\n";
        echo 'added.';
    }else{
        echo "\n";
        echo 'adding failed.';
    }
    
    $connection->close();
?>