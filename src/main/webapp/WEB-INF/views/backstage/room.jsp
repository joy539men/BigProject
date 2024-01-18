<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pillow Surfing</title>

<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" />
<link rel="stylesheet" href="<c:url value='/css/back.css'  />" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<script>
	$(document).ready(function(){
// 		<c:forEach var='room' items='${rooms}'>
// 		var selectStatus = "${room.status}"
// 		$("selectStatus").val(selectStatus)
// 		console.log(selectStatus)
// 		</c:forEach>
	})
</script>
<body>

	<%@include file="nav.jsp"%>

	<!-- 主要内容 -->
	<div id="main" class="container">
		<div class="container">
			<div class="row">
				<div class="col-5">
					<span class="fs-1">後台管理系統</span> <span class="fs-2"> <i
						class="bi bi-caret-right-fill"> </i>&nbsp;&nbsp;房間管理
					</span>
				</div>
				<div class="col-5"></div>
				<div class="col-2" id="adminlogoutdiv">
					<span id="adminlogout">登出</span>
				</div>
			</div>
			<div class="row my-4">
				<div class="col">
					<form class="d-flex">
						<input type="search" id="search" placeholder="搜尋">
						<button class="btn btn-outline-success ms-2" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</form>
				</div>
				<div class="col"></div>
				<div class="col"></div>
			</div>
		</div>
		<hr />
		<!-- 資料表格 -->
		<div id="tableArea">
<%-- 			<form:form action="/room/edit/${room.roomId }" method="POST" --%>
<%-- 				modelAttribute="roomBean"> --%>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>房間 ID</th>
							<th>房間名稱</th>
							<th>房間擁有者帳號</th>
							<th>房間地址</th>
							<th>價格</th>
							<th>房間目前狀態</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='room' items='${rooms}'>
							<tr>
								<th>${room.roomId }</th>
								<td>${room.title }</td>
								<td>${room.user.account}</td>
								<td>${room.address }</td>
								<td>${room.price }</td>
								<td><select id="selectStatus" name="status">
										<option value="未開放" ${room.status == "未開放" ? "selected" : ""}>未開放</option>
										<option value="可使用" ${room.status == "可使用" ? "selected" : ""}>可使用</option>
										<option value="使用中" ${room.status == "使用中" ? "selected" : "" } >使用中</option>
										<option value="待審核" ${room.status == "待審核" ? "selected" : "" } >待審核</option>
										<option value="禁止使用" ${room.status == "禁止使用" ? "selected" : "" }>禁止使用</option>
										<option value="未開放" ${room.status == "未開放" ? "selected" : ""}>未開放</option>
<!-- 										<option value="1" >可使用</option> -->
<!-- 										<option value="2" >使用中</option> -->
<!-- 										<option value="3"  >待審核</option> -->
<!-- 										<option value="4" >禁止使用</option> -->
										</select></td>
								<td><a href='<c:url value="/room_info/${room.roomId }" />'
									id="detial">詳細資訊</a></td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
<%-- 			</form:form> --%>
		</div>
	</div>

</body>

</html>