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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" rel="stylesheet">

    <!-- # Main Style Sheet -->
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="<c:url value='/css/providerStyle.css' />"> 

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
                    <!-- account btn --> <a href="#!" class="btn btn-outline-primary">註 冊</a>
                    <!-- account btn --> <a href="#!" class="btn btn-primary ms-2 ms-lg-3">登 入</a>
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
                     <c:url var='register' value='/registerYC' />
                	 <form:form method="post" modelAttribute="register" action="${ register}" enctype="multipart/form-data">
                	  <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">會員註冊</h2>
                                <div class="mb-3">
                                    帳號
                                    <form:input type="text" class="form-control" id="account" path="account"/>		
    						 
                                </div>
                                <div class="mb-3">
                                    密碼
                                     <form:input type="password" class="form-control" id="password" path="password"/>
                                </div>
                                <div class="mb-3">
                                    姓名
                                    <form:input type="text" class="form-control" id="name" path="userName"/>
                                </div>
                                <div class="mb-3">
                                    電話
                                    <form:input type="tel" class="form-control" id="phone" path="phone"/>
                                </div>
                                <div class="mb-3">
                                    Email
                                    <form:input type="email" class="form-control" id="email" path="email"/>
                                </div>
                                <div class="mb-3">
                                    生日
                                    <form:input type="date" class="form-control" id="date" path="birthday"/>
                                </div>
<!--                                  <div class="mb-3"> -->
<!-- <!--                                     <label for="profilePicture" class="form-label">上傳大頭貼</label> --> 
<%--                                     <form:input path="multipartFile" type="file" class="form-control" id="profilePicture" /> --%>
<!--                                 </div> -->
                                
                                 <!-- test  -->
                                <label class="btn btn-info"><input id="upload_img" style="display:none;" type="file" accept="image/*"><i class="fa fa-photo"></i> 上傳圖片</label>

								<div id="oldImg" style="display:none;"></div>
								
<!-- 								<button id="crop_img" type="button" class="btn btn-info"><i class="fa fa-scissors"></i> 裁剪圖片</button> -->
								
<!-- 								<div id="newImgInfo"></div> -->
<!-- 								<div id="newImg"></div> -->
								                                
                                <!-- test end -->
                                
                                
                                
                                <div class="d-grid ">
                                    <button id="submitForm" type="submit" class="btn btn-primary" style="font-size: 20px;">註冊</button>
                                </div>
                       		</div>
                    	</div>
                     </form:form>
                </div>
            </div>
        </div>

    </section>

								
                                







    <!-- # JS Plugins -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/bootstrap/bootstrap.min.js"></script>
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/scrollmenu/scrollmenu.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>

    <!-- Main Script -->
    <script src="js/script.js"></script>
   	<script>
   	$(document).ready(function() {
   	    // Your existing variable definitions...
   	    var width_crop =200, // 圖片裁切寬度 px 值
			    height_crop = 200, // 圖片裁切高度 px 值
			    type_crop = "square", // 裁切形狀: square 為方形, circle 為圓形
			    width_preview = 350, // 預覽區塊寬度 px 值
			    height_preview = 350, // 預覽區塊高度 px 值
			    compress_ratio = 0.8, // 圖片壓縮比例 0~1
			    type_img = "jpeg", // 圖檔格式 jpeg png webp
			    color = "#ffffff",
			    oldImg = new Image(),
			    myCrop, file, oldImgDataUrl;

   	    // Your existing Croppie initialization...
   	    myCrop = $("#oldImg").croppie({
			    viewport: { // 裁切區塊
				    width: width_crop,
				    height: height_crop,
				    type: type_crop,
				    background: color
		    	},
		    	boundary: { // 預覽區塊
				    width: width_preview,
				    height: height_preview,
				    background: color
			    }
		    });

   	    // Modified readFile function
   	    function readFile(input) {
	    if (input.files && input.files[0]){
	        var file = input.files[0];
	
	        if (file.type.indexOf("image") == 0) {
	            var reader = new FileReader();
	            
	            reader.onload = function(e) {
	                oldImgDataUrl = e.target.result;
	                oldImg.src = oldImgDataUrl;
	
	                // Bind the image to Croppie for cropping
	                myCrop.croppie("bind", {
	                    url: oldImgDataUrl
	                }).then(function() {
	                    console.log('Image binding complete.');
	                    // Image is now ready for any further processing or actions
	                    // For instance, you can enable the submit button here if it was disabled
	                });
	            };
	
	            reader.readAsDataURL(file);
	        } else {
	            alert("您上傳的不是圖檔！");
	        }
	    } else {
	        alert("瀏覽器不支援此功能！建議使用最新版本 Chrome");
	    }
		}


   	    $("#upload_img").on("change", function() {
   	        $("#oldImg").show();
   	        readFile(this);
   	    });

		function dataURItoBlob(dataURI) {
		   // Convert data URI to Blob
		   var byteString = atob(dataURI.split(',')[1]);
		   var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
		   var ab = new ArrayBuffer(byteString.length);
		   var ia = new Uint8Array(ab);
		
		   for (var i = 0; i < byteString.length; i++) {
		      ia[i] = byteString.charCodeAt(i);
		   }
		
		   return new Blob([ab], { type: mimeString });
		}
   	    
   	    // Modify the submitForm click event handler
   	    $("#submitForm").on("click", function(event) {
   	        event.preventDefault();  // Prevent the default form submission
   	        myCrop.croppie("result", {
   	            type: "canvas",
   	            format: type_img,
   	            quality: compress_ratio
   	        }).then(function(src) {
   	            var formData = new FormData($("form")[0]);
   	            var blob = dataURItoBlob(src);
   	            formData.append("multipartFile", blob, "cropped_image.jpg");

   	            // Log formData entries for debugging
   	            for (var pair of formData.entries()) {
   	                console.log(pair[0] + ', ' + pair[1]);
   	            }

   	            // Perform the AJAX request
   	            $.ajax({
   	                url: "/pillowSurfing/registerYC",
   	                type: "POST",
   	                data: formData,
   	                processData: false,
   	                contentType: false,
   	                success: function(response) {
   	                    console.log("Response: ", response);
   	                    var jsonResponse = JSON.parse(response);
   	                    window.location.href = jsonResponse.redirectUrl;
   	                },
   	                error: function(jqXHR, textStatus, errorThrown) {
   	                    console.error("AJAX request failed: ", textStatus, errorThrown, jqXHR.responseText);
   	                }
   	            });
   	        });
   	    });
   	});

   	
   	
   	</script>
	<script>
//     $(document).ready(function(){
// 		    	var width_crop =200, // 圖片裁切寬度 px 值
// 			    height_crop = 200, // 圖片裁切高度 px 值
// 			    type_crop = "square", // 裁切形狀: square 為方形, circle 為圓形
// 			    width_preview = 350, // 預覽區塊寬度 px 值
// 			    height_preview = 350, // 預覽區塊高度 px 值
// 			    compress_ratio = 1, // 圖片壓縮比例 0~1
// 			    type_img = "jpeg", // 圖檔格式 jpeg png webp
// 			    color = "#ffffff",
// 			    oldImg = new Image(),
// 			    myCrop, file, oldImgDataUrl;
		
// 		    // 裁切初始參數設定
// 		    myCrop = $("#oldImg").croppie({
// 			    viewport: { // 裁切區塊
// 				    width: width_crop,
// 				    height: height_crop,
// 				    type: type_crop,
// 				    background: color
// 		    	},
// 		    	boundary: { // 預覽區塊
// 				    width: width_preview,
// 				    height: height_preview,
// 				    background: color
// 			    }
// 		    });
		
// 		function readFile(input) {
// 		    if (input.files && input.files[0]){
// 		    	file = input.files[0];
// 		    } else {
// 		    	alert("瀏覽器不支援此功能！建議使用最新版本 Chrome");
// 		    return;
// 		    }
		
// 		    if (file.type.indexOf("image") == 0) {
// 			    var reader = new FileReader();
			
// 				reader.onload = function(e) {
// 					oldImgDataUrl = e.target.result;
// 					oldImg.src = oldImgDataUrl; // 載入 oldImg 取得圖片資訊
// 					myCrop.croppie("bind", {
// 						url: oldImgDataUrl
// 			    	});
// 			    };
		
// 			    reader.readAsDataURL(file);
// 			  } else {
// 			  		alert("您上傳的不是圖檔！");
// 			  }
// 		}
		
// // 		function displayCropImg(src) {
// // 		    var html = "<img src='" + src + "' />";
// // 		    $("#newImg").html(html);
// // 		}
		
// 		$("#upload_img").on("change", function() {
// 		    $("#oldImg").show();
// 		    readFile(this);
// 		});
		

// 		function dataURItoBlob(dataURI) {
// 		   // Convert data URI to Blob
// 		   var byteString = atob(dataURI.split(',')[1]);
// 		   var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
// 		   var ab = new ArrayBuffer(byteString.length);
// 		   var ia = new Uint8Array(ab);
		
// 		   for (var i = 0; i < byteString.length; i++) {
// 		      ia[i] = byteString.charCodeAt(i);
// 		   }
		
// 		   return new Blob([ab], { type: mimeString });
// 		}
				
// 		$("#submitForm").on("click", function() {
// 		    myCrop.croppie("result", {
// 			    type: "canvas",
// 			    format: type_img,
// 			    quality: compress_ratio
// 		    }).then(function(src) {
// // 			    displayCropImg(src);
//  			    // Get other form data
// 			      var formData = new FormData($("form")[0]);
			      
// 			      // Append the cropped image as a Blob to the FormData object
// 			      var blob = dataURItoBlob(src);
// 			      formData.append("multipartFile", blob, "cropped_image.jpg");
			      
// 			      //
// 			      for (var pair of formData.entries()) {
// 					    console.log(pair[0]+ ', ' + pair[1]); 
// 					}

// 			      // Perform the AJAX request to submit the form data
// 			      $.ajax({
// 			         url: "/pillowSurfing/registerYC", // replace with your backend endpoint
// 			         type: "POST",
// 			         data: formData,
// 			         processData: false,
// 			         contentType: false,
// 			         success: function (response) {
// 			        	 console.log(response);
// 			        	 console.log("AJAX request successful");
// 			        	 var jsonResponse = JSON.parse(response);
// 			        	 window.location.href = jsonResponse.redirectUrl;
// // 			        	 window.location.href = "/pillowSurfing/";
			        	 
// 			         },
// 			         error: function(jqXHR, textStatus, errorThrown) {
// 			        	    console.error("AJAX request failed: ", textStatus, errorThrown);
// 			        }
// 			      });
// 		    });
// 		});
		        


//     });

    </script>
    
    
    

</body>

</html>