<?php
    var_dump($_POST);

    include("./connect_db.php");

    $sql = "SELECT * FROM `password` WHERE `email` =`$email`";

    $result = mysqli_query($conn, $sql);

    if(!mysqli_num_rows($result))
    {
        header("location: ./index.php?content=message&alert=email-uknown");
    }
    else
    {
        $record = mysqli_fetch_assoc($result);

     if(!record["activated"])
        {
            header("location: ./index.php?content=message&alert=not-activated&email=$email");
        }
     elseif(!password_verify($password, $record["passwd"]))
        {
            header("location: ./index.php?content=message&alert=no-pw-match=$email");
        }
     else
         {
            $_SESSION["email"] = $record["email"];
            $_SESSION["password"] = $record["passwd"];
            $_SESSION["userrole"] = $record["rol"];

            switch($record["rol"])
            {
                case 'docent':
                header("location: ./index.php?content=home");
                break;
                case 'eigenaar':
                header("location: ./index.php?content=home");
                break;
                case 'student':
                header("location: ./index.php?content=home");
                break;
                case 'begeleider':
                header("location: ./index.php?content=home");
                break;
                case 'klant':
                header("location: ./index.php?content=home");
                break;
                case 'root':
                 header("location: ./index.php?content=home");
                break;
                default:
                header("location: ./index.php?content=home");
                break;
            }
        }
   }
?>