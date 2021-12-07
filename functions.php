<?php
  function sanitize($raw_data) {
    global $conn;
    $data = htmlspecialchars($raw_data);
    $data = mysqli_real_escape_string($conn, $data);
    $data = trim($data);
    return $data;
  }
  //Password Hash
  function mk_password_hash_from_microtime() {
    $mut = microtime();

    $time = explode(" ", $mut);

    $password = $time[1] * $time[0] * 1000000;

    $password_hash = password_hash($password, PASSWORD_BCRYPT);

    $onehour = mktime(1,0 ,0, 1, 1, 1970);

    $date_formated = date("d-m-Y", ($time[1] + $onehour));

    $time_formated = date("H:i:s", ($time[1] + $onehour));

    return array("password_hash" => $password_hash,
                 "date"          => $date_formated,
                 "time"          => $time_formated);
  }

  function is_authorized($userroles) {
    // var_dump($_SESSION);exit();
    if (!isset($_SESSION["email"])) {
      return header("Location: ./index.php?content=message&alert=auth-error");
    } elseif ( !in_array($_SESSION["userrole"], $userroles)) {
      return header("Location: ./index.php?content=message&alert=auth-error-user");
    } else {
      return true;
    }
  }

  function determine_userrole($email) {

    // E-mail wordt opgesplitst in een array gezet. Voor en na het @-teken
    $chop_email = explode("@", strtolower($email));

    // Het is een docent
    if (!strcmp("mboutrecht.nl", $chop_email[1])) {
        $userrole = "docent";
    } else if (!strcmp("student.mboutrecht.nl", $chop_email[1])) {
         $userrole = "student";
    } else if (!strcmp("georgemarina@georgemarina.nl", $email)) {
      $userrole = "eigenaar";
    } else if (!strcmp("georgemarina.nl", $chop_email[1])) {
      $userrole = "begeleider";
    } else {
      $userrole = "klant";
    }
    return $userrole;
  }
  //checkt de user role
  function check_userrole($email, $userroles) {
    global $conn;

    $sql = "SELECT * FROM `password` WHERE `email` = '$email'";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result)) {
      $db_userrole = mysqli_fetch_assoc($result);
      if (in_array($db_userrole["rol"], $userroles)) {
        return true;
      } else {
        return false;
      }

    } else {
      return false;
    }

  }

function build_calender($month,$year){
    $daysOfWeek = array('Sunday', 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

    $firstDayOfMonth = mktime(0,0,0,$month,1,$year);

    $numberDays = date('t',$firstDayOfMonth);


    $dateComponents = getdate($firstDayOfMonth);


    $monthName = $dateComponents['month'];


    $dayOfWeek = $dateComponents['wday'];

    $datetoday = date('Y-m-d');
    $calendar = "<table class='table table-bordered'>";
    $calendar .= "<center><h2>$monthName $year</h2>";
    $calendar .= "<tr>";

    foreach($daysOfWeek as $day) {
        $calendar .= "<th class='header'>$day</th>";
    }

    $currentDay = 1;
    $calendar .= "</tr><tr>";

    if($dayOfWeek > 0) {
        for($k=0;$k<$dayOfWeek;$k++){
            $calendar .= "<td class='empty'></td>";
        }
    }
    $month = str_pad($month, 2, "0", STR_PAD_LEFT);
    while ($currentDay <= $numberDays) {

        if ($dayOfWeek == 7) {
            $dayOfWeek = 0;
            $calendar .= "</tr><tr>";
        }
        $currentDayRel = str_pad($currentDay, 2, "0", STR_PAD_LEFT);
        $date = "$year-$month-$currentDayRel";
        $dayname = strtolower(date('l', strtotime($date)));
        $eventNum = 0;
        $today = $date==date('Y-m-d')? "today" : "";
        $calendar.="<td><h4>$currentDay</h4>";
        $calendar .="</td>";

        $currentDay++;
        $dayOfWeek++;
    }

    if ($dayOfWeek != 7) {
        $remainingDays = 7 - $dayOfWeek;
        for($l=0;$l<$remainingDays;$l++){
            $calendar .= "<td class='empty'></td>";
        }
    }

    $calendar .= "</tr>";
    $calendar .= "</table>";

    return $calendar;
}

?>