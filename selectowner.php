<?php
    include("./connect_db.php");
?>

<!DOCTYPE html>
<html>
<head>
   <title></title>
</head>
<body>
    
<?php
    $sql = "SELECT * FROM `KLANT`";
    $result = mysqli_query($conn, $sql);
    $resultCheck = mysqli_num_rows($result);

        
    $records = "";
    while ($record = mysqli_fetch_assoc($result)) {
    $records .= "<tr>
                    <th scope='row'>" . $record["id"] . "</th>
                    <td>" . $record["voornaam"] .  "</td>
                    <td>" . $record["tussenvoegsel"] . "</td>
                    <td>" . $record["achternaam"] . "</td>
                    <td>" . $record["email"] . "</td>
                    <td>" . $record["mobiel"] . "</td>
                    <td>
                    <a href='./update.php?id=" . $record["id"] . "'>
                    <img src='./img/icons/b_edit.png' alt='pensil'>
                    </a>
                    </td>
                    <td>
                    <a href='./delete.php?id=" . $record["id"] . "'>
                    <img src='./img/icons/b_drop.png' alt='cross'>
                    </a>
                </td>
                    </tr>";

    }

    
    // if ($resultCheck > 0) {
    //     while ($row = mysqli_fetch_assoc($result)) {
    //         //echo $row[];
    //     }
    // }
    var_dump($sql);
?>`
<div class="row">
      <div class="col-12">
      <table class="table table-hover">
            <thead>
                <tr>
                <th scope="col">#</th>
                <th scope="col">Voornaam</th>
                <th scope="col">Tussenvoegsel</th>
                <th scope="col">Achternaam</th>
                <th scope="col"></th>
                <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
<?php
echo $records
?>