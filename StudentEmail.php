<?php 
    include("./connect_db.php");

    if(!$conn) {
        echo 'Connection Error: ' . mysqli_connect_error();
    }

    $sql = 'SELECT * voornaam, tussenvoegsel, achternaam, email FROM `medewerker';
    $result = mysqli_query($conn, $sql);
    $docent = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // print_r($Docent);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <h4 class="center grey-text">DocentInfo</h4>
    <div class="container">
        <div class="row">

            <?php foreach($docent as $info){ ?>

                <div class="col s6 md3">
                    <div class="card z-depth-0">
                        <div class="card-content center">
                            <h6><?php echo htmlspecialchars($info['voonaam']);?></h6>
                            <h6><?php echo htmlspecialchars($info['tussenvoegsel']);?></h6>
                            <h6><?php echo htmlspecialchars($info['achternaam']);?></h6>
                            <h6><?php echo htmlspecialchars($info['email']);?></h6>
                        </div>
                    </div>
                </div>

            <?php } ?>

        </div>
    </div>
</head>
<body>
    
</body>
</html>