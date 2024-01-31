<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en-us">

<head>
	<meta charset="utf-8">
	<title>Personal Information</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
	<meta name="description" content="This is meta description">
	<meta name="author" content="Themefisher">
	<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
	<link rel="icon" href="images/favicon.png" type="image/x-icon">
  
  <!-- theme meta -->
  <meta name="theme-name" content="Personal Information" />

	<!-- # Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">

	<!-- # CSS Plugins -->
	<link rel="stylesheet" href="plugins/slick/slick.css">
	<link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css">
	<link rel="stylesheet" href="plugins/font-awesome/brands.css">
	<link rel="stylesheet" href="plugins/font-awesome/solid.css">

	<!-- # Main Style Sheet -->
	<link rel="stylesheet" href="css/style.css">

  <!-- # Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>

<body>

<!-- navigation -->
<header class="navigation ">
	<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
		<div class="container">
			<a class="navbar-brand" href="index.html">
				<img loading="prelaod" decoding="async" class="img-fluid" width="120" src="images/logo.png" alt="CouchSurfing">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
					<li class="nav-item"> <a class="nav-link" href="index.html">訂單</a>
					</li>
					<li class="nav-item "> <a class="nav-link" href="about.html">日曆</a>
					</li>
					<li class="nav-item "> <a class="nav-link" href="services.html">收件夾</a>
					</li>
					<li class="nav-item "> <a class="nav-link" href="contact.html">聯絡我們</a>
					</li>
					<li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">選單</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item " href="blog.html">Blog</a>
							</li>
							<li><a class="dropdown-item " href="blog-details.html">Blog Details</a>
							</li>
							<li><a class="dropdown-item " href="service-details.html">Service Details</a>
							</li>
							<li><a class="dropdown-item " href="faq.html">FAQ&#39;s</a>
							</li>
							<li><a class="dropdown-item " href="legal.html">Legal</a>
							</li>
							<li><a class="dropdown-item " href="terms.html">Terms &amp; Condition</a>
							</li>
							<li><a class="dropdown-item " href="privacy-policy.html">Privacy &amp; Policy</a>
							</li>
						</ul>
					</li>
				</ul>
        <div>
          <!-- account btn --> <a href="#!" class="p-3 border rounded-pill "><i class="bi w-50 bi-list pe-4" style="font-size: 20px;"></i><img  style="width:50px" src="images/logo.png" alt=""></a>
				  <!-- account btn <a href="#!" class="btn btn-primary ms-2 ms-lg-3">註 冊</a> -->
        </div>
			</div>
		</div>
	</nav>
</header>

<hr>
	<c:url var='register' value='/userModSave' />
	<form:form method="post" modelAttribute="user" action="${ register}"
		enctype="multipart/form-data">
		<div class="container my-4">
			<h2 class="mb-3">會員修改</h2>
			<!-- Name and Email -->
			<div class="row mb-3">
				<div class="col">
					<label for="name" class="form-label" style="font-size: 18px;">姓名</label>
					<form:input path="userName" value="${user.userName}" />
				</div>
				<div class="col">
					<label for="email" class="form-label" style="font-size: 18px;">Email</label>
					<form:input path="email" value="${user.email}" />
				</div>
			</div>

			<!-- Password and ID Card Number -->
			<div class="row mb-3">
				<div class="col">
					<label for="password" class="form-label" style="font-size: 18px;">密碼</label>
					<form:input path="password" value="${user.password}" />
				</div>
				<div class="col">
					<label for="idCard" class="form-label" style="font-size: 18px;">身分證</label>
					<form:input path="identity" value="${user.identity}" />
				</div>
			</div>

			<!-- Phone and Address -->
			<div class="row mb-3">
				<div class="col">
					<label for="phone" class="form-label" style="font-size: 18px;">電話</label>
					<form:input path="phone" value="${user.phone}" />
				</div>
				<div class="col">
					<label for="address" class="form-label" style="font-size: 18px;">地址</label>
					<form:input path="address" value="${user.address}" />
				</div>
			</div>

			<!-- Profile Picture -->
			<div class="mb-3">
				<label for="profilePicture" class="form-label"
					style="font-size: 18px;">更改大頭貼</label> <img
					src="<c:url value = '${user.filePath}'/>" style="height: 300px">
				<form:input path="multipartFile" type="file" />
			</div>

			<div class="row">
				<div class="col text-center">
					<button type="submit" class="btn btn-primary"
						style="font-size: 20px;">確認更改</button>
				</div>
			</div>
		</div>
	</form:form>



	<!-- # JS Plugins -->
		<script src="plugins/jquery/jquery.min.js"></script>
		<script src="plugins/bootstrap/bootstrap.min.js"></script>
		<script src="plugins/slick/slick.min.js"></script>
		<script src="plugins/scrollmenu/scrollmenu.min.js"></script>

		<!-- Main Script -->
		<script src="js/script.js"></script>
</body>
</html>