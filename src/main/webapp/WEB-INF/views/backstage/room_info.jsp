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

<body>

	<%@include file="nav.jsp"%>

	<!-- 主要内容 -->
	<div class="container">
		<div class="container1">
			<div id="info">
				<table class="table table-hover table-striped ">
					<thead>
						<tr>
							<th colspan="2">
								<h1>房間資訊</h1>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">房間 ID</th>
							<td>${room.roomId }</td>
						</tr>
						<tr>
							<th scope="row">房間擁有者帳號</th>
							<td>${room.user.account }</td>
						</tr>
						<tr>
							<th scope="row">房間名稱</th>
							<td>${room.title }</td>
						</tr>
						<tr>
							<th scope="row">房間地址</th>
							<td>${room.address }</td>
						</tr>
						<tr>
							<th scope="row">提供設備</th>
							<td><c:forEach var="amenity" items="${room.amenities}">
            						${amenity.amenityName}<br />
								</c:forEach></td>
						</tr>
						<tr>
							<th scope="row">價格</th>
							<td>${room.price}</td>
						</tr>
						<tr>
							<th scope="row">房間目前狀態</th>
							<td>${room.status }</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><a href="<c:url value='/admin/room' />">回前頁</a></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

</body>

</html>