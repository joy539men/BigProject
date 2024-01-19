<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en-us">

<head>
	<meta charset="utf-8">
	<title>Pillow Surfing</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
	<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
	<link rel="icon" href="images/favicon.png" type="image/x-icon">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.css" rel="stylesheet">



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.js"></script> 
    <!-- # Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">

	<!-- # CSS Plugins -->
	<link rel="stylesheet" href="./slick.css">
	<link rel="stylesheet" href="./fontawesome.min.css">
	<link rel="stylesheet" href="./brands.css">
	<link rel="stylesheet" href="./solid.css">

	<!-- # Main Style Sheet -->
	<link rel="stylesheet" href="./style.css">
	<link rel="stylesheet" href="./mainPage.css">
    
	<style>
.container { 
    border: none; 
}
.card {
    border: none; 
}
.card-body { 
    padding: 0; 
}   
#room {
    width: 299px; height: 284px; 
}
.carousel-control-prev, .carousel-control-next, .carousel-indicators {
    display: none; 
}

.carousel:hover .carousel-control-prev,
.carousel:hover .carousel-control-next{
    display: block; top: 40%; 
}
.carousel:hover .carousel-indicators{
    display: flex; top: 90%; 
}
.card-text {
    white-space: pre-line; text-align: left;
}
.carousel-inner {
    scroll-behavior: smooth; 
}
.publicroom:hover{
    background-color: rgba(0, 0, 0, 0.39);
}
.a-line{
 border-left:  solid #0000007a;
 height:10%;
 top: 48%;
 left: 43%;
 position: absolute;
}
.b-line{
 border-left:  solid #0000007a;
 height:10%;
 top: 48%;
 left: 48%;
 position: absolute;
}
.c-line{
 border-left:  solid #0000007a;
 height:10%;
 top: 48%;
 left: 52.5%;
 position: absolute;
}



.btn-pill {
    border-radius: 50rem; /* Fully rounded corners for pill effect */
    margin-right: 5px; /* Spacing between buttons */
    margin-bottom: 5px; /* Spacing between rows of buttons */
  }

  /* Ensure the last button does not have margin-right */
  .pbtn-group .btn:last-child {
    margin-right: 0;
  }

  /* Align buttons to the left */
  .pbtn-group {
    display: flex;
    flex-wrap: wrap;
    padding: 30px;
  }
  .button-pillow {
  background-color: #52ddc6cb;
  color: white;
  padding: 10px 20px;
  border-radius: 5rem;
  border: 0px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  font-weight: bold;
  transition: all 0.3s ease;
  margin-right: 15px;
  margin-bottom: 5px;
}

.button-pillow:hover {
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
  transform: translateY(-2px);
}
.custom-modal {
    width: 780px;
    height: 635px;
    
  }
</style>

</head>

<body>

<!-- navigation -->
<header class="navigation  ">
	<nav class="navbar navbar-expand-md navbar-light text-center py-3 ">
		<div class="container ">
			<a class="navbar-brand" href="">
				<img  class="img-fluid"  src="images/logo.png" width="200px" height="100px"  >
			</a>

			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
			data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
			aria-expanded="false" aria-label="Toggle navigation"> 
			<span class="navbar-toggler-icon"></span>
			</button>

			<div class=" navbar-collapse  " id="navbarSupportedContent " >
				<ul class=" border rounded-pill mx-auto  " 
                    style=" width: 500px; height: 65px;margin-top: 20px;">
                    <button class="btn "
                        style="margin-top: 14px;" 
                        type="button"><p>任何地方</p>
                    </button>
                    <div class="a-line">
                    </div>
                    <button class="btn " 
                        style="margin-top: 14px;" 
                        type="button" ><p>任何地點</p>
                    </button>
                    <div class="b-line">
                    </div>
                    <button class="btn " 
                        style="margin-top: 14px;" 
                        type="button" ><p>新增人數</p>
                    </button>
                    <div class="c-line">
                    </div>
                    <button class="btn " 
                        style="margin-bottom: 3px;
                               margin-left: 70px;
                               background-color: aquamarine;" 
                        type="button" >
                        <img src="images/search.png" width="20px" height="20px">
                    </button>

                   

				</ul>
				<div class="custom-div">
					<a href="#!" class="btn publicroom p-2  rounded-pill" style="font-size: 16px;"><b>發佈房源</b></a>
					<a href="#!" class="btn ms-2 ms-lg-3"><img src="images/earth.png" width="25px" height="25px"></a>
					<div>
						<li class="dropdown">
						  <a
							class="p-3 border rounded-pill"
							href="#"
							id="navbarDropdown"
							role="button"
							data-bs-toggle="dropdown"
							aria-expanded="false"
							><i class="bi w-50 bi-list pe-4" style="font-size: 20px"></i
							><img style="width: 30px" src="images/earth.png" alt=""
						  /></a>
						  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li class="dropdown-item">
							  <img
								class="img-fluid"
								style="width: 50px"
								src="images/logo.png"
								alt=""
							  />
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
							  <a class="dropdown-item" href="service-details.html"
								>行程規劃</a
							  >
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
			
		</div>
	</nav>
</header>


<div style="height: 70px; ">
    <div class="row " style="justify-content: space-evenly;">
        
		<div class="col-9" style="height: 70px; margin-left: -16px;">
			<div class="scroll-buttons">
				<button class="btn " onclick="scrollaaa()"><img src="images/leftClick.png" width="50px" height="50px"></button>
				<div class="wrapper icon" >
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/南投.png" style="max-width: 150px; height: 50px;"></button>
                    <button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/台中.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/台北.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/台南.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/台東.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/嘉義.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/基隆.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/宜蘭.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/屏東.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/彰化.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/新北.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/新竹.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/桃園.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/澎湖.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/花蓮.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/連江.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/苗栗.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/金門.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/雲林.png" style="max-width: 150px; height: 50px;"></button>
					<button type="button" class="item" 
                        style="border: 0px; background-color: white;">
                        <img src="images/locationIcon/高雄.png" style="max-width: 150px; height: 50px;"></button>
					

				</div>
				<button class="btn " onclick="scrollRight()"><img src="images/rightClick.png" width="50px" height="50px"></button>
			</div>
		</div>
		
        <button type="button" class="btn col-2" data-toggle="modal" data-target="#priceRangeModal" 
                style="height: 100px;width: 200px; margin-left: -62px; margin-top: -23px;">
            <img src="images/locationIcon/篩選條件.png">
          </button>
            
            <div class="modal" id="priceRangeModal" >
                <div class="modal-dialog modal-lg" >
                  <div class="modal-content custom-modal"   style=" margin-left: -101px">
              
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">Price Range Filter</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
              
                    <!-- Modal Body -->
                    <div class="modal-body">
                      <div id="priceRangeSlider"></div>
                      <p>
                        Price range: <span id="priceRangeMin">$500</span> - <span id="priceRangeMax">$20000</span>
                      </p>
                      <div class="container">
                        <div class="row mb-2">
                            <div class="col">
                            <h5>房間</h5>
                            <div class="pbtn-group" role="group" aria-label="Bedrooms">
                                <button type="button" class="button-pillow" data-group="bedroom">任何</button>
                                <button type="button" class="button-pillow" data-group="bedroom">1</button>
                                <button type="button" class="button-pillow" data-group="bedroom">2</button>
                                <button type="button" class="button-pillow" data-group="bedroom">3</button>
                                <button type="button" class="button-pillow" data-group="bedroom">4</button>
                                <button type="button" class="button-pillow" data-group="bedroom">5</button>
                                <button type="button" class="button-pillow" data-group="bedroom">6</button>
                                <button type="button" class="button-pillow" data-group="bedroom">7</button>
                                <button type="button" class="button-pillow" data-group="bedroom">8+</button>
                            </div>
                        </div>
                    </div>
                  
                    
                        <div class="row mb-2">
                            <div class="col">
                            <h5>床位</h5>
                            <div class="pbtn-group" role="group" aria-label="Living Rooms">
                                <button type="button" class="button-pillow" data-group="living-room">任何</button>
                                <button type="button" class="button-pillow" data-group="living-room">1</button>
                                <button type="button" class="button-pillow" data-group="living-room">2</button>
                                <button type="button" class="button-pillow" data-group="living-room">3</button>
                                <button type="button" class="button-pillow" data-group="living-room">4</button>
                                <button type="button" class="button-pillow" data-group="living-room">5</button>
                                <button type="button" class="button-pillow" data-group="living-room">6</button>
                                <button type="button" class="button-pillow" data-group="living-room">7</button>
                                <button type="button" class="button-pillow" data-group="living-room">8+</button>
                            </div>
                            </div>
                        </div>
                  
                  
                        <div class="row">
                            <div class="col">
                            <h5>衛浴</h5>
                            <div class="pbtn-group" role="group" aria-label="Bathrooms">
                                <button type="button" class="button-pillow" data-group="bathroom">任何</button>
                                <button type="button" class="button-pillow" data-group="bathroom">1</button>
                                <button type="button" class="button-pillow" data-group="bathroom">2</button>
                                <button type="button" class="button-pillow" data-group="bathroom">3</button>
                                <button type="button" class="button-pillow" data-group="bathroom">4</button>
                                <button type="button" class="button-pillow" data-group="bathroom">5</button>
                                <button type="button" class="button-pillow" data-group="bathroom">6</button>
                                <button type="button" class="button-pillow" data-group="bathroom">7</button>
                                <button type="button" class="button-pillow" data-group="bathroom">8+</button>
                            </div>
                            </div>
                        </div>
                      <!-- Modal footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary close-modal" data-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary close-modal">Save Changes</button>
                      </div>
                    </div>

                   
              
                  </div>
                </div>
              </div>
        </div>

    </div>
</div>

<div class=" row d-flex justify-content-evenly " >
    <div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>

</div>
<div class=" row d-flex justify-content-evenly " >
    <div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>

</div>
<div class=" row d-flex justify-content-evenly " >
    <div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>

</div>
<div class=" row d-flex justify-content-evenly " >
    <div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>
	<div class="col-12 col-xl-3 " >
		<div class="container" 
        style="height: 384px;width: 340px; ">
        <div class="card">
            <div id="carouselExampleIndicators" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./裁切房間/一般房二.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很美一般.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/很簡單.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                    <div class="carousel-item">
                        <img src="./裁切房間/上下舖.jpg" class="d-block" id="room" style="border-radius: 20px;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
                <b class="card-text">
                    資展大旅店 
                    於兩週前發布 
                    $19,999 TWD 每晚
                </b>
            </div>
        </div>
    	</div>

	</div>

</div>



<script>
var priceRangeSlider =
    document.getElementById('priceRangeSlider');
        noUiSlider.create(priceRangeSlider, {
            start: [500, 20000],
                connect: true,
                range: {
                'min': 500,
                'max': 20000
                },
            format: {
                to: function (value) {
                return value.toFixed(0);
                },
                from: function (value) {
                return Number(value);
                }
            }
});

// Update the input text
priceRangeSlider.noUiSlider.on('update', function (values, handle) {
var value = values[handle];


if (handle) { // handle 1
    $('#priceRangeMax').text('$' + value);
} else { // handle 0
    $('#priceRangeMin').text('$' + value);
}
});


// JavaScript代碼來實現選取框框的提示
$('.button-pillow').on('click', function() {
  var group = $(this).data('group'); // 獲取按鈕所屬的組名
  $('.button-pillow[data-group="' + group + '"]').removeClass('active'); // 清除同組其他按鈕的選取狀態
  $(this).addClass('active'); // 添加選取狀態到點擊的按鈕
});






	function scrollaaa() {
    var wrapper = document.querySelector('.wrapper');
    wrapper.scrollBy({ left: -200, behavior: 'smooth' });
}
function scrollRight() {
    var wrapper = document.querySelector('.wrapper');
    wrapper.scrollBy({ left: 300, behavior: 'smooth' });
}

$(document).ready(function() {
    // 防止點擊 modal 內的按鈕時關閉 modal
    $('#priceRangeModal').on('click', function(e) {
        if ($(e.target).hasClass('btn') && !$(e.target).hasClass('close-modal')) {
            e.stopPropagation(); // 阻止事件冒泡到 modal
        }
    });

    // 添加 close-modal 類別到 Close 和 Save Changes 按鈕
    // 當這些按鈕被點擊時，關閉 modal
    $('.close-modal').on('click', function() {
        $('#priceRangeModal').modal('hide');
    });
});

</script>
</body>
</html>