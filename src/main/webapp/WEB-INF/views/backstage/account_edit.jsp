<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage='true'%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://www.springframework.org/tags" prefix="spring"%><%@ taglib
	prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<script type="text/javascript">
// 	$(document).ready(function() {

// 		var statuSelect = "${userBean.status}";
// 		$("#statuSelect").val(statuSelect);

// 	})

	function updateBook() {
		var hiddenField = document.getElementById("updateOrDelete");
		hiddenField.value = "PUT";
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
				value='/account_edit/UserUpdate/${userBean.userId}' />
			<form:form method='POST' modelAttribute="userBean"
				action="${insertUrl }" enctype="multipart/form-data"
				id="account_edit_form">
				<input type='hidden' id='updateOrDelete' name='_method' value="PUT">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th colspan="2">
								<h1 class="mb-3">帳號資料編輯</h1>
							</th>
						</tr>
					</thead>
					<tbody id="edit_tbody">
						<tr>
							<th scope="row">帳號名稱</th>
							<td>${userBean.account}</td>
						</tr>
						<tr>
							<th scope="row">姓名</th>
							<td><form:input type="text" placeholder="請輸入姓名"
									path="userName" /></td>
						</tr>
						<!-- 						<tr> -->
						<!-- 							<th scope="row">性別</th> -->
						<!-- 							<td><input class="form-check-input" type="radio" checked -->
						<!-- 								name="gender" id="male" value="male"> <label -->
						<!-- 								class="form-check-label" for="male"> 男性 </label>&nbsp;&nbsp; <input -->
						<!-- 								class="form-check-input" type="radio" name="gender" id="female" -->
						<!-- 								value="female"> <label class="form-check-label" -->
						<!-- 								for="female"> 女性 </label></td> -->
						<!-- 						</tr> -->
						<tr>
							<th scope="row">手機</th>
							<td><form:input type="text" placeholder="請輸入手機號碼"
									path="phone" /></td>
						</tr>
						<tr>
							<th scope="row">電子信箱</th>
							<td><form:input type="email" placeholder="請輸入電子信箱"
									path="email" /></td>
						</tr>
						<tr>
							<th scope="row">帳號身分</th>
							<td>${userBean.identity }</td>
						</tr>

						<tr>
							<th scope="row">帳號狀態</th>
							<td><form:select id="statuSelect" path="status">
									<form:option value="已認證">已認證</form:option>
									<form:option value="未認證">未認證</form:option>
									<form:option value="禁止使用">禁止使用</form:option>
								</form:select></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><a href="<c:url value='/account' />">放棄修改</a> <input
								type="submit" value="修改完成" onclick="updateBook()" /></td>
						</tr>
					</tfoot>
				</table>
			</form:form>
		</div>
	</div>

</body>

</html>