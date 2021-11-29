<?php
//including the connect from the database
    include("./connect_db.php");

if(!(conn){
    die('error in db' . mysqli_error($conn));
}

$id = $_GET['id'];

$try="DELETE FROM `beoordeling` WHERE `id`= $id";
if(mysqli_query)
?>