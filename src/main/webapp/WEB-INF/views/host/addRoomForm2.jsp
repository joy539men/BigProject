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

  <!-- # CSS Plugins -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css">
  <link rel="stylesheet" href="plugins/font-awesome/brands.css">
  <link rel="stylesheet" href="plugins/font-awesome/solid.css">

  <!-- # Main Style Sheet -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="./css/providerStyle.css">
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoCS3e-5nUFhkFZq0gUiywb6OyAHb7GSs&libraries=places"></script>
  
</head>

<body>

  <!-- navigation -->
  <header class="navigation bg-tertiary">
    <nav class="navbar navbar-expand-xl navbar-light text-center py-3">
      <div class="container">
        <a class="navbar-brand" href="index.html">
          <img  class="img-fluid" width="60px" src="./images/logo.png" alt="CouchSurfing">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span
            class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            <li class="nav-item"> <a class="nav-link" href="#">訂單管理</a>
            </li>
            <li class="nav-item "> <a class="nav-link" href="./calendar.html">日曆</a>
            </li>
            <li class="nav-item "> <a class="nav-link" href="#">房源管理</a>
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
                <li><a class="dropdown-item " href="#">建立新房源</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="nav-item dropdown">
<!--           <a><img src="./images/cat.png" width="60px"></a> -->
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
<c:url var='saveAction' value='/addRoom' />
		<form:form method='POST' modelAttribute="roomTableBean" 
		        action="${saveAction}" enctype="multipart/form-data" id="myForm">
			<c:if test='${roomTableBean.roomId != null}'>
                 <form:hidden path="roomId" /><br>&nbsp;
			</c:if>
  <div id="houseTypeSection" class="w-75 mx-auto mt-5">
    <div id="TypeTitle" class="w-75 mx-auto my-3">
      <h2>房客入住的房源類型?</h2>
    </div>
    <div id="typeRadio" class="invisible-checkboxes mt-3 w-75 mx-auto">
        <label class="housetypeRadio mx-auto">
          <form:radiobutton  path="type"  value="整套房源" checked="checked"/>
          <div>整套房源</div>
        </label>
        <label class="housetypeRadio mx-auto">
          <form:radiobutton  path="type"  value="獨立房間" />
          <div>獨立房間</div>
        </label>
        <label class="housetypeRadio mx-auto">
          <form:radiobutton  path="type"  value="合住房間" />
          <div>合住房間</div>
        </label>
    </div>
    <div class="w-75 mx-auto text-center ">
      <a class="btn btn-primary btn-sm" href="#locationSection">下一步</a>
    </div>
    
  </div>

  <br><br><br><br><br><br><br>
  <div id="locationSection" class="w-75 mx-auto mt-5 vh-100">
    <div id="locationTitle" class="w-75 mx-auto my-3">
      <h2>房源的位置在哪邊?</h2>
    </div>
    <div style="height: 500px; width: 500px; border: 1px solid black;" class="mx-auto">
   		<form:input path="address" class=" w-100" id="address" name="address" type="text" style="height: 50px;" placeholder="請輸入地址" />
   		<div id="map" style="height: 400px; width: 100%;"></div>
    </div>
    <div class="w-75 mx-auto text-center ">
      <a class="btn btn-primary btn-sm" href="#houseInfo">下一步</a>
    </div>
  </div>

<!--   <br><br><br><br><br><br><br> -->
  <div id="houseInfo" class="w-75 mx-auto mt-5 vh-100">
    <div id="houseInfoTitle" class="w-75 mx-auto my-3">
      <h2>填寫房源基本資訊</h2>
    </div>
    <div class="mt-3 w-75 mx-auto">
      <div id="guestNumDiv" class="row houseInfo mx-auto">
        <div class="col-8 verticalCenter">房客人數</div>
        <div class="col-4 verticalCenter"><form:input path="guestMax" type="number" name="guestNum" value="0" min="0" style="width:100px" class="mx-auto" /></div>
      </div>
      <div id="roomNumDiv" class="row houseInfo mx-auto">
        <div class="col-8 verticalCenter">房間</div>
        <div class="col-4 verticalCenter"><form:input path="roomNum" type="number" name="roomNum" value="0" min="0" style="width:100px" class="mx-auto"/></div>
      </div>
      <div id="bedNumDiv" class="row houseInfo mx-auto">
        <div class="col-8 verticalCenter">床位</div>
        <div class="col-4 verticalCenter"><form:input path="bedNum" type="number" name="bedNum" value="0" min="0" style="width:100px" class="mx-auto"/></div>
      </div>
      <div id="bathroomNumDiv" class="row houseInfo mx-auto">
        <div class="col-8 verticalCenter">衛浴</div>
        <div class="col-4 verticalCenter"><form:input path="bathroom" type="number" name="bathroomNum" value="0" min="0" style="width:100px" class="mx-auto"/></div>
      </div>
    </div>
    <div class="w-75 mx-auto text-center ">
      <a class="btn btn-primary btn-sm" href="#facilitySection">下一步</a>
    </div>
  </div>

<!--   <br><br><br><br><br><br><br> -->
  <div id="facilitySection" class="w-75 mx-auto mt-5">
	    <div id="facilityTitle" class="w-75 mx-auto my-3">
	      <h2>填寫房源提供那些設備?</h2>
	    </div>
	    <div class="w-75 mx-auto row">
	    	<c:forEach var="amenity" items="${amenities}">
	        		<div class="col-4 text-center">
	        		<label for="amenity-${amenity.amenityId}" class="amenityCheckbox">
	        			<input type="checkbox" id="amenity-${amenity.amenityId}" name="amenityIds" value="${amenity.amenityId}" >
	        			<div>${amenity.amenityName}</div>
	        		</label>
	        		</div>
	    	</c:forEach>
	    
<%-- 	    	<c:forEach var="amenity" items="${amenities}"> --%>
<%-- 	        		<input type="checkbox" id="amenity-${amenity.amenityId}" name="amenityIds" value="${amenity.amenityId}" > --%>
<%-- 	        		<label for="amenity-${amenity.amenityId}">${amenity.amenityName}</label> --%>
<%-- 	    	</c:forEach> --%>
				
	    </div>
	    <div class="w-75 mx-auto text-center ">
	      <a class="btn btn-primary btn-sm" href="#safetySection">下一步</a>
	    </div>
  </div>

<!--   <br><br><br><br><br><br><br> -->
<!--   <div id="safetySection" class="w-75 mx-auto mt-5"> -->
<!--     <div id="safetyTitle" class="w-75 mx-auto my-3"> -->
<!--       <h2>填寫房源提供的安全及隱私措施</h2> -->
<!--     </div> -->
    


<!--     <div class="w-75 mx-auto text-center "> -->
<!--       <a class="btn btn-primary btn-sm" href="#photoSection">下一步</a> -->
<!--     </div> -->
<!--   </div> -->



<!--   <br><br><br><br><br><br><br> -->
  <div id="photoSection" class="w-75 mx-auto mt-5">
    <div id="photoTitle" class="w-75 mx-auto my-3">
      <h2>為你的房源新增照片</h2>
    </div>
    <div class="mt-3 w-75 mx-auto">
        <div style="height: 500px; width: 500px;" class="mx-auto test">
          
			<form:input path="multipartFile" type='file'/>
        </div>
    </div>
    <div class="w-75 mx-auto text-center ">
      <a class="btn btn-primary btn-sm" href="#introSection">下一步</a>
    </div>
  </div>

<!--   <br><br><br><br><br><br><br> -->
  <div id="introSection" class="w-75 mx-auto mt-5 vh-100">
	    <div id="introTitle" class="w-75 mx-auto my-3">
	      	<h2>向我們介紹你的房源吧</h2>
	    </div>
	    <div class="mt-3 w-75 mx-auto">
		     <h3 class="ms-5">為你的房源命名</h3>
		     <div class="w-75 mx-auto text-center " ><form:input path="title" class="ms-5 w-100" type="text" style="height: 80px;" /></div>
	    </div>
	    <div class="mt-3 w-75 mx-auto">
		     <h3 class="ms-5">描述你的房源有哪些特點</h3>
		     <div class="w-75 mx-auto text-center " ><form:input path="description" class="ms-5 w-100" type="text" style="height: 400px;" /></div>
	    </div>
	    <div class="w-75 mx-auto text-center ">
	      <a class="btn btn-primary btn-sm" href="#priceSection">下一步</a>
	    </div>
  </div>

<!--   <br><br><br><br><br><br><br> -->
  <div id="priceSection" class="w-75 mx-auto mt-5 vh-100">
    <div id="introTitle" class="w-75 mx-auto my-3">
     	<h2>現在，讓我們來設定價格吧</h2>
    </div>
    <div class="mt-3 w-75 mx-auto">
      <div class="w-75 mx-auto text-center " >
        $<form:input path="price" class="ms-5 w-25" id="price" type="text" style="height: 50px;" placeholder="輸入你的理想定價" />
        
        <div class="w-50 mx-auto mt-3 test" style="height: 300px; border-radius: 5px;">
            <div class="row mt-3" id="housePrice">
              <div class="col-8">房間定價</div>
              <div class="col-4" id="priceNum"></div>
            </div>
            <div class="row mt-3" id="serviceFee">
              <div class="col-8">房客服務費</div>
              <div class="col-4" id="serviceFeeNum"></div>   <!-- 定價14% -->
            </div>
            <hr>
            <div class="row mt-3" id="guestPrice">
              <div class="col-8">房客支付的價格</div>
              <div class="col-4" id="guestPriceNum"></div>  <!-- 服務費+  定價 -->
            </div>
        </div>
        <div class="w-50 mx-auto mt-3 test" style="height: 100px; border-radius: 5px;">
          <div class="row mt-3" id="housePrice">
            <div class="col-8">你的收入</div>
            <div class="col-4" id="hostIncome"></div>  <!-- 定價97% -->
          </div>
        </div>
      </div>
    </div>
    </div>
    


    <div class="w-75 mx-auto text-center mt-3">
<!--       <a class="btn btn-primary btn-sm" href="#">送出</a> -->
      <input type='submit' value='提交' class="btn btn-primary btn-sm">
    </div>
  
  </form:form>

  


  <!-- # JS Plugins -->
  <script src="plugins/jquery/jquery.min.js"></script>
  <script src="plugins/bootstrap/bootstrap.min.js"></script>
  <script src="plugins/slick/slick.min.js"></script>
  <script src="plugins/scrollmenu/scrollmenu.min.js"></script>

  <!-- Main Script -->
  <script src="js/script.js"></script>
  <script src="js/addRoomMap.js"></script>
  <script>
    
    $(document).ready(function(){
      
    	$("#price").change(function(){
    		var price = parseInt( $("#price").val() );
    		var serviceFee = parseInt(price*0.14);
    		var guestPriceNum = parseInt(price + serviceFee);
    		var hostIncome = parseInt(price*0.97);
    		$("#priceNum").text("$" + price);
    		$("#serviceFeeNum").text("$" + serviceFee);
    		$("#guestPriceNum").text("$" + guestPriceNum);
    		$("#hostIncome").text("$" + hostIncome);
    	})
    	
    	
    	
    	

	      $("#unacceptedOrder").click(function(){
	          $(this).removeClass("unselectBtn").addClass("selectBtn");
	          $("#acceptedOrder").removeClass("selectBtn").addClass("unselectBtn");
	      });
    	
    	
    	// 取消預設按enter送出表單的功能
        $('#myForm').on('keydown', function (event) {
            // Check if the pressed key is Enter (key code 13)
            if (event.which === 13) {
                // Prevent the default form submission
                event.preventDefault();
            }
        });
    	
    	
    	
    	
    	

    });
    
    

  </script>
  
</body>

</html>