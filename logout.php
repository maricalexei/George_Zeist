<?php
//maakt het session array leeg
unset($_SESSION["id"]);
unset($_SESSION["userrole"]);

// verwijdert het session bestand
session_destroy();

header("Location: ./index.php?content=message&alert=logout");
?>