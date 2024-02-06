<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en-us">

<head>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>User Profile</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=5">
<meta name="description" content="This is meta description">
<meta name="author" content="Themefisher">
<link rel="shortcut icon" href="./images/logo.ico" type="image/x-icon">
<link rel="icon" href="images/logo.ico" type="image/x-icon">

<!-- # CSS Plugins -->

<link rel="stylesheet" href="plugins/slick/slick.css">
<link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css">
<link rel="stylesheet" href="plugins/font-awesome/brands.css">
<link rel="stylesheet" href="plugins/font-awesome/solid.css">

<!-- # Main Style Sheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/providerStyle.css">
</head>

<body>

	<header class="navigation">
		<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
			<div class="container">
				<a href="<c:url value="/roomTableGallery"></c:url>"
					class="navbar-brand"> <img loading="prelaod" decoding="async"
					class="img-fluid" width="120" src="images/logo.png"
					alt="CouchSurfing">
				</a>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/bookTrip"></c:url>">訂單</a></li>
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
								<li><a class="dropdown-item" href="terms.html">條約 &amp;
										法律責任</a></li>
							</ul></li>
					</ul>

					<div>
						<!-- account btn -->
						<ul class="nav">
							<li class="nav-item dropdown"><a
								class="p-3 border rounded-pill" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									<img style="width: 15px" src="images/icon/fish.png" alt="" />
									<img class="img-fluid rounded-circle mb-1" style="width: 50px"
									src="<c:url value = '${loginUser.filePath}'/>" alt="" /> <%-- <c:url value = '${room.filePath}'/> --%>
							</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li class="dropdown-item"><img
										class="img-fluid rounded-circle" style="width: 50px"
										src="<c:url value = '${loginUser.filePath}'/>" alt="" />
										<h4>${loginUser.userName }</h4></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item"
										href="<c:url value="/bookTrip"></c:url>">旅程</a></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a class="dropdown-item" href="blog-details.html">訊息</a></li>
									<li><a id="openPopup" class="dropdown-item"
										href="<c:url value="/map/{lat}/{lng}/{dis}"></c:url>">房源地圖</a></li>
									<li class="dropdown-item">
										<hr />
									</li>
									<li><a href="<c:url value="/userProfile"></c:url>"
										class="dropdown-item">會員中心</a></li>
									<li><a class="dropdown-item" href="faq.html">幫助</a></li>
									<li><a href="<c:url value="/logout"></c:url>"
										class="dropdown-item">登 出</a></li>
								</ul></li>
						</ul>
					</div>

				</div>
			</div>
		</nav>

	</header>

	<hr>
	<div class="container my-4">
		<h2 class="mb-3">會員資料</h2>
		<!-- 姓名 and 信箱 -->
		<div class="row mb-3">
			<div class="col">
				<label for="name" class="form-label" style="font-size: 18px;">姓名</label>
				<div class="form-control" id="userName" style="font-size: 18px;">${user.userName}</div>
			</div>
			<div class="col">
				<label for="email" class="form-label" style="font-size: 18px;">Email</label>
				<div class="form-control" id="email" style="font-size: 18px;">${user.email}</div>
			</div>
		</div>

		<!-- 密碼 and 身分證 -->
		<div class="row mb-3">
			<div class="col">
				<label for="password" class="form-label" style="font-size: 18px;">密碼</label>
				<div class="form-control" id="password" style="font-size: 18px;">**********</div>
			</div>
			<div class="col">
				<label for="idCard" class="form-label" style="font-size: 18px;">身分證</label>
				<div class="form-control" id="identity" style="font-size: 18px;">${user.identity}</div>
			</div>
		</div>

		<!-- 電話 and 地址-->
		<div class="row mb-3">
			<div class="col">
				<label for="phone" class="form-label" style="font-size: 18px;">電話</label>
				<div class="form-control" id="phone" style="font-size: 18px;">${user.phone}</div>
			</div>
			<div class="col">
				<label for="address" class="form-label" style="font-size: 18px;">地址</label>
				<div class="form-control" id="address" style="font-size: 18px;">${user.address}</div>
			</div>
		</div>

		<!-- 大頭貼 -->
		<div class="mb-3">
			<label for="profilePicture" class="form-label"
				style="font-size: 18px;">大頭貼</label> <img
				src="<c:url value = '${user.filePath}'/>"
				style="max-width: 100%; max-height: 150px; height: auto; width: auto;">
		</div>

		<div class="row">
			<div class="col text-center">
				<a href="<c:url value = '/userProfileEdit'/>"
					class="btn btn-primary" style="font-size: 20px;">編輯</a>
			</div>
		</div>
	</div>




	<!-- # JS Plugins -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>

	<!-- Main Script -->
	<script src="js/script.js"></script>
</body>
</html>