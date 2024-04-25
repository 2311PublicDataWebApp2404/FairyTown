<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운영정보</title>
<link rel="stylesheet" type="text/css" href="../resources/css/ride.css">
</head>
<body>

<!-- For Demo Purpose -->
<div class="container py-5">
    <header class="text-center">
        <h1 class="display-4 font-weight-bold">Bootstrap Datepicker</h1>
        <p class="font-italic text-muted mb-0">Create a nicely styled reservation form using Bootstrap 4 and <a href="https://github.com/uxsolutions/bootstrap-datepicker" class="text-muted">Bootstrap datepicker</a>.</p>
        <p class="font-italic text-muted">Snippet By <a href="https://bootstrapious.com" class="text-muted">
            <u>Bootstrapious</u></a>
        </p>
    </header>
</div>


<div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="py-4 text-center"><i class="fa fa-calendar fa-5x"></i></div>

            <!-- Date Picker Input -->
            <div class="form-group mb-4">
                <div class="datepicker date input-group p-0 shadow-sm">
                    <input type="text" placeholder="Choose a reservation date" class="form-control py-4 px-4" id="reservationDate">
                    <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-clock-o"></i></span></div>
                </div>
            </div><!-- DEnd ate Picker Input -->

            <!-- For Demo Purpose -->
            <div class="text-center">
                <p class="font-italic text-muted mb-0">Your reservation day is</p>
                <h4 id="pickedDate" class="font-weight-bold text-uppercase mb-3">Not set yet</h4>
                <a href="#" class="btn btn-primary btn-sm px-4 rounded-pill text-uppercase font-weight-bold shadow-sm">Confirm Reservation</a>
            </div>
        </div>
    </div>
</div>
<script>
$(function () {

    // INITIALIZE DATEPICKER PLUGIN
    $('.datepicker').datepicker({
        clearBtn: true,
        format: "dd/mm/yyyy"
    });


    // FOR DEMO PURPOSE
    $('#reservationDate').on('change', function () {
        var pickedDate = $('input').val();
        $('#pickedDate').html(pickedDate);
    });
});
</script>

		<!-- jQuery -->
<script src="../resources/plugins/jquery/jquery.min.js"></script>
</body>
</html>