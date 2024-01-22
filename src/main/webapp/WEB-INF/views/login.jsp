<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Login</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=5">
<meta name="description" content="This is meta description">
<meta name="author" content="Themefisher">
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

<!-- theme meta -->
<meta name="theme-name" content="Login" />

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

</head>

<body>

	<!-- navigation -->
	<header class="navigation bg-tertiary">
		<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
			<div class="container">
				<a class="navbar-brand" href="index.html"> <img
					loading="prelaod" decoding="async" class="img-fluid" width="120"
					src="images/logo.png" alt="CouchSurfing">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="index.html">首頁</a>
						</li>
						<li class="nav-item "><a class="nav-link" href="about.html">關於</a>
						</li>
						<li class="nav-item "><a class="nav-link"
							href="services.html">服務</a></li>
						<li class="nav-item "><a class="nav-link" href="contact.html">聯絡我們</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">頁面</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item " href="blog.html">Blog</a></li>
								<li><a class="dropdown-item " href="blog-details.html">Blog
										Details</a></li>
								<li><a class="dropdown-item " href="service-details.html">Service
										Details</a></li>
								<li><a class="dropdown-item " href="faq.html">FAQ&#39;s</a>
								</li>
								<li><a class="dropdown-item " href="legal.html">Legal</a></li>
								<li><a class="dropdown-item " href="terms.html">Terms
										&amp; Condition</a></li>
								<li><a class="dropdown-item " href="privacy-policy.html">Privacy
										&amp; Policy</a></li>
							</ul></li>
					</ul>
					<!-- account btn -->
					<a href="#!" class="btn btn-outline-primary">登 入</a>
					<!-- account btn -->
					<a href="#!" class="btn btn-primary ms-2 ms-lg-3">註 冊</a>
				</div>
			</div>
		</nav>
	</header>
	<!-- /navigation -->



	<section class="banner bg-tertiary position-relative overflow-hidden">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="ps-lg-4 text-center">
						<img loading="lazy" decoding="async" src="images/index_start.png"
							alt="banner image" class="w-100">
					</div>
				</div>

				<div class="col-lg-4">
					<div class="card mt-5">
						<div class="card-body">
							<h2 class="card-title text-center mb-4">會員登入</h2>

							<c:url var='login' value='/login' />
							<form:form method="POST" modelAttribute="userBean"
								action="${login}">
								<div class="mb-3">
									<label for="account" class="form-label"
										style="font-size: 24px;">帳號</label> <input type="text"
										class="form-control" id="account" name="account"
										placeholder="輸入帳號">
								</div>
								<div class="mb-3">
									<label for="password" class="form-label"
										style="font-size: 24px;">密碼</label> <input type="password"
										class="form-control" id="password" name="password"
										placeholder="輸入密碼">
								</div>
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-primary"
										style="font-size: 20px;">登入</button>
								</div>
							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>








	<!-- # JS Plugins -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>

	<!-- Main Script -->
	<script src="js/script.js"></script>

</body>

</html>