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

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</head>
<script>
	$(document).ready(function() {

		$('#tableArray').DataTable({
			searching : false,
			language : {
				url : '//cdn.datatables.net/plug-ins/1.13.7/i18n/zh-HANT.json',
			},
			scrollCollapse : true,
			scrollY : '40vh',
			scrollX : true,

		})
	});
	
	
    // 使用 jQuery 發送 AJAX 請求獲取 JSON 數據
     $.ajax({
        url: '/pillowSurfing/map',  // 請更換為實際的後端 API 地址
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            // 將 JSON 數據顯示在 div 中
        	$('#jsonData').text(JSON.stringify(data));
            for (var i = 0; i < data.length; i++) {
        var latitude = data[i].lat;  // 第一個元素是緯度
        var longitude = data[i].lon; // 第二個元素是經度

        // 在這裡可以對獲得的經緯度進行操作，例如輸出到控制台
        console.log("Latitude: " + latitude + ", Longitude: " + longitude);
    }
        },error: function() {
            console.error('Failed to fetch JSON data.');
        }
    });
    
   

</script>
<body>

	<%@include file="nav.jsp"%>

	<!-- 主要内容 -->
	<div id="main">
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
					<form id="searchForm" class="d-flex"
						action="${pageContext.request.contextPath}/backend/search"
						method="get">
						<input type="search" id="search" name="search" placeholder="搜尋">
						<button class="btn btn-outline-success ms-2" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</form>
				</div>
				<div class="col-5"></div>
				<div class="col-2"></div>
			</div>
		</div>

		<!-- 資料表格 -->
		<div id="tableArea">
			<a href='<c:url value="/map" />'>Map</a>
			<div id="jsonData"></div>
				<table class=" display  nowrap" id="tableArray" style="width: 100%">
					<thead>
						<tr>
							<th>帳號 ID</th>
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
								<td><a
									href='<c:url value="/account_info/${user.userId }" />'
									id="detial">詳細資料</a></td>
								<td><a
									href='<c:url value="/account_edit/${user.userId }" />'><i
										class="bi bi-pencil-square"></i></a>&nbsp;&nbsp;&nbsp;&nbsp; <a
									href='<c:url value="/sendEmail/${user.userId }" />'><i
										class="bi bi-dash-circle-fill"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
</body>

</html>