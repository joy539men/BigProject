<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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

  <!-- theme meta -->
  <meta name="theme-name" content="wallet" />

  <!-- # Google Fonts -->
  <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet"> -->

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
        <a class="navbar-brand" href="<c:url value='/login'/>">
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
            <li class="nav-item "> <a class="nav-link" href="#">日曆</a>
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
          <a><img src="<c:url value='${ userImg}' />" width="60px" class="rounded-circle"></a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item " href="<c:url value='/userProfile'/>">個人資料</a>
            </li>
            <li><a class="dropdown-item " href="#">帳號</a>
            </li>
            <c:if test="${sessionScope.isAdmin}">
              <li><a class="dropdown-item " href="<c:url value='/admin/account' />">後台管理頁面</a>
              </li>
            </c:if>
            <li><a class="dropdown-item " href="<c:url value='/login'/>">切換至旅行模式</a>
            </li>
            <li><a class="dropdown-item " href="<c:url value='/logout'/>">登出</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <!-- /end of navigation -->
		
  <section class="w-75 mx-auto">
    <div id="statusFilter" class="w-75 mx-auto mt-5">
      <a href="<c:url value='/hostOrders' />">
        <span id="unacceptedOrder" class="selectBtn">待確認</span>
      </a>|
      <a href="<c:url value='/hostOrdersAccept' />">    
        <span id="acceptedOrder" class="unselectBtn">已成立</span>
      </a>
    </div>
    <div id="orderList" class="">
<!--       <div id="orderA" class="card w-75 mx-auto my-5 " style="height: 150px;"> -->
<!--         <div id="orderDate" class="ms-3 mt-3"><span>Dec 19, 2023</span></div> -->
<!--         <div id="orderDetail" class="row mx-3 align-items-center h-100"> -->
<!--           <div id="detail" class="col-6 align-content-center flex-wrap"> -->
<!--             <div id="houseName" class="houseName">獨棟小屋 台中市大業里</div> -->
<!--             <div id="housedetail" class="pt-1"> -->
<!--               <span id="guest" >2位入住,</span> -->
<!--               <span id="housedetail2">Dec 19, 2023 - Dec 21, 2023</span> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div id="price" class="col-3 text-start orderPrice">$ 3,900 TWD</div> -->
<!--           <div id="acceptBtn" class="col-3 text-center"> -->
<!--             <a class="btn btn-primary btn-sm me-2">接受</a> -->
<!--             <a class="btn btn-primary btn-sm">拒絕</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> end of orderA -->
	<c:if test="${not empty bookings}">
		<c:forEach var="booking" items="${bookings}">
		     <div id="orderA" class="card w-75 mx-auto my-5 " style="height: 150px;">
		        <div id="orderDate" class="ms-3 mt-3"><span>${booking.bookingTime}</span></div>
		        <div id="orderDetail" class="row mx-3 align-items-center h-100">
		          <div id="detail" class="col-6 align-content-center flex-wrap">
		            <div id="houseName" class="houseName">${booking.roomTable.title}</div>
		            <div id="housedetail" class="pt-1">
		              <span id="guest" >${booking.guest}位入住,</span>
		              <span id="housedetail2">${booking.checkinDate}  - ${booking.checkoutDate}</span>
		            </div>
		          </div>
		          <div id="price" class="col-3 text-start orderPrice">$ ${booking.totalPrice} TWD</div>
		          <div id="statusBtn" class="col-3 text-center">
		          	<div style="display:inline-block">
		          		<form action="<c:url value='/acceptBooking' />" method="post">
		        			<input type="hidden" name="bookingId" value="${booking.bookingId}">
		       				<button type="submit" class="btn btn-primary btn-sm me-2">接受</button>
	   		 			</form>
		          	</div>
		          	<div style="display:inline-block">
		          		<form action="<c:url value='/rejectBooking' />" method="post">
			        		<input type="hidden" name="bookingId" value="${booking.bookingId}">
			       			 <button type="submit" class="btn btn-primary btn-sm me-2">拒絕</button>
	   		 			</form>
		          	</div>
		          </div><!-- end of statusBtn -->
		        </div>
		      </div> <!-- end of orderA --> 
		</c:forEach>
	</c:if>
	
	<c:if test="${empty bookings}">
	    <div class="my-5 mx-auto w-75 text-center">
	    	<img src="<c:url value='/images/index_start.png'/>" style="height:100px">
	        <p>目前沒有需確認的訂單</p>
	    </div>
	</c:if>
	

      
    </div>
<!--     <div id="changePage" class="text-center">   -->
<!--       <a><span>&#060;</span></a>   <  -->
<!--       <a><span>&#062;</span></a>   >  -->
<!--     </div> -->

  </section>

  


  <!-- # JS Plugins -->
  <script src="plugins/jquery/jquery.min.js"></script>
  <script src="plugins/bootstrap/bootstrap.min.js"></script>
  <script src="plugins/slick/slick.min.js"></script>
  <script src="plugins/scrollmenu/scrollmenu.min.js"></script>

  <!-- Main Script -->
  <script src="js/script.js"></script>
  <script>
    
    $(document).ready(function(){
      
//     	var pathValue = "${requestPath}";
// //     	console.log(pathValue);
    	
//     	if (pathValue.includes("Accept")) {
//     		$("#acceptedOrder").removeClass("unselectBtn").addClass("selectBtn");
//     		$("#unacceptedOrder").removeClass("selectBtn").addClass("unselectBtn");
//     	  } else {
//     		$("#acceptedOrder").removeClass("selectBtn").addClass("unselectBtn");
//       		$("#unacceptedOrder").removeClass("unselectBtn").addClass("selectBtn");
//     	  }
     


    });

  </script>

</body>

</html>