<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage='true'%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="spring"%><%@ taglib
	prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<script>


function updateBooking() {
		var hiddenField = document.getElementById("update");
		hiddenField.value = 'PUT';
		document.forms[0].method = "POST";
		document.forms[0].submit();
	}
</script>
<body>

	<%@include file="nav.jsp"%>

	<!-- 主要内容 -->
	<div class="container">
		<div class="container1">
			<c:url var='insertUrl'
				value='/order_edit/OrderUpdate/${bookingBean.bookingId}' />
			<form:form method='POST' modelAttribute="bookingBean"
				action="${insertUrl }" enctype="multipart/form-data"
				id="account_edit_form">
				<input type='hidden' id='update' name='_method' value="PUT">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th colspan="2">
								<h1 class="mb-3">訂單資料編輯</h1>
								<hr>
							</th>
						</tr>
					</thead>
					<tbody id="edit_tbody">
						<tr>
							<th scope="row">訂單編號</th>
							<td>${bookingBean.bookingId }</td>
						</tr>
						<tr>
							<th scope="row">訂購人帳號</th>
							<td>${bookingBean.user.account }</td>
						</tr>
						<tr>
							<th scope="row">訂購人姓名</th>
							<td>${bookingBean.user.userName }</td>
						</tr>
						<tr>
							<th scope="row">房間名稱</th>
							<td>${bookingBean.roomTable.title }</td>
						</tr>
						<tr>
							<th scope="row">入住日期</th>
							<td>原入住日期 : ${bookingBean.checkinDate } &nbsp;&nbsp;&nbsp; 更改日期 : 
							<form:input type="date" path="checkinDate"/>
							</td>
						</tr>
						<tr>
							<th scope="row">退房日期</th>
							<td>原退房日期 : ${bookingBean.checkoutDate } &nbsp;&nbsp;&nbsp; 更改日期 : <form:input
								type="date" path="checkoutDate"/>
							</td>
						</tr>
						<tr>
							<th scope="row">入住人數</th>
							<td><form:input type="text" placeholder="成人人數" path="guest"/></td>
						</tr>
						<tr>
							<th scope="row">價格</th>
							<td><form:input type="text" placeholder="價格" path="totalPrice"/></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<th scope="row">訂單狀態</th> -->
<%-- 							<td><form:select id="" name="" path=""> --%>
<%-- 									<form:option value="">已確認</form:option> --%>
<%-- 									<form:option value="">待評價</form:option> --%>
<%-- 									<form:option value="">住宿中</form:option> --%>
<%-- 							</form:select></td> --%>
<!-- 						</tr> -->
					</tbody>
					<tfoot>
						<tr>
						<tr>
							<td colspan="2"><a href="<c:url value='/order' />">放棄修改</a>
								<input type="submit" value="修改完成" onclick="updateBooking()" /></td>
						</tr>
					</tfoot>
				</table>

			</form:form>
		</div>
	</div>

</body>

</html>