<?php
include("./connect_db.php");


if(isset($_POST['submit'])){
    $tablenumber = $_GET['table'];
    $time = $_POST['time'];
    $pers = $_POST['pers'];
    $achternaam = $_POST['achternaam'];
    $day = $_POST['day'];
    $qry = "INSERT INTO `reserveringen` (`id`, `TafelNr`, `Pers`, `Achternaam`, `Tijd`, `Day`) VALUES (NULL, '$tablenumber', '$pers', '$achternaam', '$time', '$day')";
if(mysqli_query($conn, $qry)){
    header("Location: ./index.php?content=message&alert=book-success");
    $to = $email;
    $subject = "Reservationemail from georgemboutrecht.nl";
    // echo $activationpage; exit();
    include("./email2.php");
    // include("./alt-email2.php");
    
    $headers = "MIME-Version: 1.0\r\n";
    $headers .= "Content-type: text/html; charset=UTF-8\r\n";
    $headers .= "From: admin@georgemboutrecht.nl\r\n";
    $headers .= "Cc: moderator@georgemboutrecht.nl\r\n";
    $headers .= "Bcc: root@georgemboutrecht.nl";
    
    mail($to, $subject, $message, $headers);
}else{
        header("Location: ./index.php?content=message&alert=book-failed");
    }
}

?>
<div class="section">
    <div class="container">
        <div class="content-section">
            <div class="title">
                <h1>Reservation (click your Table)</h1>
                <hr>
            </div>
        </div>
        <div class="modal" id="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form action="" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Reserve</h5>
                        </div>
                        <div class="modal-body">
                            <h5>Table number</h5>
                            <p id="tableNumber" name='tablenumber'></p>
                            <div class="mb-3">
                                <label for="Achternaam" class="form-label">Surname</label>
                                <input type="text" name='achternaam' require class="form-control" id="achternaam" placeholder="Surname">
                            </div>
                            <div class="mb-3">
                                <label for="Pers"  class="form-label">Amount of people</label>
                                <input type="number" name='pers' require min="0" class="form-control" id="pers" placeholder="Amount">
                            </div>
                            <div class="mb-3">
                                <label for="day"  require class="form-label">Day</label>
                                <input type="date" name='day' class="form-control" id="day" placeholder="Day">
                            </div>
                            <div class="mb-3">
                                <label for="time"  require class="form-label">Time</label>
                                <input type="time" name='time' class="form-control" id="time" placeholder="Time">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-primary" name="submit" value="Save changes" />

                            <a href="index.php?content=reservation"><button type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Close </button></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <img src="img\reservation.jpg" usemap="#image-map">

        <map name="image-map">
            <area target="_self" alt="1" title="1" href="index.php?content=reservation&table=1" coords="197,39,264,130"
                shape="rect">
            <area target="" alt="2" title="2" href="index.php?content=reservation&table=2" coords="311,41,378,130"
                shape="rect">
            <area target="" alt="3" title="3" href="index.php?content=reservation&table=3" coords="438,50,480,91"
                shape="rect">
            <area target="" alt="4" title="4" href="index.php?content=reservation&table=4" coords="522,50,564,89"
                shape="rect">
            <area target="" alt="5" title="5" href="index.php?content=reservation&table=5" coords="600,51,644,90"
                shape="rect">
            <area target="" alt="6" title="6" href="index.php?content=reservation&table=6" coords="601,209,656,257"
                shape="rect">
            <area target="" alt="7" title="7" href="index.php?content=reservation&table=7" coords="516,208,567,254"
                shape="rect">
            <area target="" alt="8" title="8" href="index.php?content=reservation&table=8" coords="433,208,485,254"
                shape="rect">
            <area target="" alt="9" title="9" href="index.php?content=reservation&table=9" coords="352,250,403,297"
                shape="rect">
            <area target="" alt="10" title="10" href="index.php?content=reservation&table=10" coords="290,249,340,298"
                shape="rect">
            <area target="" alt="11" title="11" href="index.php?content=reservation&table=11" coords="224,248,271,294"
                shape="rect">
            <area target="" alt="12" title="12" href="index.php?content=reservation&table=12" coords="173,254,208,288"
                shape="rect">
            <area target="" alt="13" title="13" href="index.php?content=reservation&table=13" coords="433,289,484,338"
                shape="rect">
            <area target="" alt="14" title="14" href="index.php?content=reservation&table=14" coords="569,338,515,291"
                shape="rect">
            <area target="" alt="15" title="15" href="index.php?content=reservation&table=15" coords="601,290,652,335"
                shape="rect">
            <area target="" alt="16" title="16" href="index.php?content=reservation&table=16" coords="675,467,728,515"
                shape="rect">
            <area target="" alt="17" title="17" href="index.php?content=reservation&table=17" coords="591,467,639,512"
                shape="rect">
            <area target="" alt="18" title="18" href="index.php?content=reservation&table=18" coords="515,467,568,514"
                shape="rect">
            <area target="" alt="19" title="19" href="index.php?content=reservation&table=19" coords="438,468,486,514"
                shape="rect">
            <area target="" alt="20" title="20" href="index.php?content=reservation&table=20" coords="355,468,407,512"
                shape="rect">
            <area target="" alt="21" title="21" href="index.php?content=reservation&table=21" coords="254,450,321,515"
                shape="rect">
            <area target="" alt="22" title="22" href="index.php?content=reservation&table=22" coords="153,451,219,513"
                shape="rect">
            <area target="" alt="t1" title="t1" href="index.php?content=reservation&table=t1" coords="778,39,820,140"
                shape="rect">
            <area target="" alt="t2" title="t2" href="index.php?content=reservation&table=t2" coords="842,40,881,77"
                shape="rect">
            <area target="" alt="t3" title="t3" href="index.php?content=reservation&table=t3" coords="841,102,880,138"
                shape="rect">
            <area target="" alt="t4" title="t4" href="index.php?content=reservation&table=t4" coords="782,358,824,398"
                shape="rect">
            <area target="" alt="t5" title="t5" href="index.php?content=reservation&table=t5" coords="785,425,826,464"
                shape="rect">
            <area target="" alt="t6" title="t6" href="index.php?content=reservation&table=t6" coords="843,362,880,394"
                shape="rect">
            <area target="" alt="t7" title="t7" href="index.php?content=reservation&table=t7" coords="841,426,880,463"
                shape="rect">
            <area target="" alt="t8" title="t8" href="index.php?content=reservation&table=t8" coords="781,483,881,510"
                shape="rect">
            <area target="" alt="Bar" title="Bar" href="index.php?content=reservation&table=Bar" coords="24,198,132,526"
                shape="rect">
        </map>
    </div>
</div>
<?php
if(isset($_GET['table'])){
    var_dump($_GET["table"]);
    print('<script>document.getElementById("tableNumber").innerHTML = "'.$_GET["table"] .'"; 
    $(".modal").toggle();
    </script>');
    
}


?>
