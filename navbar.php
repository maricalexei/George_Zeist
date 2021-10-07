<?php
$active = (isset($_GET["content"])) ? $_GET["content"] : "";
?>

<div class="container-fluid" style="font-family: 'Times New Roman',sans-serif; padding-left: 250px; padding-right: 250px">
    <nav class="navbar navbar-expand-lg navbar-light" style=" border-bottom: black">
        <a class="navbar-brand" style="padding-left: 10px" href="./index.php?content=home">
            <h1>
                <b style="font-size: 36px; padding-right: 300px">GEORGE</b>
            </h1>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div style="padding-left: 36px; padding-right: 16px"></div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item nav_padding" style="">
                    <a class="nav-link" href="./index.php?content=reservation">RESERVATION</a>
                </li>
                <li class="nav-item nav_padding">
                    <a class="nav-link" href="./index.php?content=contact">CONTACT</a>
                </li>
                <li class="nav-item nav_padding">
                    <a class="nav-link" href="./index.php?content=bookpage">BOOK EVENT</a>
                </li>
                <li class="nav-item nav_padding">
                    <a class="nav-link" href="./index.php?content=AboutUs">ABOUT US</a>
                </li>
                <li class="nav-item" style="padding-left: 36px">
                    <a class="nav-link" href="./index.php?content=menu">MENU</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="nav_border"></div>
</div>

