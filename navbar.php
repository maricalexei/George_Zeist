<?php
$active = (isset($_GET["content"])) ? $_GET["content"] : "";
?>

<div class="container" style="font-family: 'Times New Roman',sans-serif;">
    <nav class="navbar navbar-expand-lg navbar-light" style=" border-bottom: black">
        <a class="navbar-brand" style="padding-left: 10px" href="#">
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
                <li class="nav-item nav_padding" style="border-left: 1px solid black;">
                    <a class="nav-link" href="#">LOCATIONS</a>
                </li>
                <li class="nav-item nav_padding">
                    <a class="nav-link" href="#">CONTACT</a>
                </li>
                <li class="nav-item nav_padding">
                    <a class="nav-link" href="#">CAREER</a>
                </li>
                <li class="nav-item nav_padding">
                    <a class="nav-link" href="#">RESERVATION</a>
                </li>
                <li class="nav-item nav_padding">
                    <a class="nav-link" href="./aboutus.php">ABOUT US</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="nav_border"></div>
</div>

