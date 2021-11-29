<?php
//include the connect for the db.
include("./connect_db.php");

//sellection for the db
$slt = $conn->query("SELECT `afkorting` FROM `medewerker`");
$plt = $conn->query("SELECT `id` FROM `restaurantinschrijving`");

?>
<body>
//from for the create of the database
    <form method="post">
        <label>Judgment</label>
        <input type="text" name="oordeel" placeholder="Enter Oordeel">
        <br><br>

        <label>Results</label>
        <select name="resultaat">
            <option selected disabled>select</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>
        <br><br>

        <label>Docent</label>
        <select name="docent">
            <option selected disabled> select</option>
        <?php
        while($rows=$slt->fetch_assoc()){
            $afkorting = $rows['afkorting'];
            echo "<option value='$afkorting'>$afkorting</option>";
        }
        ?>
        </select>
        <br><br>

        <label>Inschrijving</label>
        <select name="inschrijving">
            <option selected disabled> select</option>
        <?php
        while($rows=$plt->fetch_assoc()){
            $inschrijving = $rows['id'];
            echo "<option value='$inschrijving'>$inschrijving</option>";
        }
        ?>
        </select>
        <br><br>
        //button
        <input type="submit" name="submit" value="Submit">
    </form>

    <hr>
    //The read from the database
    <h3>Results List</h3>
    <table style="width: 80%" border="1">
        <tr>
            <th>ID</th>
            <th>Inschrijving</th>
            <th>Oordeel</th>
            <th>Resultaat</th>
            <th>Docent</th>
        </tr>
        <?php
        $qry="SELECT * FROM `beoordeling`";
        $run= $conn->query($qry);
        if($run->num_rows>0){
            while($row=$run->fetch_assoc()){
        ?>
        <tr>
            <td><?php echo $row['id']?></td>
            <td><?php echo $row['inschrijving']?></td>
            <td><?php echo $row['oordeel']?></td>
            <td><?php echo $row['voldoende']?></td>
            <td><?php echo $row['begeleider']?></td>
            //edit and deletion of the items
            <td>
                <a href="#">edit</a>
                <a href="#">delete</a>
        </tr>
        <?php
            }
        }
        ?>
</body>
<?php
//insert to the database
if(isset($_POST['submit'])){
    $oordeel=$_POST['oordeel'];
    $voldoende=$_POST['resultaat'];
    $docent=$_POST['docent'];
    $lespakket=$_POST['inschrijving'];
    $qry="INSERT INTO beoordeling values(null, '$lespakket', '$oordeel', '$voldoende', '$docent', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
// looking if it works or if it gives errors
    if(mysqli_query($conn, $qry)){
        echo '<script>alert("");</script>';
    }else{
        echo mysqli_error($conn);
        }
}


?>