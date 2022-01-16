<?php
//include the connect for the db.
include("./connect_db.php");
include("./functions.php");

$student=$_SESSION['email'];
//sellection for the db
$sql=$conn->query("SELECT * FROM `student` WHERE `email` = $student");



?>
<body>
    <h3>Personel information</h3>
    <table style="width: 80%" border="1">
        <tr>
            <th>studentnr</th>
            <th>voornaam</th>
            <th>tussenvoegsel</th>
            <th>achternaam</th>
            <th>mobiel</th>
            <th>woonplaats</th>
            <th>straat</th>
            <th>postcode</th>
        </tr>
        <?php
        $qryi="SELECT * FROM `student` WHERE `email`='$student'";
        $runi=$conn->query($qryi);
        if($runi->num_rows>0){
            while($rowi=$runi->fetch_assoc()){
                $studentnr=$rowi['studentnr'];
        ?>
        <tr>
            <td><?php echo $rowi['studentnr']?></td>
            <td><?php echo $rowi['voornaam']?></td>
            <td><?php echo $rowi['tussenvoegsel']?></td>
            <td><?php echo $rowi['achternaam']?></td>
            <td><?php echo $rowi['mobiel']?></td>
            <td><?php echo $rowi['woonplaats']?></td>
            <td><?php echo $rowi['straat']?></td>
            <td><?php echo $rowi['postcode']?></td>
        </tr>
        <?php
            }
        }
        ?>

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
                $id = $row['id'];
        ?>
        <tr>
            <td><?php echo $row['id']?></td>
            <td><?php echo $row['inschrijving']?></td>
            <td><?php echo $row['oordeel']?></td>
            <td><?php echo $row['voldoende']?></td>
            <td><?php echo $row['begeleider']?></td>
        </tr>
        <?php
            }
        }
        ?>
</body>