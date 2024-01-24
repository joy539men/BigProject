<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<title>Book page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
	<meta name="description" content="This is meta description">
	<meta name="author" content="Themefisher">
	<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
	<link rel="icon" href="images/favicon.png" type="image/x-icon">
  
  <!-- theme meta -->
  <meta name="theme-name" content="wallet" />

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
<header class="navigation">
		<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
			<div class="container">
				<a class="navbar-brand" href="index.html"> 
				<img
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
					        <li class="nav-item dropdown">
					            <a class="p-3 border rounded-pill"
					                href="#" id="navbarDropdown" role="button"
					                data-bs-toggle="dropdown" aria-expanded="false">
					                <img style="width: 15px" src="images/icon/fish.png" alt="" />
					                <img class="mb-1" style="width: 50px" src="images/logo.png" alt="" />
					            </a>
					            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					                <li class="dropdown-item">
					                    <img class="img-fluid" style="width: 50px" src="images/logo.png" alt="" />
					                    <h4>Krist</h4>
					                </li>
					                <li class="dropdown-item">
					                    <hr />
					                </li>
					                <li>
					                <%-- <a href="<c:url value="/webSocket"></c:url>">聊天系統</a> --%>
					                <a class="dropdown-item" href="<c:url value="/bookTrip"></c:url>">旅程</a>
					                
					                
					                </li>
					                <li class="dropdown-item">
					                    <hr />
					                </li>
					                <li><a class="dropdown-item" href="blog-details.html">訊息</a></li>
					                <li><a class="dropdown-item" href="service-details.html">行程規劃</a></li>
					                <li class="dropdown-item">
					                    <hr />
					                </li>
					                <li><a class="dropdown-item" href="faq.html">幫助</a></li>
					               <li><a href="<c:url value="/logout"></c:url>" class="dropdown-item">登 出</a>></li>
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
        
        <div>
          <div class="container border rounded">
            <div class="row">
              <div class="col-4 m-3 me-0">
                <img class="img-fluid" style="width: 300px" src="<c:url value='${roomDetail.filePath }'/>" alt="">
              </div>
              <div class="col-4 ms-0 mt-3">
                  <h3 class="mb-5">
                    房間名稱 : ${roomDetail.title }
                  </h3>
                  <p class="">訂房編號 :</p><br>
                  <h6>${booking.uuid }</h6>
                  <h5 class="mt-5">訂房日期</h5>
                  <h5>${booking.bookingTime }</h5>
              </div>
              <div class="col-3 mt-3">

                 <a class="btn btn-outline-primary ms-5" href="<c:url value="/webSocket"></c:url>">傳訊息給房東</a>
                <h5 class="ms-5 mt-4">
                  TW ${roomDetail.price } x ${booking.night } 晚 x ${booking.guest } 人
                </h5>
                <h6 class="ms-5 mb-5">總價 : ${amount }</h6>
                <h5 class="ms-5">房客</h5>
                <h6 class="ms-5">成人 1人 兒童 嬰幼兒</h6>
              </div>
            </div>
          </div>
        </div>
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
        <div>
          <div class="container border rounded">
            <div class="row">
              <div class="col-4 m-3 me-0">
                <img class="img-fluid" style="width: 300px" src="images/roomImages/zero-take-WvHrrR1C5Po-unsplash.jpg" alt="">
              </div>
              <div class="col-4 ms-0 mt-3">
                  <h3 class="mb-5">
                    房間名稱
                  </h3>
                  <p class="mb-5">訂房編號 : 88888888</p>
                  <h5 class="mt-5">訂房日期</h5>
                  <h5>2022/2/22</h5>
              </div>
              <div class="col-3 mt-3">
                <a class="btn btn-outline-primary ms-5" href="<c:url value="/webSocket"></c:url>">傳訊息給房東</a>
                <h5 class="ms-5 mt-4">
                  TW 16888 X 2
                </h5>
                <h6 class="ms-5 mb-5">總價 : 33766</h6>
                <h5 class="ms-5">房客</h5>
                <h6 class="ms-5">成人 1人 兒童 嬰幼兒</h6>
              </div>
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
