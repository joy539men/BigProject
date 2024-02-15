<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>


<html lang="en-us">

<head>
<meta charset="utf-8">
<title>Book page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=5">
<meta name="description" content="This is meta description">
<meta name="author" content="Themefisher">
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

<!-- theme meta -->
<meta name="theme-name" content="wallet" />

<!-- # Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- # CSS Plugins -->
<link rel="stylesheet" href="plugins/slick/slick.css">
<link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css">
<link rel="stylesheet" href="plugins/font-awesome/brands.css">
<link rel="stylesheet" href="plugins/font-awesome/solid.css">

<!-- # Main Style Sheet -->
<link rel="stylesheet" href="css/style.css">

<!-- # Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>

<body>
	<!-- navigation -->
	<%-- <header class="navigation">
		<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
			<div class="container">
				<a class="navbar-brand" href="index.html"> <img
					class="img-fluid" width="120" src="images/logo.png"
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
									<img style="width: 15px" src="images/icon/fish.png" alt="" />
									<img class="mb-1" style="width: 50px" src="images/logo.png"
									alt="" />
							</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li class="dropdown-item"><img class="img-fluid"
										style="width: 50px" src="images/logo.png" alt="" />
										<h4>Krist</h4></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li>
										<a href="<c:url value="/webSocket"></c:url>">聊天系統</a>
										<a class="dropdown-item"
										href="<c:url value="/bookTrip"></c:url>">旅程</a>


									</li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item" href="blog-details.html">訊息</a></li>
									<li><a class="dropdown-item" href="service-details.html">行程規劃</a></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<a href="<c:url value="/logout"></c:url>" class="dropdown-item">登 出</a>
									<li><a href="<c:url value="/logout"></c:url>"
										class="dropdown-item">登 出</a>></li>

								</ul></li>
						</ul>
					</div>

				</div>
			</div>
		</nav>
	</header> --%>
	
	
	<header class="navigation">
		<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
			<div class="container">
				<a class="navbar-brand" href="<c:url value="/login"></c:url>"> <img
					class="img-fluid" width="120" src="images/logo.png"
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
									<img style="width: 15px" src="images/icon/fish.png" alt="" />
									<img class="img-fluid rounded-circle mb-1" style="width: 50px" src="<c:url value = '${user.filePath}'/>"
									alt="" />
									<%-- <c:url value = '${room.filePath}'/> --%>
							</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li class="dropdown-item"><img class="img-fluid rounded-circle"
										style="width: 50px" src="<c:url value = '${user.filePath}'/>" alt="" />
										<h4>${user.userName }</h4></li>
									    <c:if test="${sessionScope.isAdmin}">
									    <li class="dropdown-item">
											<hr />
										</li>
             								<li><a class="dropdown-item " href="<c:url value='/admin/account' />">後台管理頁面</a>
            								</li>
										</c:if>	
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
									<li><a href="<c:url value="/userProfile"></c:url>"class="dropdown-item">會員中心</a></li>
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
	
	

	<hr>
	<!-- bookPage -->
	<section class="section pt-0 pb-0">
		<div class="container">
			<div class="row justify-content-center m-5">
				<div class="col-12">
					<div class="section-title">
						<h5>訂單資料</h5>
					</div>
				</div>

				<!--  <div id="houseList" class="w-75 mx-auto row">
				<%-- <c:forEach var="list" items="${combinedList}">
			<div class="col-4">
				<div id="houseA" class="card  houseCard mx-auto mb-5">
					<img class="card-img-top" src="<c:url value = '${list.guest}'/>"
						onclick="getRoomDetails(${list.guest})" />
					<div class="card-body">
						<h5 class="card-title ">${list.guest}</h5>
						<span class="card-text">${list.guest}</span><br> 
						<span class="card-text">${list.guest}人入住</span><br>
						${list.title }
					</div>
					
				</div>
			</div>
		</c:forEach> --%>
				<!-- </div> -->
				<%-- 
	<div id="houseList" class="w-75 mx-auto row">
		<c:forEach var="list" items="${combinedList}">
			<div class="col-4">
				<div id="houseA" class="card  houseCard mx-auto mb-5">
					<img class="card-img-top" src="<c:url value = '${list.filePath}'/>"
						 />
					<div class="card-body">
						<h5 class="card-title ">${room.title}</h5>
						<span class="card-text">${room.title}</span><br> 
						<span class="card-text">${room.title}人入住</span><br>
					</div>
					
				</div>
			</div>
		</c:forEach>
	</div>  --%>


				<c:forEach var="list" items="${combinedList}">

					<div>
						<div class="container border rounded mb-5">
							<div class="row ">

								<div class="col-4 m-3 me-0">
									<img class="img-fluid" style="width: 300px"
										src="<c:url value='${list.filePath }'/>" alt="">
								</div>
								<div class="col-4 ms-0 mt-3">
									<h3 class="mb-5">房間名稱 : ${list.title }</h3>
									<p class="">訂房編號 :</p>
									<br>
									<h6>${list.uuid }</h6>
									<h5 class="mt-5">訂房日期</h5>
									<h5 style="display:inline-block">${list.bookingTime }</h5>
											<!-- 判断是否已付款 -->
									<c:choose>
										<c:when test="${list.paymentStatus == '待付款'}">
											<!-- 如果未付款则显示付款按钮 -->
												<button class="btn btn-primary ms-5 mb-1" style="display:inline-block"
													onclick="makePayment('${list.id}','${list.uuid}','${list.title}','${list.totalPrice }')">付款</button>
												
										</c:when>
										<c:otherwise>
											<!-- 如果已付款则不显示付款按钮 -->
											<div class="col-12 mt-3" style="display:inline-block">
												<p>已付款</p>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-3 mt-3">
									<%-- <a class="btn btn-outline-primary ms-5"
										href="<c:url value="/webSocket"></c:url>">傳 送 訊 息</a>  --%>
									<a class="btn btn-outline-primary ms-5" href="javascript:void(0)" onclick="webSocket(${list.roomId})">傳 送 訊 息</a> 
									<a class="btn btn-outline-primary ms-5 mt-2" onclick= "reviewRoom(${list.roomId})">評 論 房 源</a>
									<h5 class="ms-5 mt-4">TW ${list.price } x ${list.night } 晚
										x ${list.guest } 人</h5>
									<h6 class="ms-5 mb-5">總價 : ${list.totalPrice }</h6>
									<h5 class="ms-5">房客</h5>
									<h6 class="ms-5">成人 ${list.guest }人</h6>
									<h6 class="ms-5">入住日期：${list.checkinDate } <br> 退房日期：${list.checkoutDate }</h6>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<hr>

	<!-- finsihBookPage -->

	<section class="section pt-0 mt-0">
		<div class="container">
			<div class="row justify-content-center m-5">
				<div class="col-12">
					<div class="section-title">
						<h5>已完成住宿</h5>
					</div>
				</div>
				
				
				<c:forEach var="list" items="${isOccupied}">

					<div>
						<div class="container border rounded mb-5">
							<div class="row ">

								<div class="col-4 m-3 me-0">
									<img class="img-fluid" style="width: 300px"
										src="<c:url value='${list.filePath }'/>" alt="">
								</div>
								<div class="col-4 ms-0 mt-3">
									<h3 class="mb-5">房間名稱 : ${list.title }</h3>
									<p class="">訂房編號 :</p>
									<br>
									<h6>${list.uuid }</h6>
									<h5 class="mt-5">訂房日期</h5>
									<h5>${list.bookingTime }</h5>
								</div>
								<div class="col-3 mt-3">
									<a class="btn btn-outline-primary ms-5" href="javascript:void(0)" onclick="webSocket(${list.roomId})">傳 送 訊 息</a> 
										
								<%-- 	<a class="btn btn-outline-primary ms-5"
									href="<c:url value="/webSocket"></c:url>">傳 送 訊 息</a>  --%>
									<a class="btn btn-outline-primary ms-5 mt-2" onclick= "reviewRoom(${list.roomId})">評 論 房 源</a>
									<!-- <a class="btn btn-outline-primary ms-5" onclick="sendMessage()">傳訊息給房東</a> -->
									<!-- <a href="#!" class="btn btn-outline-primary ms-5">傳訊息給房東</a> -->
									<h5 class="ms-5 mt-4">TW ${list.price } x ${list.night } 晚
										x ${list.guest } 人</h5>
									<h6 class="ms-5 mb-5">總價 : ${list.totalPrice }</h6>
									<h5 class="ms-5">房客</h5>
									<h6 class="ms-5">成人 ${list.guest }人</h6>
									<h6 class="ms-5">入住日期：${list.checkinDate } <br> 退房日期：${list.checkoutDate }</h6>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<%-- <section>
		<div id="houseList" class="w-75 mx-auto row">
			<c:forEach var="room" items="${bookTripRoomList}">
				<div class="col-4">
					<div id="houseA" class="card  houseCard mx-auto mb-5">
						<img class="card-img-top"
							src="<c:url value = '${room.filePath}'/>"
							onclick="getRoomDetails(${room.roomId})" />
						<div class="card-body">
							<h5 class="card-title ">${room.title}</h5>
							<span class="card-text">${room.type}</span><br> <span
								class="card-text">${room.guestMax}人入住</span><br>
						</div>

					</div>
				</div>
			</c:forEach>
			
		</div>

	</section> --%>



	<!-- # JS Plugins -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>

	<!-- Main Script -->
	<script src="js/script.js"></script>

	<script>
		function sendMessage() {
			var roomId = 55;
			var messageContent = "Hello, this is a test message.";

			var messageData = {
				// 构造你的消息数据
				// 例如：roomId, messageContent等
				key1 : 'value1',
				key2 : 'value2'
			};

			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/pillowSurfing/send/" + roomId,
				data : JSON.stringify(messageData),
				success : function(response) {
					console.log(response);

					// 如果消息发送成功，跳转到聊天页面
					window.location.href = "/pillowSurfing/chat"; // 根据实际聊天页面路径进行调整
				},
				error : function(error) {
					console.error(error);
					// 处理错误的情况
				}
			});
		}

		function reviewRoom(roomId) {
			window.location.href = "/pillowSurfing/evaluation/" + roomId;
			}
		function webSocket(roomId) {
			var redirectUrl = "/pillowSurfing/webSocket/" + roomId;

			window.location.href = redirectUrl;
			
			}
		
		   function makePayment(bookingID,uuid,title,totalPrice) {
		    	let processedUUID = uuid.replace(/-/g, '').substring(0, 20);
		    	console.log(uuid)
		    	console.log(processedUUID)
		        // 發送 AJAX 請求
		        $.ajax({
		            type: "POST",
		            url: "/pillowSurfing/ecpayCheckout",
		            contentType: "application/x-www-form-urlencoded",
		            data: {
		                itemName: title,
		                merchantTradeNo: processedUUID,
		                merchantTradeDate: getTime(),
		                totalAmount: totalPrice,
		                orderId: bookingID,
		            },
		            success: function(response) {
		                console.log(response); 
		                var newWindow = window.open("", "_self");

		                newWindow.document.write(response);
		                newWindow.document.getElementById("allPayAPIForm").submit();
		            },
		            error: function(xhr, status, error) {
		                console.error(error);
		            }
		        });
		    };
		    function getTime() {
				// 取得現在的日期時間
				var currentDate = new Date();

				// 取得年、月、日、時、分、秒
				var year = currentDate.getFullYear();
				var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 月份從0開始，需要加1
				var day = ('0' + currentDate.getDate()).slice(-2);
				var hours = ('0' + currentDate.getHours()).slice(-2);
				var minutes = ('0' + currentDate.getMinutes()).slice(-2);
				var seconds = ('0' + currentDate.getSeconds()).slice(-2);

				// 格式化日期時間字串
				var formattedDateTime = year + '/' + month + '/' + day + ' ' + hours + ':' + minutes + ':' + seconds;
				console.log(formattedDateTime); 
				return formattedDateTime;
			}
	</script>

</body>
</html>
