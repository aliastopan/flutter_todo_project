<?php
require_once "dbconfig.php";

    if(isset($_POST['todoid']) && isset($_POST['todoctrl'])){
        $id = $_POST['todoid'];
        $to_do = $_POST['todoctrl']; 
    }else{
        $id = NULL;
        $to_do = NULL; 
    }

    $query = "UPDATE `todo` SET to_do = '$to_do' WHERE id = '$id'";
    $result = mysqli_query($connection, $query);

    echo "\n";
    echo $query;

    if($result){
        echo "\n";
        echo 'updated. ';      
    }else{
        echo "\n";
        echo 'updating failed.';
    }

    $connection->close();

?>