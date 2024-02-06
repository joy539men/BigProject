<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>PillowSurfing | 編輯房間</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
  <meta name="description" content="This is meta description">
  <meta name="author" content="Themefisher">
  <link rel="shortcut icon" href="<c:url value='/images/logo.ico' />" type="image/x-icon">
  <link rel="icon" href="<c:url value='/images/logo.ico' />" type="image/x-icon">

  <!-- theme meta -->

  <!-- # CSS Plugins -->
  <link rel="stylesheet" href="<c:url value='/plugins/slick/slick.css' />">
  <link rel="stylesheet" href="<c:url value='/plugins/font-awesome/fontawesome.min.css' />">
  <link rel="stylesheet" href="<c:url value='/plugins/font-awesome/brands.css' />">
  <link rel="stylesheet" href="<c:url value='/plugins/font-awesome/solid.css' />">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" rel="stylesheet">

  <!-- # Main Style Sheet -->
  <link rel="stylesheet" href="<c:url value='/css/style.css' />">
  <link rel="stylesheet" href="<c:url value='/css/providerStyle.css' />"> 
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoCS3e-5nUFhkFZq0gUiywb6OyAHb7GSs&libraries=places"></script>
  
</head>

<body>

  <!-- navigation -->
  <header class="navigation bg-tertiary">
    <nav class="navbar navbar-expand-xl navbar-light text-center py-3">
      <div class="container">
        <a class="navbar-brand" href="<c:url value='/login'/>">
          <img loading="prelaod" decoding="async" class="img-fluid" width="60px" src="<c:url value='/images/logo.png' />"
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
  <c:url var='saveAction' value='/hostRoomEdit/${room.roomId}' />
		<form:form method='POST' modelAttribute="room" 
		        action="${saveAction}" enctype="multipart/form-data" id="myForm">
			<c:if test='${room.roomId != null}'>
                 <form:hidden path="roomId" /><br>&nbsp;
			</c:if> 
  <section class="w-75 mx-auto">
    <div id="statusFilter" class="w-75 mx-auto mt-5">
      
    </div>
    <div id="orderList" class="">
      <div id="orderA" class="card w-75 mx-auto my-5 " >
	        <div id="roomTitleDiv" class="row mx-3 align-items-center">
		          <div id="roomTitle" class="col-3 align-content-center flex-wrap">
		          	<strong>房源名稱</strong>
		          </div>
		          <div id="roomTitleInputDiv" class="col-9 ">
		          	<form:input path="title" id="roomTitleInput" value="${room.title}"/>
		          </div>	
	        </div> <!-- end of roomTitleDiv -->
	        
	        <div id="roomTypeDiv" class="row mx-3 align-items-center">
		          <div id="roomType" class="col-3 align-content-center flex-wrap">
		          	<strong>房源類型</strong>
		          </div>
		          <div id="roomTypeInputDiv" class="col-9">
		          	<select name="type">
					    <option value="整套房源" <c:if test="${room.type == '整套房源'}">selected</c:if>>整套房源</option>
					    <option value="獨立房間" <c:if test="${room.type == '獨立房間'}">selected</c:if>>獨立房間</option>
					    <option value="合住房間" <c:if test="${room.type == '合住房間'}">selected</c:if>>合住房間</option>
					</select>
<%-- 		          	<form:input path="type" id="roomTypeInput" value="${room.type}"/> --%>
		          </div>	
	        </div> <!-- end of roomTypeDiv -->
	        
	        
	        <div id="roomDescriptDiv" class="row mx-3 align-items-center">
		          <div id="roomDescript" class="col-3 align-content-center flex-wrap">
		          	<strong>房源描述</strong>
		          </div>
		          <div id="roomDescriptInputDiv" class="col-9">
		          	<form:textarea path="description" rows="10" cols="50" value="${room.description}"/>
<%-- 		          	<form:input path="description" id="roomDescriptInput" value="${room.description}"/> --%>
		          </div>	
	        </div> <!-- end of roomDescriptDiv -->
	        
	        <div id="roomGuestDiv" class="row mx-3 align-items-center">
		          <div id="roomGuest" class="col-3 align-content-center flex-wrap">
		          	<strong>接待人數</strong>
		          </div>
		          <div id="roomGuestInputDiv" class="col-9">
		          	<form:input path="guestMax" id="roomGuestInput" value="${room.guestMax}" type="number" min="0"/>
		          </div>	
	        </div> <!-- end of roomGuestDiv -->
	        
	        <div id="roomBedDiv" class="row mx-3 align-items-center">
		          <div id="roomBed" class="col-3 align-content-center flex-wrap">
		          	<strong>床位</strong>
		          </div>
		          <div id="roomBedInputDiv" class="col-9">
		          	<form:input path="bedNum" id="roomBedInput" value="${room.bedNum}" type="number" min="0"/>
		          </div>	
	        </div> <!-- end of roomBedDiv -->
	        
	        <div id="roomBathroomDiv" class="row mx-3 align-items-center">
		          <div id="roomBathroom" class="col-3 align-content-center flex-wrap">
		          	<strong>衛浴</strong>
		          </div>
		          <div id="roomBathroomInputDiv" class="col-9">
		          	<form:input path="bathroom" id="roomBathroomInput" value="${room.bathroom}" type="number" min="0"/>
		          </div>	
	        </div> <!-- end of roomBathroomDiv -->
	        
	        <div id="roomRoomDiv" class="row mx-3 align-items-center">
		          <div id="roomRoom" class="col-3 align-content-center flex-wrap">
		          	<strong>房間數</strong>
		          </div>
		          <div id="roomRoomInputDiv" class="col-9">
		          	<form:input path="roomNum" id="roomRoomInput" value="${room.roomNum}" type="number" min="0"/>
		          </div>	
	        </div> <!-- end of roomRoomDiv -->
	        
	        <div id="roomPriceDiv" class="row mx-3 align-items-center">
		          <div id="roomPrice" class="col-3 align-content-center flex-wrap">
		          	<strong>定價</strong>
		          </div>
		          <div id="roomPriceInputDiv" class="col-9">
		          	<form:input path="price" id="roomPriceInput" value="${room.price}" type="number" min="0"/>
		          </div>	
	        </div> <!-- end of roomPriceDiv -->
	        
	        <div id="amenityDiv" class="row mx-3 align-items-center">
			    	<div id="Amenity" class="col-3 align-content-center flex-wrap">
			        <strong>房間設備</strong>
			    </div>
			    <div id="amenityInputDiv" class="col-9">
			        <ul class="amenityList">
			            <c:forEach var="amenity" items="${amenities}">
			                <li>
			                    <label for="amenity-${amenity.amenityId}" class="amenityCheckbox">
			                        <input type="checkbox" 
			                               id="amenity-${amenity.amenityId}" 
			                               name="amenityIds" 
			                               value="${amenity.amenityId}"
			                               <c:if test="${fn:contains(room.amenities, amenity)}">checked</c:if> >
			                        <div class="px-3">${amenity.amenityName}</div>
			                    </label>
			                </li>
			            </c:forEach>
			        </ul>
			    </div>
			</div> <!-- end of amenityDiv -->
	        
	        <div id="roomPicRoomDiv" class="row mx-3 align-items-center">
		          <div id="roomPic" class="col-3 align-content-center flex-wrap">
		          	<strong>房間照片</strong>
		          </div>
		          <div id="roomPicInputDiv" class="col-9">
<%-- 			          <form:input path="multipartFile" id="roomPicInput"  type="file" />   <!-- 查看模式type="hidden"  編輯模式type="file" --> --%>
			          <label class="btn btn-primary btn-sm"><input id="upload_img" style="display:none;" type="file" accept="image/*"> 更新照片</label>
						<button id="cancleUpload" type="button" class="btn btn-primary btn-sm">取消上傳</button>	
						<div id="oldImg" style="display:none;"></div>
			          <div id="originalImg" style="width:300px ; height:300px">
			       		<img src="<c:url value='${room.filePath}' />" >
			          </div>
		          </div>	
	        </div> <!-- end of roomRoomDiv -->
	        
	        <div id="roomAddressDiv" class="row mx-3 align-items-center">
		          <div id="roomAddress" class="col-3 align-content-center flex-wrap">
		          	<strong>地址</strong>
		          </div>
		          <div id="roomRoomInputDiv" class="col-9">
		          	<form:input path="address" id="address" value="${room.address}" />
		          	<div id="map" style="height: 400px; width: 400px;"></div>
		          </div>	
	        </div> <!-- end of roomAddressDiv -->
	        
	        
	        
	        
	        
	        
	        
       </div>
         
      </div> 
		
	

      

  </section>
  <div class="text-center">
  	<button id="submitRoomForm" class="btn btn-primary btn-sm" type="submit">儲存</button>
 	<a class="btn btn-primary btn-sm" href="<c:url value='/hostRooms' />">取消</a>
  </div>
  </form:form>
  
  <input id="lat" type="hidden" value="${room.lat}" />
  <input id="lon" type="hidden" value="${room.lon }" />
  <input id="roomId" type="hidden" value="${room.roomId }" />
        

  	
  
    <!-- # JS Plugins -->  
  <script src="<c:url value='/plugins/jquery/jquery.min.js' />"></script>
  <script src="<c:url value='/plugins/bootstrap/bootstrap.min.js' />"></script>
  <script src="<c:url value='/plugins/slick/slick.min.js' />"></script>
  <script src="<c:url value='/plugins/scrollmenu/scrollmenu.min.js' />"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>

  <!-- Main Script -->
  <script src="<c:url value='/js/script.js' />"></script>
  <script src="<c:url value='/js/editRoomMap.js' />"></script> 
  <script src="<c:url value='/js/cropImage/EditRoomCropImage.js' />"></script> 
  
  </body>

</html>