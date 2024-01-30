<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>PillowSurfing | 出租模式</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
  <meta name="description" content="This is meta description">
  <meta name="author" content="Themefisher">
  <link rel="shortcut icon" href="./images/logo.ico" type="image/x-icon">
  <link rel="icon" href="./images/logo.ico" type="image/x-icon">

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

  <!-- navigation -->
  <header class="navigation bg-tertiary">
    <nav class="navbar navbar-expand-xl navbar-light text-center py-3">
      <div class="container">
        <a class="navbar-brand" href="index.html">
          <img loading="prelaod" decoding="async" class="img-fluid" width="60px" src="./images/logo.png"
            alt="CouchSurfing">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span
            class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            <li class="nav-item"> <a class="nav-link" href="<c:url value='/hostOrders' />">訂單管理</a>
            </li>
            <li class="nav-item "> <a class="nav-link" href="./calendar.html">日曆</a>
            </li>
            <li class="nav-item "> <a class="nav-link" href="<c:url value='/hostRooms' />">房源管理</a>
            </li>
            <li class="nav-item "> <a class="nav-link" href="#">收件匣</a>
            </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                role="button" data-bs-toggle="dropdown" aria-expanded="false">選單</a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item " href="#">預訂</a>
                </li>
                <li><a class="dropdown-item " href="#">收入分析</a>
                </li>
                <li><a class="dropdown-item " href="<c:url value='/addRoom' />">建立新房源</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="nav-item dropdown">
          <a><img src="./images/cat.png" width="60px"></a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item " href="#">個人資料</a>
            </li>
            <li><a class="dropdown-item " href="#">帳號</a>
            </li>
            <li><a class="dropdown-item " href="#">切換至旅行模式</a>
            </li>
            <li><a class="dropdown-item " href="#">登出</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <!-- /end of navigation -->

  <div>
    <div class="row w-75  mx-auto mb-4"> 
      <div class="text-end">
          <a class="btn btn-primary me-5" href="<c:url value = '/addRoom'/>"> 新增房源</a>
          
      </div>
    </div>
  
    <div id="houseList" class="w-75 mx-auto row">
    
    	<c:forEach var="room" items="${rooms}">
	    	<div class="col-4">
          		<div id="houseA" class="card  houseCard mx-auto mb-4">
          			<img class="card-img-top cardTopRoom" src="<c:url value = '${room.filePath}'/>">
            		<div class="card-body">
	              		<h5 class="card-title ">${room.title}</h5>
	              		<span class="card-text">${room.type}</span><br>
	              		<span class="card-text">${room.guestMax}人入住</span>
	              		<a href="<c:url value = '/hostRoomDetail/${room.roomId}'/>" class="stretched-link"></a>
            		</div>  
          		</div>
        	</div>
	    </c:forEach>
        
  
        
  
        
          
    </div>

  </div>
 

  

  


  <!-- # JS Plugins -->
  <script src="plugins/jquery/jquery.min.js"></script>
  <script src="plugins/bootstrap/bootstrap.min.js"></script>
  <script src="plugins/slick/slick.min.js"></script>
  <script src="plugins/scrollmenu/scrollmenu.min.js"></script>

  <!-- Main Script -->
  <script>
    
    $(document).ready(function(){
      
      


    });

  </script>

</body>

</html>