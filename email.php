<?php
  $message = '<!doctype html>
  <html lang="en">
    <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
      <style>
        body {
          background-color: #dddddd;
          font-size: 1.3em;
        }
      </style>
    </head>
    <body>
      <h1>'. $array["date"] . ' - ' . $array["time"] .'</h1>
      <h2>Beste Gebruiker,</h2>
      <p>U heeft zich onlangs geregistreerd voor de site http://projectgeorgezeist</p>
      <p>Klik <a href="http://projectgeorgezeist/index.php?content=' . $activationpage . '&email=' . $email . '&pwh=' . $array["password_hash"] . '">hier</a> voor het activeren en wijzigen van het wachtwoord van uw account</p>
      <p>Bedankt voor het registreren</p>
    </body>
  </html>';

?>