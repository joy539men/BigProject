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
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
    <meta name="description" content="This is meta description">
    <meta name="author" content="Themefisher">
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <link rel="icon" href="images/favicon.png" type="image/x-icon">

    <!-- theme meta -->
    <meta name="theme-name" content="Register " />

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


</head>

<body>

    <!-- navigation -->
    <header class="navigation bg-tertiary">
        <nav class="navbar navbar-expand-xl navbar-light text-center py-3">
            <div class="container">
                <a class="navbar-brand" href="index.html">
                    <img loading="prelaod" decoding="async" class="img-fluid" width="120" src="images/logo.png"
                        alt="CouchSurfing">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item"> <a class="nav-link" href="index.html">首頁</a>
                        </li>
                        <li class="nav-item "> <a class="nav-link" href="about.html">關於</a>
                        </li>
                        <li class="nav-item "> <a class="nav-link" href="services.html">服務</a>
                        </li>
                        <li class="nav-item "> <a class="nav-link" href="contact.html">聯絡我們</a>
                        </li>
                        <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">頁面</a>
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
                    <!-- account btn --> <a href="<c:url value="/intoRegister"></c:url>" class="btn btn-outline-primary">註 冊</a>
                    <!-- account btn --> <a href="<c:url value="login"></c:url>" class="btn btn-primary ms-2 ms-lg-3">登 入</a>
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
                        <img loading="lazy" decoding="async" src="images/index_start.png" alt="banner image"
                            class="w-100">
                    </div>
                </div>
                <div class="col-lg-4">
                    <!-- Registration Form -->
					<c:url var='register' value='/register' />
                	 <form:form method="post" modelAttribute="register" action="${ register}" onsubmit="return validateForm()">
                	  <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">會員註冊</h2>
                                <div class="mb-3">
                                    姓名
                                    <form:input type="text" class="form-control" id="name" path="userName"/>
                                    <div id="nameError" class="text-danger"></div>
                                </div>
                                <div class="mb-3">
                                    帳號
                                    <form:input type="text" class="form-control" id="account" path="account"/>
                                    <div id="accountError" class="text-danger"></div> 
                                </div>
                                <div class="mb-3">
                                    密碼
                                     <form:input type="password" class="form-control" id="password" path="password"/>
                                     <div id="passwordError" class="text-danger"></div> 
                                </div>
                                <div class="mb-3">
                                    確認密碼
                                     <input type="password" class="form-control" id="password1" />
                                </div>
                                <div class="mb-3">
                                    電話
                                    <form:input type="tel" class="form-control" id="phone" path="phone"/>
                                    <div id="phoneError" class="text-danger"></div> 
                                </div>
                                <div class="mb-3">
                                    Email
                                    <form:input type="email" class="form-control" id="email" path="email"/>
                                    <div id="emailError" class="text-danger"></div>
                                </div>
								<div class="mb-3">
                                    生日
                                    <form:input type="date" class="form-control" id="date" path="birthday"/>
                                </div>
                            	<div class="mb-3">
                                    <label for="profilePicture" class="form-label">上傳大頭貼</label>
                                    <form:input type="file" class="form-control" id="profilePicture" path="multipartFile"/>
                                </div> 
                                <div class="d-grid ">
                                    <button type="submit" class="btn btn-primary" style="font-size: 20px;">註冊</button>
                                </div>
                       		</div>
                    	</div>
                     </form:form>
                </div>
            </div>
        </div>

    </section>
    
    <script src="plugins/bootstrap/bootstrap.min.js"></script>
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/scrollmenu/scrollmenu.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Main Script -->
    <script src="js/script.js"></script>

	<script>
	// 驗證姓名
		function validateName() {
			var name = document.getElementById("name").value;
			var nameError = document.getElementById("nameError");

			if (name.trim() === '') {
				nameError.textContent = "姓名不能為空。";
				return false;
			} else {
				nameError.textContent = ''; // 清除錯誤信息
			}
			return true;
		}	
	// 驗證帳號
		function validateAccount() {
			var account = document.getElementById("account").value;
			var accountPattern = /^[A-Za-z0-9_]{6,12}$/;
			var accountError = document.getElementById("accountError");

			if (!accountPattern.test(account)) {
				accountError.textContent = "帳號格式錯誤：6-12位，包含小寫字母、數字和_";
				return false;
			} else {
				accountError.textContent = ''; // 清除錯誤信息
			}
			return true;
		}
	// 驗證密碼
		function validatePassword() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("password1").value;
			var passwordError = document.getElementById("passwordError");
			var passwordPattern = /^[A-Za-z0-9]{6,20}$/; // 正則表達式，表示6到20個字元，包括字母和數字

			if (password !== confirmPassword) {
				passwordError.textContent = "密碼和確認密碼不匹配！";
				return false;
			}
			if (!passwordPattern.test(password)) {
				passwordError.textContent = "密碼需由6-20個字元組成，字母不區分大小寫。";
				return false;
			}
			passwordError.textContent = ''; // 清除錯誤信息
			return true;
		}
	// 驗證電話
		function validatePhone() {
			var phone = document.getElementById("phone").value;
			var phonePattern = /^[0-9]{10}$/;
			var phoneError = document.getElementById("phoneError");

			if (!phonePattern.test(phone)) {
				phoneError.textContent = "電話號碼格式不正確！";
				return false;
			} else {
				phoneError.textContent = ''; // 清除錯誤信息
			}
			return true;
		}
	// 驗證信箱
		function validateEmail() {
			var email = document.getElementById("email").value;
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
			var emailError = document.getElementById("emailError");

			if (!emailPattern.test(email)) {
				emailError.textContent = "電子郵件格式不正確！";
				return false;
			} else {
				emailError.textContent = ''; // 清除錯誤信息
			}
			return true;
		}

		function validateForm() {
			return validateAccount() && validatePassword() && validatePhone()
					&& validateEmail();
		}
	</script>

	<script>

		function checkPhone() {
			var phone = document.getElementById("phone").value;
			var phonePattern = /^[0-9]{10}$/; // 或其他您需要的正則表達式
			var phoneError = document.getElementById("phoneError");

			if (!phonePattern.test(phone)) {
				phoneError.textContent = "電話號碼格式不正確！";
				return false;
			} else {
				// AJAX 請求檢查重複
				$.ajax({
					url : '/pillowSurfing/check-phone', // 確保這個 URL 是正確的
					method : 'GET',
					data : {
						phone : phone
					},
					success : function(response) {
						if (response.exists) {
							phoneError.textContent = "電話號碼已被使用！";
						} else {
							phoneError.textContent = '';
						}
					}
				});
			}
		}

		// 將這些函數綁定到相應的輸入框事件
		$(document).ready(function() {
			$('#phone').blur(checkPhone);
		});
	</script>
	
	<script>
	$(document).ready(function() {
	    var emailError = document.getElementById("emailError");
	    $('#email').blur(function() {
	        var email = $(this).val();
	        if (email) {
	            $.ajax({
	                url: '/pillowSurfing/check-email',
	                method: 'GET',
	                data: { email: email },
	                success: function(response) {
	                    if (response.exists) {
	                        emailError.textContent = "電子郵件已被使用！";
	                    } else {
	                        emailError.textContent = ""; // 清除錯誤信息
	                    }
	                },
	                error: function() {
	                    emailError.textContent = "無法檢查電子郵件！";
	                }
	            });
	        }
	    });
	});

	</script>

</body>

</html>