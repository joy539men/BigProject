<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>PillowSurfing | 出租模式</title>
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
<title>Image Gallery</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

		// 改為直接頁面跳轉
		 function getRoomDetails(roomId) {
  			  window.location.href = 'getRoomDetailsAndBook/' + roomId;
		}

        
    </script>
</head>
<body>
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
									<img class="img-fluid rounded-circle mb-1" style="width: 50px" src="<c:url value = '${loginUser.filePath}'/>"
									alt="" />
									<%-- <c:url value = '${room.filePath}'/> --%>
							</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li class="dropdown-item"><img class="img-fluid rounded-circle"
										style="width: 50px" src="<c:url value = '${loginUser.filePath}'/>" alt="" />
										<h4>${loginUser.userName }</h4></li>
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
    
    
    
    <div class="row w-75  mx-auto mb-4"> 
      <div class="text-end">
       <div class="wrapper" >
       					 <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/苗栗.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/金門.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/雲林.png" style="max-width: 150px; height: 53px;"></button>
                        
       
                        <button type="button" class="item" onclick="getLocation('屏東')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/屏東.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" onclick="getLocation('澎湖')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/澎湖.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" onclick="getLocation('高雄')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/高雄.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" onclick="getLocation('台南')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/台南.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/花蓮.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/嘉義.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/基隆.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/宜蘭.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/台東.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/彰化.png" style="max-width: 150px; height: 53px;"></button>
                            
         <%--  <a class="btn btn btn-outline-primary " href="<c:url value = '/addRoomKrist'/>"> 新增房源</a> --%>
          <a class="btn btn-primary" href="<c:url value = ''/>"> 篩選條件</a>
         
      </div>
    </div>
    </div>

   


	<div id="houseList" class="w-75 mx-auto row">
		<c:forEach var="room" items="${roomList}">
			<div class="col-4">
				<div id="houseA" class="card  houseCard mx-auto mb-5">
					<img class="card-img-top" src="<c:url value = '${room.filePath}'/>"
						onclick="getRoomDetails(${room.roomId})" />
					<div class="card-body">
						<h5 class="card-title ">${room.title}</h5>
						<span class="card-text">${room.type}</span><br> 
						<span class="card-text">${room.guestMax}人入住</span>&nbsp;&nbsp;<span class="card-text">$ ${room.price}/晚</span>
					</div>
					
				</div>
			</div>
		</c:forEach>
	</div>


	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>
</body>
</html>

</html>
