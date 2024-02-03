<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.StringTokenizer"%>

<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en-us">
<head>
<title>Book page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1" />
<meta name="description" content="This is meta description" />
<meta name="author" content="Themefisher" />
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon" />
<link rel="icon" href="images/favicon.png" type="image/x-icon" />

<!-- theme meta -->
<meta name="theme-name" content="wallet" />

<!-- # Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet" />

<!-- # Main Style Sheet -->
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="<c:url value='/css/map.css'/>">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>



<style>
.carousel-img {
	height: 100px; /* 設置圖片高度 */
	width: 250px;
	object-fit: cover; /* 保持圖片比例並填滿容器 */
}

.icon-color {
	color: #00AEAE; /*更改为所需的颜色*/
}

.calendar-section {
	margin-bottom: 20px;
}

.calendar, .calendar_weekdays, .calendar_content {
	max-width: 540px;
}

.calendar {
	/*float: left;*/
	margin: 0;
	min-width: 150px;
	font-weight: 150px;
	background: #fff;
	padding: 10px;
	-webkit-box-shadow: 0px 4px 26px -22px rgba(0, 0, 0, 0.14);
	-moz-box-shadow: 0px 4px 26px -22px rgba(0, 0, 0, 0.14);
	box-shadow: 0px 4px 26px -22px rgba(0, 0, 0, 0.14);
}

.calendar_weekdays {
	color: #aaa;
	font-weight: 300;
}

.calendar_weekdays div {
	display: inline-block;
	vertical-align: top;
	color: #000;
	font-weight: 700;
}

.calendar_content, .calendar_weekdays, .calendar_header {
	position: relative;
}

.calendar_content:after, .calendar_weekdays:after, .calendar_header:after
	{
	content: ' ';
	display: table;
	clear: both;
}

.calendar_weekdays div, .calendar_content div {
	/*border: 1px dotted #999;*/
	width: 14.28571%;
	height: 50px;
	line-height: 69px;
	overflow: hidden;
	text-align: center;
	background-color: transparent;
}

.calendar_content div {
	float: left;
	margin-left: -1px;
	margin-top: -1px;
	border: 1px solid transparent;
	border-radius: 5px;
}

.calendar_content div:hover {
	border: 1px solid #ededed;
	/*line-height: 68px;*/
	cursor: pointer;
}

.calendar_content div.blank:hover {
	cursor: default;
	border: none;
}

.calendar_content div.past-date {
	cursor: initial;
	color: #d5d5d5;
}

.calendar_content div.today {
	font-weight: 700;
	font-size: 18px;
	color: #fff;
	background-color: #33b5a4;
}

.calendar_content div.selected {
	background-color: #4265a1;
	/*rgba(170, 170, 176, .5) #aaaab0*/
	border: 1px solid white;
}

.calendar_header {
	width: 100%;
	text-align: center;
	position: relative;
	height: 30px;
	display: table;
	vertical-align: middle;
}

.calendar_header h2 {
	margin-top: 15px;
	padding: 0;
	font-weight: 700;
	font-size: 18px;
	color: #000 !important;
	text-transform: uppercase;
}

button.switch-month {
	background-color: transparent;
	padding: 0;
	outline: none;
	border: none;
	height: 20px;
	width: 40px;
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	color: white;
	-webkit-transition: color .2s;
	-o-transition: color .2s;
	transition: color .2s;
}

button.switch-month.switch-left {
	left: 0;
}

button.switch-month.switch-right {
	right: 0;
}

button.switch-month:hover {
	color: #bd83ce;
}

button.switch-month:active {
	background-color: transparent;
}
</style>
</head>


<body>
	<!-- navigation -->
	<header class="navigation">
		<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
			<div class="container">
				<a class="navbar-brand" href="<c:url value="/"></c:url>"> <img
					class="img-fluid" width="120" src="../images/logo.png"
					alt="CouchSurfing" />
				</a>
				
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/bookTrip"></c:url>">訂單</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="about.html">日曆</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="services.html">收件夾</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">聯絡我們</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">選單</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="blog.html">部落格</a></li>
								<li><a class="dropdown-item" href="service-details.html">服務項目</a></li>
								<li><a class="dropdown-item" href="terms.html">條約
										&amp; 法律責任</a></li>
							</ul></li>
					</ul>
					
					<div>
						<!-- account btn -->
						<ul class="nav">
							<li class="nav-item dropdown"><a
								class="p-3 border rounded-pill" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									<img style="width: 15px" src="../images/icon/fish.png" alt="" />
									<img class="img-fluid rounded-circle mb-1" style="width: 50px" src="..${loginUser.filePath }"
									alt="" />
							</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li class="dropdown-item"><img class="img-fluid rounded-circle"
										style="width: 50px" src="..${loginUser.filePath }" alt="" />
										<h4>${loginUser.userName }</h4></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item" href="<c:url value="/bookTrip"></c:url>">旅程</a></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item" href="blog-details.html">訊息</a></li>
									<li><a id="openPopup" class="dropdown-item" href="<c:url value="/map/{lat}/{lng}/{dis}"></c:url>">房源地圖</a></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item" href="faq.html">幫助</a></li>
									<li><a href="<c:url value="/logout"></c:url>"
										class="dropdown-item">登 出</a></li>
								</ul>
								</li>
						</ul>
					</div>

				</div>
			</div>
		</nav>
	
	</header>
	
	<div id="overlay"></div>
	<div id="popup">
		<!-- 這裡放置彈出框的内容 -->
		<div id="popWindow">
			<div id="disRange">
				<label for="dis" id="labledis">請選擇範圍距離 : </label> <input type="number" name="dis" id="dis" min="1"
					step="1" />&nbsp;<span>公里</span>
				<button type="button" onclick="updateMarkers()">更新距離</button>
				<button id="goToUserLocation">回到您的位置</button>
				<span id="distanceDisplay">目前距離範圍：未選擇</span>
			</div>
			<div id="myMap"></div>
		</div>
	</div>
	
	<hr />

	<!-- Room page -->
	<section class="section pt-0 pb-1">
		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<img class="mb-2 img-cover" src="..${singleRoom.filePath}" alt="" />

				</div>

				<div class="col-lg-4">
					<div class="border rounded me-3 shadow-sm">
						<div class="row m-2 mt-1">
							<div class="text-center col-5">
								<img class="img-fluid w-50 mt-3 rounded-circle" src="..${user.filePath }" alt="" />
							</div>
							<div class="col-5 mt-3 me-auto">
								<h6>房東：${user.userName }</h6>
								<h6>超讚房東 : 一年待客經驗</h6>
								>
							</div>
						</div>


						<hr class="m-2">

						<div class="row border rounded m-3">
							<div>${singleRoom.description}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<hr class="m-4">

	<!-- 製作設備部分和下訂部分 -->
	<section class="section p-0">
		<div class="container">
			<div class="row justify-content-center" id="bookButtom">
				<div class="sticky-top" id="fix-information">
					<h3 class="p-2">特色介紹</h3>
					<hr class="m-3">
					<h5 class="mt-5">
						<img src="../images/icon/flash.png"
							style="width: 40px; height: 40px;"></img> 自助入住
					</h5>
					<p>使用鑰匙自助入住</p>

					<h5 class="mt-5">
						<img src="../images/icon/house.png"
							style="width: 40px; height: 40px;"></img> 絕佳位置
					</h5>
					<p>最近有100%的房客給予房源位置5星評分。</p>

					<h5 class="mt-5">
						<img class="mb-3" src="../images/icon/king.png"
							style="width: 40px; height: 40px;"></img> 48小時內可免費取消
					</h5>
					<p>讓您可以放心取消</p>
					<hr class="m-3">

					<!-- 遷入 googlemap -->
					<h3 class="p-2">Google Map</h3>
					<div id="map" style="height: 400px; width: 100%;"></div>

					<hr class="m-3">
					<h3 class="p-2">評 論 專 區</h3>
					
					<c:forEach var="review" items="${reviews}">
					
						<div class="card mb-3" style="max-width: 540px;">
						  <div class="row g-0">
						    <div class="col-md-4">
						    	<c:if test="${not empty review.user.filePath}">
   								 	<img class="text" src="..${review.user.filePath}" style="margin-left:30px; margin-top:15px; width: 100px; height: 100px; border-radius: 50%;" alt="忘記設定大頭貼了！！！">
								</c:if>
						     <!--  <img src="../images/logo.png" class="rounded-start justify-content-center ms-3 mt-3" style="width:100xp; height:100px;" alt="忘記設定大頭貼了！！！"> -->
						    </div>
						    <div class="col-md-8">
						      <div class="card-body">
						        <h5 class="card-title">${review.user.userName}</h5>
						        <p class="card-text">${review.review_date }</p>
						        <p class="card-text"><small class="text-muted">${review.comment }</small></p>
						      </div>
						    </div>
						  </div>
						</div>

					</c:forEach>
					
					<br>
					<hr>
					
					<h3 class="p-2">設 施 表</h3>
					<c:forEach var="amenity" items ="${ameniteis}">
					<h6 class= "ms-2">${amenity.amenityName}</h6>
					<%-- <h6>${review.amenityId.amentityName }</h6> --%>
					</c:forEach>
					
					
					<hr>
					
					<section class="ftco-section">
		<div class="container" >
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h3 class="p-2">行 程 選 取</h3>
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
					
				</div>

				<!-- 此為固定方塊 -->
				<div id="fix-box">
					<div class="border rounded shadow"
						style="width: 404px; height: 376">
						<div>
							<h4 class="m-2">${singleRoom.price}TWD/晚</h4>
							<c:url var='booking' value='/booking' />
							<form:form method="post" modelAttribute="bookingBean"
								action="${ booking}">
								<div class="row">
									<div class="col-lg-6 mb-4 pb-2">
										<div class="form-group">
											<label for="checkinDate" class="form-label">入 住 日 期</label>
											<form:input type="text" class="form-control shadow-none"
												id="checkinDate"  path="checkinDate"/>
											<form:errors path="checkinDate" cssClass="error" />
										</div>
									</div>
									<div class="col-lg-6 mb-4 pb-2">
										<div class="form-group">
											<label for="checkoutDate" class="form-label">退 住 日 期</label>
											<form:input type="text" class="form-control shadow-none"
												id="checkoutDate" placeholder="ex: 克里斯" path="checkoutDate"/>
											<form:errors path="checkoutDate" cssClass="error" />
										</div>
									</div>
									<div class="col-lg-12 mb-4 pb-2">
										<div class="form-group">
											<label for="guest" class="form-label">旅 客 人 數</label>
											<form:input type="number" class="form-control shadow-none"
												id="guest" placeholder="ex: 1~5" path="guest" min="1"/>
											<form:errors path="guest" cssClass="error" />
										</div>
									</div>
									<div class="col-lg-12 text-center">
										<button type="submit" class="btn btn-outline-primary ">提
											交 資 料</button>
									</div>
								</div>
							</form:form>
							<!-- 動態顯示的需付款金額 -->
							<div id="amount">
								<p class="ms-2">
									總付款金額 : $<span id="calculatedAmount"></span>
								</p>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	

	<!-- # JS Plugins -->
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- <script src="../calendar-03/js/calendarMain.js"></script> -->
	<!-- <link rel="stylesheet" href="../calendar-03/js/calendarMain.js" /> -->
	<!-- <script src="../plugins/scrollmenu/scrollmenu.min.js"></script> -->

	<script>
		document.addEventListener("DOMContentLoaded",function() {
			window.addEventListener("scroll",function() {
				var bookPage = document.getElementById("fix-box");
				var information = document.getElementById("fix-information")
				var scrollPosition = window.scrollY || window.pageYOffset|| document.documentElement.scrollTop;

				// 計算寬度
				var rightWidth = document.getElementById("bookButtom").offsetWidth;
				console.log(rightWidth);
				var imageWidth = document.getElementById("fix-box").offsetWidth;
				var mathWidth = rightWidth- imageWidth;
				console.log(mathWidth);
				console.log(scrollPosition);

						// 下滑時訂購單可以貼在旁邊以供參考
						if (scrollPosition > 641) {
							bookPage.setAttribute("class","col-4 fixed-top mt-4"); // 使用 setAttribute 修正类名
							bookPage.setAttribute("style","width:416px; height:436px; left:842px ")
							information.setAttribute("class","col-6 sticky-top")
							information.setAttribute("style","right:598px;")
						} else {
							bookPage.setAttribute("class", "col-4"); // 使用 setAttribute 修正类名
							bookPage.setAttribute("style","width:416px; height:436px; ")
							information.setAttribute("class", "col-6")
						}
					})
})

		function initMap() {

			var latitude = ${singleRoom.lat};
			var longtitude = ${singleRoom.lon};
			var map = new google.maps.Map(document.getElementById('map'), {
				center : {lat : latitude,lng : longtitude},
				zoom : 12,
				styles : [
				// 在這裡放入你的地圖樣式設定
				// 可以在 https://mapstyle.withgoogle.com/ 等網站上生成地圖樣式

				{
					elementType : "geometry",
					stylers : [ {
						color : "#ebe3cd"
					} ]
				}, {
					elementType : "labels.text.fill",
					stylers : [ {
						color : "#523735"
					} ]
				}, {
					elementType : "labels.text.stroke",
					stylers : [ {
						color : "#f5f1e6"
					} ],
				}, {
					featureType : "administrative",
					elementType : "geometry.stroke",
					stylers : [ {
						color : "#c9b2a6"
					} ],
				}, {
					featureType : "administrative.land_parcel",
					elementType : "geometry.stroke",
					stylers : [ {
						color : "#dcd2be"
					} ],
				}, {
					featureType : "administrative.land_parcel",
					elementType : "labels.text.fill",
					stylers : [ {
						color : "#ae9e90"
					} ],
				}, {
					featureType : "landscape.natural",
					elementType : "geometry",
					stylers : [ {
						color : "#dfd2ae"
					} ],
				}, {
					featureType : "poi",
					elementType : "geometry",
					stylers : [ {
						color : "#dfd2ae"
					} ],
				}, {
					featureType : "poi",
					elementType : "labels.text.fill",
					stylers : [ {
						color : "#93817c"
					} ],
				}, {
					featureType : "poi.park",
					elementType : "geometry.fill",
					stylers : [ {
						color : "#a5b076"
					} ],
				}, {
					featureType : "poi.park",
					elementType : "labels.text.fill",
					stylers : [ {
						color : "#447530"
					} ],
				}, {
					featureType : "road",
					elementType : "geometry",
					stylers : [ {
						color : "#f5f1e6"
					} ],
				}, {
					featureType : "road.arterial",
					elementType : "geometry",
					stylers : [ {
						color : "#fdfcf8"
					} ],
				}, {
					featureType : "road.highway",
					elementType : "geometry",
					stylers : [ {
						color : "#f8c967"
					} ],
				}, {
					featureType : "road.highway",
					elementType : "geometry.stroke",
					stylers : [ {
						color : "#e9bc62"
					} ],
				}, {
					featureType : "road.highway.controlled_access",
					elementType : "geometry",
					stylers : [ {
						color : "#e98d58"
					} ],
				}, {
					featureType : "road.highway.controlled_access",
					elementType : "geometry.stroke",
					stylers : [ {
						color : "#db8555"
					} ],
				}, {
					featureType : "road.local",
					elementType : "labels.text.fill",
					stylers : [ {
						color : "#806b63"
					} ],
				}, {
					featureType : "transit.line",
					elementType : "geometry",
					stylers : [ {
						color : "#dfd2ae"
					} ],
				}, {
					featureType : "transit.line",
					elementType : "labels.text.fill",
					stylers : [ {
						color : "#8f7d77"
					} ],
				}, {
					featureType : "transit.line",
					elementType : "labels.text.stroke",
					stylers : [ {
						color : "#ebe3cd"
					} ],
				}, {
					featureType : "transit.station",
					elementType : "geometry",
					stylers : [ {
						color : "#dfd2ae"
					} ],
				}, {
					featureType : "water",
					elementType : "geometry.fill",
					stylers : [ {
						color : "#b9d3c2"
					} ],
				}, {
					featureType : "water",
					elementType : "labels.text.fill",
					stylers : [ {
						color : "#92998d"
					} ],
				}

				]
			});

			var roomId = 56;

			 $(document).ready(function() {
					// 監聽日期和人數輸入
					$("#checkinDate, #checkoutDate, #guest").on("input",function() {
						// 獲取輸入的日期和人數
						var checkinDate = $("#checkinDate").val();
						var checkoutDate = $("#checkoutDate").val();
						var guest = $("#guest").val();

						// 使用 AJAX 發送請求到後端計算總金額
						$.get("/pillowSurfing/calculateAmount",
							{
							checkinDate : checkinDate,
							checkoutDate : checkoutDate,
							guest : guest
							}).done(
							function(data) {
							// 更新總金額變化
							$("#calculatedAmount").text(data.amount);
							}).fail(function(
								jqXHR,
								textStatus,
								errorThrown) {console.error(
									"AJAX request failed:",
									textStatus,
									errorThrown);
							});
						});
					});

			console.log("Checkout Date:", $("#checkoutDate").val());
			console.log("Checkin Date:", $("#checkinDate").val()); 

		}


		// 製作點擊效果
		(function($) {

			"use strict";

			$(document).ready(function() {
				function c(passed_month, passed_year, calNum) {
					var calendar = calNum == 0 ? calendars.cal1 : calendars.cal2;
					makeWeek(calendar.weekline);
					calendar.datesBody.empty();
					var calMonthArray = makeMonthArray(passed_month, passed_year);
					var r = 0;
					var u = false;
					while(!u) {
						if(daysArray[r] == calMonthArray[0].weekday) { u = true } 
						else { 
							calendar.datesBody.append('<div class="blank"></div>');
							r++;
						}
					} 
					for(var cell=0;cell<42-r;cell++) { // 42 date-cells in calendar
						if(cell >= calMonthArray.length) {
							calendar.datesBody.append('<div class="blank"></div>');
						} else {
							var shownDate = calMonthArray[cell].day;
							// Later refactiroing -- iter_date not needed after "today" is found
							var iter_date = new Date(passed_year,passed_month,shownDate); 
							if ( 
								(
									( shownDate != today.getDate() && passed_month == today.getMonth() ) 
									|| passed_month != today.getMonth()
								) 
									&& iter_date < today) {						
								var m = '<div class="past-date">';
							} else {
								var m = checkToday(iter_date)?'<div class="today">':"<div>";
							}
							calendar.datesBody.append(m + shownDate + "</div>");
						}
					}

					// var color = o[passed_month];
					calendar.calHeader.find("h2").text(i[passed_month]+" "+passed_year);
								//.css("background-color",color)
								//.find("h2").text(i[passed_month]+" "+year);

					// find elements (dates) to be clicked on each time
					// the calendar is generated
					
					//clickedElement = bothCals.find(".calendar_content").find("div");
					var clicked = false;
					selectDates(selected);

					clickedElement = calendar.datesBody.find('div');
					clickedElement.on("click", function(){
						clicked = $(this);
						if (clicked.hasClass('past-date')) { return; }
						var whichCalendar = calendar.name;
						console.log(whichCalendar);
						// Understading which element was clicked;
						// var parentClass = $(this).parent().parent().attr('class');
						if (firstClick && secondClick) {
							thirdClicked = getClickedInfo(clicked, calendar);
							var firstClickDateObj = new Date(firstClicked.year, 
														firstClicked.month, 
														firstClicked.date);
							var secondClickDateObj = new Date(secondClicked.year, 
														secondClicked.month, 
														secondClicked.date);
							var thirdClickDateObj = new Date(thirdClicked.year, 
														thirdClicked.month, 
														thirdClicked.date);
							if (secondClickDateObj > thirdClickDateObj
								&& thirdClickDateObj > firstClickDateObj) {
								secondClicked = thirdClicked;
								// then choose dates again from the start :)
								bothCals.find(".calendar_content").find("div").each(function(){
									$(this).removeClass("selected");
								});
								selected = {};
								selected[firstClicked.year] = {};
								selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
								selected = addChosenDates(firstClicked, secondClicked, selected);
							} else { // reset clicks
								selected = {};
								firstClicked = [];
								secondClicked = [];
								firstClick = false;
								secondClick = false;
								bothCals.find(".calendar_content").find("div").each(function(){
									$(this).removeClass("selected");
								});	
							}
						}
						if (!firstClick) {
							firstClick = true;
							firstClicked = getClickedInfo(clicked, calendar);
							selected[firstClicked.year] = {};
							selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
						} else {
							console.log('second click');
							secondClick = true;
							secondClicked = getClickedInfo(clicked, calendar);
							//console.log(secondClicked);

							// what if second clicked date is before the first clicked?
							var firstClickDateObj = new Date(firstClicked.year, 
														firstClicked.month, 
														firstClicked.date);
							var secondClickDateObj = new Date(secondClicked.year, 
														secondClicked.month, 
														secondClicked.date);

							if (firstClickDateObj > secondClickDateObj) {

								var cachedClickedInfo = secondClicked;
								secondClicked = firstClicked;
								firstClicked = cachedClickedInfo;
								selected = {};
								selected[firstClicked.year] = {};
								selected[firstClicked.year][firstClicked.month] = [firstClicked.date];

							} else if (firstClickDateObj.getTime() ==
										secondClickDateObj.getTime()) {
								selected = {};
								firstClicked = [];
								secondClicked = [];
								firstClick = false;
								secondClick = false;
								$(this).removeClass("selected");
							}


							// add between dates to [selected]
							selected = addChosenDates(firstClicked, secondClicked, selected);
						}
						
						// ### 取得 ID
						var checkinDay = document.getElementById("checkinDate");
						
						 // ### 取得日期的值
		        		checkinDay.value =  firstClicked.year + "-" + (firstClicked.month + 1) + "-" + firstClicked.date;
		       			console.log("這邊是測試資料" + checkinDay.value);
						
						
						// console.log(selected);
						selectDates(selected);
					});			

				}
				function selectDates(selected) {
					if (!$.isEmptyObject(selected)) {
						var dateElements1 = datesBody1.find('div');
						var dateElements2 = datesBody2.find('div');

						function highlightDates(passed_year, passed_month, dateElements){
							if (passed_year in selected && passed_month in selected[passed_year]) {
								var daysToCompare = selected[passed_year][passed_month];
								// console.log(daysToCompare);
								for (var d in daysToCompare) {
									dateElements.each(function(index) {
										if (parseInt($(this).text()) == daysToCompare[d]) {
											$(this).addClass('selected');
										}
									});	
								}
								
							}
						}

						highlightDates(year, month, dateElements1);
						highlightDates(nextYear, nextMonth, dateElements2);
					}
				}

				function makeMonthArray(passed_month, passed_year) { // creates Array specifying dates and weekdays
					var e=[];
					for(var r=1;r<getDaysInMonth(passed_year, passed_month)+1;r++) {
						e.push({day: r,
								// Later refactor -- weekday needed only for first week
								weekday: daysArray[getWeekdayNum(passed_year,passed_month,r)]
							});
					}
					return e;
				}
				function makeWeek(week) {
					week.empty();
					for(var e=0;e<7;e++) { 
						week.append("<div>"+daysArray[e].substring(0,3)+"</div>") 
					}
				}

				function getDaysInMonth(currentYear,currentMon) {
					return(new Date(currentYear,currentMon+1,0)).getDate();
				}
				function getWeekdayNum(e,t,n) {
					return(new Date(e,t,n)).getDay();
				}
				function checkToday(e) {
					var todayDate = today.getFullYear()+'/'+(today.getMonth()+1)+'/'+today.getDate();
					var checkingDate = e.getFullYear()+'/'+(e.getMonth()+1)+'/'+e.getDate();
					return todayDate==checkingDate;

				}
				function getAdjacentMonth(curr_month, curr_year, direction) {
					var theNextMonth;
					var theNextYear;
					if (direction == "next") {
						theNextMonth = (curr_month + 1) % 12;
						theNextYear = (curr_month == 11) ? curr_year + 1 : curr_year;
					} else {
						theNextMonth = (curr_month == 0) ? 11 : curr_month - 1;
						theNextYear = (curr_month == 0) ? curr_year - 1 : curr_year;
					}
					return [theNextMonth, theNextYear];
				}
				function b() {
					today = new Date;
					year = today.getFullYear();
					month = today.getMonth();
					var nextDates = getAdjacentMonth(month, year, "next");
					nextMonth = nextDates[0];
					nextYear = nextDates[1];
				}

				var e=480;

				var today;
				var year,
					month,
					nextMonth,
					nextYear;

				//var t=2013;
				//var n=9;
				var r = [];
				var i = ["January","February","March","April","May",
						"June","July","August","September","October",
						"November","December"];
				var daysArray = ["Sunday","Monday","Tuesday",
								"Wednesday","Thursday","Friday","Saturday"];
				var o = ["#16a085","#1abc9c","#c0392b","#27ae60",
						"#FF6860","#f39c12","#f1c40f","#e67e22",
						"#2ecc71","#e74c3c","#d35400","#2c3e50"];
				
				var cal1=$("#calendar_first");
				var calHeader1=cal1.find(".calendar_header");
				var weekline1=cal1.find(".calendar_weekdays");
				var datesBody1=cal1.find(".calendar_content");

				var cal2=$("#calendar_second");
				var calHeader2=cal2.find(".calendar_header");
				var weekline2=cal2.find(".calendar_weekdays");
				var datesBody2=cal2.find(".calendar_content");

				var bothCals = $(".calendar");

				var switchButton = bothCals.find(".calendar_header").find('.switch-month');

				var calendars = { 
								"cal1": { 	"name": "first",
											"calHeader": calHeader1,
											"weekline": weekline1,
											"datesBody": datesBody1 },
								"cal2": { 	"name": "second",
											"calHeader": calHeader2,
											"weekline": weekline2,
											"datesBody": datesBody2	}
								}
				

				var clickedElement;
				var firstClicked,
					secondClicked,
					thirdClicked;
				var firstClick = false;
				var secondClick = false;	
				var selected = {};

				b();
				c(month, year, 0);
				c(nextMonth, nextYear, 1);
				switchButton.on("click",function() {
					var clicked=$(this);
					var generateCalendars = function(e) {
						var nextDatesFirst = getAdjacentMonth(month, year, e);
						var nextDatesSecond = getAdjacentMonth(nextMonth, nextYear, e);
						month = nextDatesFirst[0];
						year = nextDatesFirst[1];
						nextMonth = nextDatesSecond[0];
						nextYear = nextDatesSecond[1];

						c(month, year, 0);
						c(nextMonth, nextYear, 1);
					};
					if(clicked.attr("class").indexOf("left")!=-1) { 
						generateCalendars("previous");
					} else { generateCalendars("next"); }
					clickedElement = bothCals.find(".calendar_content").find("div");
					console.log("checking");
				});


				//  Click picking stuff
				function getClickedInfo(element, calendar) {
					var clickedInfo = {};
					var clickedCalendar,
						clickedMonth,
						clickedYear;
					clickedCalendar = calendar.name;
					//console.log(element.parent().parent().attr('class'));
					clickedMonth = clickedCalendar == "first" ? month : nextMonth;
					clickedYear = clickedCalendar == "first" ? year : nextYear;
					clickedInfo = {"calNum": clickedCalendar,
									"date": parseInt(element.text()),
									"month": clickedMonth,
									"year": clickedYear}
					//console.log(clickedInfo);
					return clickedInfo;
				}


				// Finding between dates MADNESS. Needs refactoring and smartening up :)
				function addChosenDates(firstClicked, secondClicked, selected) {
					
					// ### 取得 ID
					
					
					if (secondClicked.date > firstClicked.date || 
						secondClicked.month > firstClicked.month ||
						secondClicked.year > firstClicked.year) {

						var added_year = secondClicked.year;
						var added_month = secondClicked.month;
						var added_date = secondClicked.date;
						var checkoutDay = document.getElementById("checkoutDate");
						// ### 取得 checkout 日期 
						checkoutDay.value = formatDate(new Date(added_year, added_month, added_date));

						function formatDate(date) {
						    var year = date.getFullYear();
						    var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 月份是从0开始计数的，所以要加1
						    var day = date.getDate().toString().padStart(2, '0');
						    return year + '-' + month + '-' + day;
						}
						
						console.log(checkoutDay);
						console.log(selected);

						if (added_year > firstClicked.year) {	
							// first add all dates from all months of Second-Clicked-Year
							selected[added_year] = {};
							selected[added_year][added_month] = [];
							for (var i = 1; 
								i <= secondClicked.date;
								i++) {
								selected[added_year][added_month].push(i);
							}
					
							added_month = added_month - 1;
							console.log(added_month);
							while (added_month >= 0) {
								selected[added_year][added_month] = [];
								for (var i = 1; 
									i <= getDaysInMonth(added_year, added_month);
									i++) {
									selected[added_year][added_month].push(i);
								}
								added_month = added_month - 1;
							}

							added_year = added_year - 1;
							added_month = 11; // reset month to Dec because we decreased year
							added_date = getDaysInMonth(added_year, added_month); // reset date as well

							// Now add all dates from all months of inbetween years
							while (added_year > firstClicked.year) {
								selected[added_year] = {};
								for (var i=0; i < 12; i++) {
									selected[added_year][i] = [];
									for (var d = 1; d <= getDaysInMonth(added_year, i); d++) {
										selected[added_year][i].push(d);
									}
								}
								added_year = added_year - 1;
							}
						}
						
						if (added_month > firstClicked.month) {
							if (firstClicked.year == secondClicked.year) {
								console.log("here is the month:",added_month);
								selected[added_year][added_month] = [];
								for (var i = 1; 
									i <= secondClicked.date;
									i++) {
									selected[added_year][added_month].push(i);
								}
								added_month = added_month - 1;
							}
							while (added_month > firstClicked.month) {
								selected[added_year][added_month] = [];
								for (var i = 1; 
									i <= getDaysInMonth(added_year, added_month);
									i++) {
									selected[added_year][added_month].push(i);
								}
								added_month = added_month - 1;
							}
							added_date = getDaysInMonth(added_year, added_month);
						}

						for (var i = firstClicked.date + 1; 
							i <= added_date;
							i++) {
							selected[added_year][added_month].push(i);
						}
					}
					return selected;
				}
		});

		})(jQuery);
				
	</script>
	<%-- <script src="<c:url value='/js/openPopup.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/map.js' />"></script> --%>
	<!-- Google API -->
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcMmmBHFZoCAlSCJYnNiKtLR9Ko-jSoC0&callback=initMap"></script> 
	</body>