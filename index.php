<?php
ob_start();
session_start();
?>
<script src="./js/script.js"></script>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="http://fonts.cdnfonts.com/css/akzidenz-grotesk-next" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
    <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
    <link href='./node_modules/fullcalendar/main.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>George Zeist</title>
</head>
<body>
<main>
    <section class="container-fluid" >
        <div class="row">
            <div class="col-12" style="height: 200px; border-bottom: black; border-top: black">
                <img src="./img/banner.svg" alt="George Marina" class="mx-auto d-block" style="padding-top: 30px; height: 190px">
            </div>
        </div>
    </section>
    <section class="container-fluid">
        <div class="row">
            <div class="col-12 px-0">
                <?php include("./navbar.php"); ?>
            </div>
        </div>
    </section>
    <section class="container-fluid">
        <div class="row">
            <div class="col-12">
                <?php include("./content.php"); ?>
            </div>
        </div>
    </section>
    <section class="container-fluid" style="padding-top: 75px">
        <div class="row">
            <div class="col-12 px-0">
                <?php include("./footer.php"); ?>
            </div>
        </div>
    </section>
</main>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</body>
</html>