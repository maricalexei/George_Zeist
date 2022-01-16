<?php

require("./connect_db.php");

$start = "SELECT CONCAT(startdatum, 'T', starttijd) AS Start FROM events";

$end = "SELECT CONCAT(einddatum, 'T', eindtijd) AS End FROM events";

$runstart = $conn->query($start);
$runend = $conn->query($end);

//////echo $start . '<br>';
//////echo $end;

var_dump($runstart->fetch_all());

//var_dump($runend->fetch_assoc()['End']);




?>

