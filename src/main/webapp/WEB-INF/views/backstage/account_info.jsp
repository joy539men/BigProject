<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pillow Surfing</title>

<link rel="stylesheet" href="<c:url value='/css/back.css'  />"
	type="text/css" />
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />"
	type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>

<body>

	<%@include file="nav.jsp" %>

	<!-- 主要内容 -->
	<div class="container">
		<div class="container1">
			<div id="info">
				<table class="table table-hover table-striped ">
					<thead>
						<tr>
							<th colspan="2">
								<h1>帳號詳細資訊</h1>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">帳號 ID</th>
							<td>${userBean.account }</td>
						</tr>
						<tr>
							<th scope="row">帳號名稱</th>
							<td>${userBean.account }</td>
						</tr>
						<tr>
							<th scope="row">姓名</th>
							<td>${userBean.userName }</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<th scope="row">性別</th> -->
<!-- 							<td></td> -->
<!-- 						</tr> -->
						<tr>
							<th scope="row">手機</th>
							<td>${userBean.phone }</td>
						</tr>
						<tr>
							<th scope="row">電子信箱</th>
							<td>${userBean.email }</td>
						</tr>
						<tr>
							<th scope="row">帳號身分</th>
							<td>${userBean.identity }</td>
						</tr>
						<tr>
							<th scope="row">帳號狀態</th>
							<td>${userBean.status }</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<a href="<spring:url value='/admin/account' />">回前頁</a>
								<a href="<spring:url value='/admin/account_edit/${userBean.userId }'/>" >編輯</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

</body>

</html>