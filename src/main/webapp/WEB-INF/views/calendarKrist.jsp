<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Calendar 03</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/calendarStyle.css">
	
	</head>
	<body>
	<section class="ftco-section">
		<div class="container" >
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Calendar #03</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="calendar-section">
		        <div class="row no-gutters">
		          <div class="col-md-6">

		            <div class="calendar calendar-first" id="calendar_first">
		              <div class="calendar_header">
		                <button class="switch-month switch-left">
		                  <i class="fa fa-chevron-left"></i>
		                </button>
		                <h2></h2>
		                <button class="switch-month switch-right">
		                  <i class="fa fa-chevron-right"></i>
		                </button>
		              </div>
		              <div class="calendar_weekdays"></div>
		              <div class="calendar_content"></div>
		            </div>
		          </div>
		          <div class="col-md-6">

		            <div class="calendar calendar-second" id="calendar_second">
		              <div class="calendar_header">
		                <button class="switch-month switch-left">
		                  <i class="fa fa-chevron-left"></i>
		                </button>
		                <h2></h2>
		                <button class="switch-month switch-right">
		                  <i class="fa fa-chevron-right"></i>
		                </button>
		              </div>
		              <div class="calendar_weekdays"></div>
		              <div class="calendar_content"></div>
		            </div>            

		          </div>

		        </div> <!-- End Row -->
		            
		      </div> <!-- End Calendar -->
				</div>
			</div>
		</div>
	</section>

  <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/calendarMain.js"></script>

	</body>
</html>

