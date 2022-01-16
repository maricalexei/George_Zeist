<?php
include("./functions.php");
is_authorized(["root", "docent"]);
?>
Docent-home
<div>
    <a href="index.php?content=StudentInfo">
    <button type="button" class="btn btn-outline-primary">Student Infomation Page</button>
    </a>
</div>
