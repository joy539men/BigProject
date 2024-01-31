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
<meta charset="utf-8" />
<title>Book page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=5" />
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
				<a class="navbar-brand" href="index.html"> <img
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
						<li class="nav-item"><a class="nav-link" href="index.html">訂單</a>
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
								<li><a class="dropdown-item" href="blog.html">Blog</a></li>
								<li><a class="dropdown-item" href="blog-details.html">Blog
										Details</a></li>
								<li><a class="dropdown-item" href="service-details.html">Service
										Details</a></li>
								<li><a class="dropdown-item" href="faq.html">FAQ&#39;s</a>
								</li>
								<li><a class="dropdown-item" href="legal.html">Legal</a></li>
								<li><a class="dropdown-item" href="terms.html">Terms
										&amp; Condition</a></li>
								<li><a class="dropdown-item" href="privacy-policy.html">Privacy
										&amp; Policy</a></li>
							</ul></li>
					</ul>

					<div>
						<!-- account btn -->
						<ul class="nav">
							<li class="nav-item dropdown"><a
								class="p-3 border rounded-pill" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									<img style="width: 15px" src="../images/icon/fish.png" alt="" />
									<img class="mb-1" style="width: 50px" src="../images/logo.png"
									alt="" />
							</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li class="dropdown-item"><img class="img-fluid"
										style="width: 50px" src="../images/logo.png" alt="" />
										<h4>Krist</h4></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item"
										href="<c:url value="/bookTrip"></c:url>">旅程</a></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item" href="blog-details.html">訊息</a></li>
									<li><a class="dropdown-item" href="service-details.html">行程規劃</a></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item" href="faq.html">幫助</a></li>
									<li><a href="<c:url value="/logout"></c:url>"
										class="dropdown-item">登 出</a>></li>
								</ul></li>
						</ul>
					</div>

				</div>
			</div>
		</nav>
	</header>

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
								<img class="img-fluid w-50" src="../${user.filePath}" alt="${user.userName }" />
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
					<div id="map" style="width: 100%;"></div>




					<c:forEach var="review" items="${reviews}">
						<hr>
						<h6>${review.user.userName}</h6>

						<p>${review.review_date }</p>
						<h5 class="">${review.comment }</h5>



					</c:forEach>
					<hr>
					<h3 class="p-2">日 期 選 擇</h3>
					<div class="calendar calendar-first ms-4" id="calendar_first">
						<div class="calendar_header">
							<button class="switch-month switch-left">
								<i class="fa fa-chevron-left"></i>
							</button>
							<button class="switch-month switch-right">
								<i class="fa fa-chevron-right"></i>
							</button>
						</div>
						<div class="calendar_weekdays"></div>
						<div class="calendar_content"></div>


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
											<form:input type="date" class="form-control shadow-none"
												id="checkinDate" placeholder="ex: 1~5" path="checkinDate" />
											<form:errors path="checkinDate" cssClass="error" />
										</div>
									</div>
									<div class="col-lg-6 mb-4 pb-2">
										<div class="form-group">
											<label for="checkoutDate" class="form-label">退 住 日 期</label>
											<form:input type="date" class="form-control shadow-none"
												id="checkoutDate" placeholder="ex: 克里斯" path="checkoutDate" />
											<form:errors path="checkoutDate" cssClass="error" />
										</div>
									</div>
									<div class="col-lg-12 mb-4 pb-2">
										<div class="form-group">
											<label for="guest" class="form-label">旅 客 人 數</label>
											<form:input type="number" class="form-control shadow-none"
												id="guest" placeholder="ex: 1~5" path="guest" />
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
	<script src="../calendar-03/js/calendarMain.js"></script>
	<!-- <link rel="stylesheet" href="../calendar-03/js/calendarMain.js" /> -->

	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							window
									.addEventListener(
											"scroll",
											function() {
												var bookPage = document
														.getElementById("fix-box");
												var information = document
														.getElementById("fix-information")
												var scrollPosition = window.scrollY
														|| window.pageYOffset
														|| document.documentElement.scrollTop;

												// 計算寬度
												var rightWidth = document
														.getElementById("bookButtom").offsetWidth;
												console.log(rightWidth);
												var imageWidth = document
														.getElementById("fix-box").offsetWidth;
												var mathWidth = rightWidth
														- imageWidth;
												console.log(mathWidth);
												console.log(scrollPosition);

												// 下滑時訂購單可以貼在旁邊以供參考
												if (scrollPosition > 641) {
													bookPage
															.setAttribute(
																	"class",
																	"col-4 fixed-top mt-4"); // 使用 setAttribute 修正类名
													bookPage
															.setAttribute(
																	"style",
																	"width:416px; height:436px; left:842px ")
													information.setAttribute(
															"class",
															"col-6 sticky-top")
													information.setAttribute(
															"style",
															"right:598px;")
												} else {
													bookPage.setAttribute(
															"class", "col-4"); // 使用 setAttribute 修正类名
													bookPage
															.setAttribute(
																	"style",
																	"width:416px; height:436px; ")
													information.setAttribute(
															"class", "col-6")
												}
											})
						})

		function initMap() {

			var latitude = ${singleRoom.lat};
			var longtitude = ${singleRoom.lon};
			var map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : latitude,
					lng : longtitude
				},
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

			$(document)
					.ready(
							function() {
								// 監聽日期和人數輸入
								$("#checkinDate, #checkoutDate, #guest")
										.on(
												"input",
												function() {
													// 獲取輸入的日期和人數
													var checkinDate = $(
															"#checkinDate")
															.val();
													var checkoutDate = $(
															"#checkoutDate")
															.val();
													var guest = $("#guest")
															.val();

													// 使用 AJAX 發送請求到後端計算總金額
													$
															.get(
																	"/pillowSurfing/calculateAmount",
																	{
																		checkinDate : checkinDate,
																		checkoutDate : checkoutDate,
																		guest : guest
																	})
															.done(
																	function(
																			data) {
																		// 更新總金額變化
																		$(
																				"#calculatedAmount")
																				.text(
																						data.amount);
																	})
															.fail(
																	function(
																			jqXHR,
																			textStatus,
																			errorThrown) {
																		console
																				.error(
																						"AJAX request failed:",
																						textStatus,
																						errorThrown);
																	});
												});
							});

			console.log("Checkout Date:", $("#checkoutDate").val());
			console.log("Checkin Date:", $("#checkinDate").val());

		}
	</script>
	<!-- Google API -->
	<script defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcMmmBHFZoCAlSCJYnNiKtLR9Ko-jSoC0&callback=initMap"></script>
</body>