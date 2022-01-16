<?php
include("./connect_db.php");  
include("./functions.php");
is_authorized(["root", "docent"]);


    
?>

    
<?php
    $sql = "SELECT * FROM `student`";
    $result = mysqli_query($conn, $sql);
    $resultCheck = mysqli_num_rows($result);

        
    $records = "";
    while ($record = mysqli_fetch_assoc($result)) {
    $records .= "<tr>
                    <th scope='row'>" . $record["studentnr"] . "</th>
                    <td>" . $record["voornaam"] .  "</td>
                    <td>" . $record["tussenvoegsel"] . "</td>
                    <td>" . $record["achternaam"] . "</td>
                    <td>" . $record["email"] . "</td>
                    <td>" . $record["woonplaats"] . "</td>
                    <td>" . $record["straat"] . "</td>
                    <td>" . $record["lespakket"] . "</td>
                    </tr>";

    }

    
    // if ($resultCheck > 0) {
    //     while ($row = mysqli_fetch_assoc($result)) {
    //         //echo $row[];
    //     }
    // }
?>

      <table class="table table-hover tableStudentInfo">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Voornaam</th>
                <th scope="col">Tussenvoegsel</th>
                <th scope="col">Achternaam</th>
                <th scope="col">Email</th>
                <th scope="col">woonplaats</th>
                <th scope="col">Straat</th>
                <th scope="col">Lespakket</th>
            </tr>
        </thead>
        <tbody>
            <?php
            echo $records
            ?>
        </tbody>
      </table>

