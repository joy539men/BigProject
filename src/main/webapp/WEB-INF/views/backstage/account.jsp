<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pillow Surfing</title>

<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" />
<link rel="stylesheet" href="<c:url value='/css/back.css'  />" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<body>

	<%@include file="nav.jsp" %>

	<!-- 主要内容 -->
	<div id="main" class="container">
		<div class="container">
			<div class="row">
				<div class="col-5">
					<span class="fs-1">後台管理系統</span> <span class="fs-2"> <i
						class="bi bi-caret-right-fill"> </i>&nbsp;&nbsp;帳號管理
					</span>
				</div>
				<div class="col-5"></div>
				<div class="col-2" id="adminlogoutdiv">
					<span id="adminlogout">登出</span>
				</div>
			</div>
			<div class="row my-4">
				<div class="col-5">
					<form class="d-flex" action="${pageContext.request.contextPath}/search" method="get">
						<input type="search" id="search" placeholder="搜尋">
						<button class="btn btn-outline-success ms-2" type="submit" name="search"> 
							<i class="bi bi-search"></i>
						</button>
					</form>
				</div>
				<div class="col-5"></div>
				<div class="col-2"></div>
			</div>
		</div>
		<hr />
		<!-- 資料表格 -->
		<div id="tableArea">
			<table class="table table-hover display">
				<thead>
					<tr>
						<th>帳號 ID </th>
						<th>帳號</th>
						<th>建立帳號時間</th>
						<th>帳號身分</th>
						<th>帳號狀態</th>
						<th></th>
						<th style="width: 100px;">編輯 / 禁用</th>
					</tr>
				</thead>
				<tbody id="result">
					<c:forEach items="${users}" var="user">
						<tr>
							<th>${user.userId }</th>
							<td>${user.account }</td>
							<td>${user.registrationTime}</td>
							<td>${user.identity }</td>
							<td>${user.status }</td>
							<td><a href='<c:url value="/account_info/${user.userId }" />' id="detial">詳細資料</a></td>
							<td><a href='<c:url value="/account_edit/${user.userId }" />'><i
									class="bi bi-pencil-square"></i></a>&nbsp;&nbsp;&nbsp;&nbsp; <a
								href=""><i class="bi bi-dash-circle-fill"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>