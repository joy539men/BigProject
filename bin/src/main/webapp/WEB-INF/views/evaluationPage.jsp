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
    <meta charset="utf-8" />
    <title>Book page</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=5"
    />
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
      rel="stylesheet"
    />

    <!-- # CSS Plugins -->
    <link rel="stylesheet" href="plugins/slick/slick.css" />
    <link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css" />
    <link rel="stylesheet" href="plugins/font-awesome/brands.css" />
    <link rel="stylesheet" href="plugins/font-awesome/solid.css" />

    <!-- # Main Style Sheet -->
    <link rel="stylesheet" href="css/style.css" />

    <!-- # Bootstrap -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
    />

    <style>
      .star_size {
        font-size: 50px;
      }
    </style>
  </head>

  <body>
    <!-- navigation -->
    <header class="navigation">
      <nav class="navbar navbar-expand-xl navbar-light text-center py-3">
        <div class="container">
          <a class="navbar-brand" href="index.html">
            <img
              loading="prelaod"
              decoding="async"
              class="img-fluid"
              width="120"
              src="images/logo.png"
              alt="CouchSurfing"
            />
          </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="index.html">訂單</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">日曆</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="services.html">收件夾</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.html">聯絡我們</a>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  >選單</a
                >
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="blog.html">Blog</a></li>
                  <li>
                    <a class="dropdown-item" href="blog-details.html"
                      >Blog Details</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item" href="service-details.html"
                      >Service Details</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item" href="faq.html">FAQ&#39;s</a>
                  </li>
                  <li><a class="dropdown-item" href="legal.html">Legal</a></li>
                  <li>
                    <a class="dropdown-item" href="terms.html"
                      >Terms &amp; Condition</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item" href="privacy-policy.html"
                      >Privacy &amp; Policy</a
                    >
                  </li>
                </ul>
              </li>
            </ul>
            <div>
              <!-- account btn -->
              <li class="dropdown">
                <a class="p-3 border rounded-pill"href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi w-50 bi-list pe-4" style="font-size: 20px"></i><img style="width: 50px" src="images/logo.png" alt=""/></a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li class="dropdown-item">
                    <img class="img-fluid" style="width: 50px" src="images/logo.png" alt=""/>
                    <h4>Krist</h4>
                  </li>
                  <li class="dropdown-item">
                    <hr />
                  </li>
                  <li><a class="dropdown-item" href="blog.html">旅程</a></li>
                  <li class="dropdown-item">
                    <hr />
                  </li>
                  <li>
                    <a class="dropdown-item" href="blog-details.html">訊息</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="service-details.html">行程規劃</a>
                  </li>
                  <li class="dropdown-item">
                    <hr />
                  </li>
                  <li><a class="dropdown-item" href="faq.html">幫助</a></li>
                  <li><a class="dropdown-item" href="legal.html">登出</a></li>
                </ul>
              </li>
            </div>
          </div>
        </div>
      </nav>
    </header>

    <hr />

    <!-- Evaluation page -->
    <section class="section pt-0">
      <div class="container">
        <div class="row justify-content-center">
          <h1 class="text-center">留下評價</h1>
          <div class="border rounded h-75 shadow-sm m-5 p-5">
            <div class="text-center">
              <i class="bi bi-star-fill text-primary star_size me-2"></i>
			  <i class="bi bi-star-fill text-primary star_size  me-2"></i>
			  <i class="bi bi-star-fill text-primary star_size  me-2"></i>
			  <i class="bi bi-star-fill star_size  me-2"></i>
			  <i class="bi bi-star-fill star_size  me-2"></i>
            </div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">請輸入您的住宿體驗</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
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