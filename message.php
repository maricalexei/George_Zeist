<?php
  $alert = (isset($_GET["alert"]))? $_GET["alert"]: "default";
  $email = (isset($_GET["email"]))? $_GET["email"]: "";
  $pwh = (isset($_GET["pwh"]))? $_GET["pwh"]: "";
  //Message for errors
  switch($alert) {
    case "no-email" :
      echo '<div class="alert alert-info mt-5 w-50 mx-auto text-center" role="alert">
             No e-mailfound, try it again...
            </div>';
      header("Refresh: 3; ./index.php?content=register");
    break;
    case "emailexists" :
      echo '<div class="alert alert-warning mt-5 w-50 mx-auto text-center" role="alert">
              Your e-mail is already used, Try it again with a diffrent e-mail...
            </div>';
      header("Refresh: 3; ./index.php?content=register");
    break;
    case "register-error" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
              There has been an error with the registration process, try it again...
            </div>';
      header("Refresh: 3; ./index.php?content=register");
    break;
    case "credentials-empty" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
           You have not entered your name or telephone number... please try again

            </div>';
      header("Refresh: 3; ./index.php?content=activate&email=$email&pwh=$pwh");
    break;
    case "register-success" :
      echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">
             You have been successfully registered. You will receive an email from us containing an activation link.
            </div>';
      header("Refresh: 3; ./index.php?content=login");
    break;
    case "hacker-alert" :
      echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">You do not have right to this page!</div> <img src="img/NOTPASS" alt=""> ';
      header("Refresh: 3; ./index.php?content=home");
    break;
    case "password-empty" :
      echo '<div class="alert alert-warning mt-5 w-50 mx-auto text-center" role="alert">
              U heeft een van beide wachtwoordvelden niet ingevuld. Probeer het opnieuw
            </div>';
      header("Refresh: 3; ./index.php?content=activate&email=$email&pwh=$pwh");
    break;
    case "nomatch-password" :
      echo '<div class="alert alert-warning mt-5 w-50 mx-auto text-center" role="alert">
      Your entered passwords do not match, please try again...
            </div>';
      header("Refresh: 3; ./index.php?content=activate&email=$email&pwh=$pwh");
    break;
    case "no-id-pwh-match" :
      echo '<div class="alert alert-warning mt-5 w-50 mx-auto text-center" role="alert">
              You are not registered in the database, you will be redirected to the registration page
            </div>';
      header("Refresh: 3; ./index.php?content=register");
    break;
    case "update-success" :
      echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">
      You have successfully registered, you will be redirected to the login page...

            </div>';
      header("Refresh: 3; ./index.php?content=login");
    break;
    case "update-error" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
            
          The registration process was not successful, please choose a new password
            </div>';
            header("Refresh: 3; ./index.php?content=activate&email=$email&pwh=$pwh");
    break;
    case "already-active" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
            
            Your account is already active, log in with your chosen password and email address.
            </div>';
            header("Refresh: 3; ./index.php?content=login");
    break;
    case "no-match-pwh" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
            Your activation link details are not correct, please register again
            </div>';
            header("Refresh: 3; ./index.php?content=register");
    break;
    case "loginform-empty" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
              You have not filled in either field, please try again...
            </div>';
            header("Refresh: 3; ./index.php?content=login");
    break;
    case "email-unknown" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">  
            The email address you entered is not known to us, please try again...
            </div>';
            header("Refresh: 3; ./index.php?content=login");
    break;
    case "wrongactivationpage" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
              You are on the wrong activation page. Try clicking the activation link again in the email sent to you...
            </div>';
            header("Refresh: 3; ./index.php?content=login");
    break;
    case "not-activated" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
             Your account has not yet been activated. Check your email <span class="badge badge-danger p-2">' . $email . '</span> for clicking the activation link....
            </div>';
            header("Refresh: 3; ./index.php?content=login");
    break;
    case "no-pw-match" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
            Your entered password for the email address <span class="badge badge-danger p-2">' . $email . '</span> is not correct, please try again....
            </div>';
            header("Refresh: 3; ./index.php?content=login");
    break;
    case "logout" :
      echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">
                You are logged out, you will be redirected to the homepage....
            </div>';
            header("Refresh: 3; ./index.php?content=home");
    break;
    case "auth-error" :
      echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">
               You are not logged in, you will be redirected to the homepage....
            </div>';
            header("Refresh: 3; ./index.php?content=home");
    break;
    case "auth-error-user" :
      echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">
            You have no rights on this page, you will be redirected to the homepage....
            </div>';
            header("Refresh: 3; ./index.php?content=home");
    break;
    case "book-success" :
      echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">
              You succesfully booked, You will be sent to the reservation page...
            </div>';
      header("Refresh: 3; ./index.php?content=reservation");
    break;
    case "book-failed" :
      echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
              You failed to fill in all the parts, You will be sent to the reservation page...
            </div>';
      header("Refresh: 3; ./index.php?content=reservation");
    break;
      case "calendar-error" :
          echo '<div class="alert alert-danger mt-5 w-50 mx-auto text-center" role="alert">
            Something went wrong! Try again!
            </div>';
       header("Refresh: 3; ./index.php?content=calendar");
    break;
      case "calendar-succes":
          echo '<div class="alert alert-success mt-5 w-50 mx-auto text-center" role="alert">
            Your event was succesfully added!
            </div>';
          header("Refresh: 3; ./index.php?content=calendar");
    break;

//    default:
//      header("Location: ./index.php?content=home");
//          break;

  }


?>