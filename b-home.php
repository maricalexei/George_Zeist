<?php
include("./functions.php");
include("./connect_db.php");
is_authorized(["root", "begeleider"]);
if (isset($_POST['submit'])){
    $sql = 'INSERT INTO `schedule`(
            `title`, 
            `start_date`, 
            `end_date`, 
            `start_time`, 
            `end_time`)
        VALUES (
            "'.$_POST['title'].'",
            "'.$_POST['startdate'].'",
            "'.$_POST['enddate'].'",
            "'.$_POST['starttime'].'",
            "'.$_POST['endtime'].'")';
            
    mysqli_query($conn, $sql);
    var_dump($_POST); exit;
}
?>
<style>
        .vl {
            border-left: 1px solid black;
            height: 400px;
        }

        .vl0 {
            border-left: 0px solid black;
            height: 300px;
        }

        .hl {
            padding-top: 20px;
            border-bottom: 1px solid black;
            margin-bottom: 20px;
        }

        .hl0 {
            padding-top: 20px;
            border-bottom: 0px solid black;
            margin-bottom: 20px;
        }

        .pdt {
            padding-top: 100px;
        }

        .TextC {
            text-align: center;
        }

        .Bcenter {
            margin-top: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }

                    
}


    </style>
</head>

<body>
    <main>
        <section class="container">
            
        <div class="hl"></div>
            <div class="row">
                <div class="col-xl-3">

                </div>
                <div class="col-xl-6 vl">
                    <h2 class="TextC"></h2>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-outline-dark Bcenter" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                        Schedule lesson
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Event Tabel</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                            <h5>Schedule</h5>
                            <!-- Form for the insert qeury -->
                            <form action="" method="post">
                            <div class="mb-3">
                                <label for="Achternaam" class="form-label">Title</label>
                                <input type="text" name='title' require class="form-control" id="title" placeholder="title">
                            </div>
                            <div class="mb-3">
                                <label for="day"  require class="form-label">Start date</label>
                                <input type="date" name='startdate' class="form-control" id="day" placeholder="Day">
                            </div>
                            <div class="mb-3">
                                <label for="day"  require class="form-label">End date</label>
                                <input type="date" name='enddate' class="form-control" id="day" placeholder="Day">
                            </div>
                            <div class="mb-3">
                                <label for="time"  require class="form-label">Start Time</label>
                                <input type="time" name='starttime' class="form-control" id="time" placeholder="Time">
                            </div>
                            <div class="mb-3">
                                <label for="time"  require class="form-label">End Time</label>
                                <input type="time" name='endtime' class="form-control" id="time" placeholder="Time">
                            </div>
                                <div class="modal-footer">
                                    <input type="submit" name="submit" class="btn btn-outline-dark Bcenter" value="Submit" />

                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                </div>
                                <div class="col-xl-3 vl">
            </div>
            <div class="hl"> </div>
            </div>
            
           
        </section>


    </main>

   

</body>

