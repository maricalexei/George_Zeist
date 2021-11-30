<?php
include ("./functions.php");
include ("./connect_db.php")
?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="calendar">
                <?php
                $dateComponents = getdate();
                $month = $dateComponents['mon'];
                $year = $dateComponents['year'];
                echo build_calender($month,$year);
                ?>
            </div>
        </div>
    </div>
</div>
