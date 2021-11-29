<?php
//including the connect from the database
    include("./connect_db.php");

$slt = $conn->query("SELECT `afkorting` FROM `medewerker`");

if(!$conn){
    die('error in db' . mysqli_error($conn));
}else{
    $id = $_GET['id'];
    $qry="SELECT * FROM `beoordeling` WHERE `id` = $id";
    $run= $conn->query($qry);
        if($run->num_rows>0){
            while($row=$run->fetch_assoc()){
                $result=$row['voldoende'];
                $oordeel=$row['oordeel'];
                $teacher=$row['begeleider'];
            }
        }
}
?>
<body>
    <form method="post">
        <label>Judgment</label>
        <input type="text" name="oordeel" value="<?php echo $oordeel;?> ">
        <br><br>

        <label>Results</label>
        <select name="resultaat">
            <option selected disabled value="<?php echo $result; ?>" ><?php echo $result; ?></option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>
        <br><br>

        <label>Docent</label>
        <select name="docent">
            <option selected disabled value="<?php echo $teacher; ?>"><?php echo $teacher; ?></option>
        <?php
        while($rows=$slt->fetch_assoc()){
            $afkorting = $rows['afkorting'];
            echo "<option value='$afkorting'>$afkorting</option>";
        }
        ?>
        </select>
        <br><br>
        <!--button-->
        <input type="submit" name="update" value="Update">
    </form>
</body>

<?php
if(isset($_POST['update'])){
    $oordeel=$_POST['oordeel'];
    $resultaat=$_POST['resultaat'];
    $docent=$_POST['docent'];

    $qry="UPDATE `beoordeling` SET `voldoende`='$resultaat', `oordeel`='$oordeel', `begeleider`='$docent' WHERE `id`=$id";
    if(mysqli_query($conn, $qry)){
        header('location: index.php?content=Result');
    }else{
        echo mysqli_error($conn);
    }


}
?>