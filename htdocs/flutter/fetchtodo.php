<?php
    require_once "dbconfig.php";

    $db_data = array();
    
    $query = "SELECT id, to_do FROM `todo` ORDER BY id DESC";
    $result = mysqli_query($connection, $query);

    if(!empty($result) && $result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            $db_data[] = $row;
        }
        echo json_encode($db_data);
    }else{
        echo "fetching failed.";  
    }

    $connection->close();
?>