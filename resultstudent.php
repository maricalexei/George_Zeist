<?php

//include the connect for the db.
include("./connect_db.php");
include("./functions.php");

//sellection for the db
$slt = $conn->query("SELECT `afkorting` FROM `medewerker`");
$plt = $conn->query("SELECT `id` FROM `restaurantinschrijving`");



?>
<body>
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