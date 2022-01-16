<?php
    if(isset($_POST['title'])){
        require("./connect_db.php");
        require("./functions.php");
        require("./message.php");

        $title = sanitize($_POST['title']);
        $startdate = $_POST['startdate'];
        $starttime = $_POST['starttime'];
        $endtime = $_POST['endtime'];
        $enddate = $_POST['enddate'];

//        query to send the data to the database
        $qry = "INSERT INTO `events`(
                     `naam`,
                     `starttijd`,
                     `startdatum`,
                     `eindtijd`,
                     `einddatum`)
                      VALUES (
                              '".$title."',
                              '".$starttime."',
                              '".$startdate."',
                              '".$endtime."',
                              '".$enddate."')";

        var_dump($qry);
        var_dump($conn);

//      Sends the data to the database
        if(mysqli_query($conn, $qry)){
            header("Location: ./index.php?content=message&alert=calendar-succes");
        } else {
            header("Location: ./index.php?content=message&alert=calendar-error");
        }
    }