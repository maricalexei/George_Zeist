<!--// SELECT * FROM agenda-->
<!--//-->
<!--// json_encoode();-->

<div class="container">
    <!-- Button trigger modal -->
    <div class="row">
    <div class="calendar_button" content="">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Add event
        </button>
    </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add event</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="./index.php?content=calendar_script" method="post">
                        <div class="mb-3">
                            <label for="Title" class="form-label">Title</label>
                            <input type="text" name='title'  class="form-control" id="title" placeholder="Title" required>
                        </div>
                        <div class="mb-3">
                            <label for="day" class="form-label">Start Date</label>
                            <input type="date" name='startdate' class="form-control" id="startdate" placeholder="Start date" required>
                        </div>
                        <div class="mb-3">
                            <label for="starttime" class="form-label">Start Time</label>
                            <input type="time" name='starttime' class="form-control" id="starttime" placeholder="Start Time" required>
                        </div>
                        <div class="mb-3">
                            <label for="enddate" class="form-label">End date</label>
                            <input type="date" name='enddate' class="form-control" id="day" placeholder="Day" required>
                        </div>
                        <div class="mb-3">
                            <label for="endtime" class="form-label">End Time</label>
                            <input type="time" name='endtime' class="form-control" id="endtime" placeholder="End Time" required>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" name="submit">Add event</button>
                </div>
                </form>
            </div>
        </div>
    </div>
<div id="calendar"></div>
</div>