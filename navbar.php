<?php
$active = (isset($_GET["content"])) ? $_GET["content"] : "";
?>

<style>

</style>


<div class="container" style="">
<div class="row">
    <div class="col-12">
        
            <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="flase" style="width: 1300px" >
            <div class="d-flex">
                <div class="toast-body">
                 <!-- Button trigger modal -->
                <div class="buttond" >
                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: white; margin: auto;">
                Click here for the latest covid-19 updates
                </button>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    <div class="row">
                        <div class="col-6">
                        <div class="card-center border-light mb-3" style="text-align: center; width: 32rem;">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><h3>COVID-19 UPDATE</h3></li>
                                <li class="list-group-item"><img src="img/CoronaPageD.png" alt="" width="150" height="150"></li>
                                <li class="list-group-item"><h6>While indoor dining and private events are limited for now, George loves bringing people together in the safest way.
                            All of our kitchen and waiting staff are following the HACCP regulations for food preparation, hygiene, and handling.</h6></li>
                            </ul>
                            </div>
                            
                        </div>
                        <div class="col-6 vl">
                        
                            <h4>Non-vaccinated need to do a test before you may enter</h4>
                        <br>
                            <h6>There will be a host at the front door checking your QR-code</h6> 
                        <br>
                            <h6>We will seat you on arrival</h6>
                        <br>
                            <h6>You will remain spaced at a 1.5 m distance</h6>
                        <br>
                            <h6>Tables are sanitised before and after your visit</h6>
                        <br>
                    
                        <h6>We prefer contactless payment options</h6>
                    
                        </div>
                    </div>
                    </div>
                    
                    </div>
                </div>
                </div>
                </div>
                    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </div>
       
    <nav class="navbar navbar-expand-lg navbar-light" style=" border-bottom: black">
        <a class="navbar-brand" style="padding-left: 10px" href="./index.php?content=home">
            <h1>
                <b style="font-size: 36px; padding-right: 100px">GEORGE</b>
            </h1>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div style="padding-left: 36px; padding-right: 16px"></div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item nav_padding <?php echo ($active == "reservation") ? "active" : "" ?>" style="">
                    <a class="nav-link" href="./index.php?content=reservation">RESERVATION</a>
                </li>
                <li class="nav-item nav_padding <?php echo ($active == "contact") ? "active" : "" ?>">
                    <a class="nav-link" href="./index.php?content=contact">CONTACT</a>
                </li>
                <li class="nav-item nav_padding <?php echo ($active == "bookpage") ? "active" : "" ?>">
                    <a class="nav-link" href="./index.php?content=bookpage">BOOK EVENT</a>
                </li>
                <li class="nav-item nav_padding <?php echo ($active == "AboutUs") ? "active" : "" ?>">
                    <a class="nav-link" href="./index.php?content=AboutUs">ABOUT US</a>
                </li>
                <li class="nav-item nav_padding <?php echo ($active == "menu") ? "active" : "" ?>">
                    <a class="nav-link" href="./index.php?content=menu">MENU</a>
                </li>
                <li class="nav-item <?php echo ($active == "career") ? "active" : "" ?>" style="padding-left: 36px">
                    <a class="nav-link" href="./index.php?content=career">CAREER</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="nav_border"></div>
</div>

