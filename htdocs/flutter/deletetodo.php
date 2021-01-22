<?php
require_once "dbconfig.php";

    if(isset($_POST['todoid'])){
        $id = $_POST['todoid'];
    }else{
        $id = NULL;
    }

    $query = "DELETE FROM `todo` WHERE id = $id";
    $result = mysqli_query($connection, $query);

    echo $query;

    if($result){
        echo "\n";
        echo 'deleted.';
    }else{
        echo "\n";
        echo 'deleting failed.';
    }

    $connection->close();

?>
