<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Pillow Surfing</title>

			<link rel="stylesheet" href="<c:url value='/css/back.css'  />" type="text/css" />
			<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" type="text/css" />
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
			<link rel="stylesheet"
				href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
			<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css" rel="stylesheet">
		</head>
		<script>
			function deleteOrder(bookingId) {

				let url = "<c:url value='/order_delete' />" + "/" + bookingId;
				let input = document.createElement("input");

				let container = document.forms[0];
				container.appendChild(input);

				input.type = "text";
				input.name = "_method";
				input.value = "DELETE";

				document.forms[0].action = url;
				document.forms[0].method = "POST";
				document.forms[0].submit();
				return true;
				
			}

			// 彈跳視窗函示
			showAlert1 = (bookingId) => {

				Swal.fire({
					icon: 'question',
					title: '刪除商品',
					text: '確定要刪除訂單編號為: ' + bookingId + ' 這筆紀錄?',
					showCancelButton: true,
				}).then((result) => {
					console.log(result)
					if (result.isConfirmed) {
						deleteOrder(bookingId)
					} else {
						exit;
					}
				})
				
			}
		</script>

		<body>
			<%@include file="nav.jsp" %>

				<!-- 主要内容 -->
				<div id="main" class="container">
					<div class="container">
						<div class="row">
							<div class="col-5">
								<span class="fs-1">後台管理系統</span> <span class="fs-2"> <i class="bi bi-caret-right-fill">
									</i>&nbsp;&nbsp;訂單管理
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
							<div class="col">
								<form action="" id="dateSearch">
									日期 : <input type="date" name="" id=""> <i
										class="bi bi-arrow-right-circle-fill mx-2"></i> <input type="date" name=""
										id="">
									<button class="btn ms-2" type="submit">搜尋</button>
								</form>
							</div>
						</div>
					</div>
					<hr />
					<div id="tableArea">
						<table class="table table-hover display">
							<thead>
								<tr>
									<th>訂單編號</th>
									<th>訂購人帳號</th>
									<th>房間名稱</th>
									<th>入住日期</th>
									<th>退房日期</th>
									<th>訂單建立日期</th>
									<th>訂單狀態</th>
									<th></th>
									<th></th>
									<th style="width: 100px;">編輯 / 刪除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='order' items='${orders }'>
									<tr>
										<td>${order.bookingId }</td>
										<td>${order.user.account }</td>
										<td>${order.roomTable.title }</td>
										<td>${order.checkinDate }</td>
										<td>${order.checkoutDate }</td>
										<td>${order.bookingTime}</td>
										<td></td>
										<td></td>
										<td><a href="<c:url value='/order_info/${order.bookingId }' /> "
												id="detial">詳細資料</a></td>
										<td><a href="<c:url value='/order_edit/${order.bookingId }' /> "><i
													class="bi bi-pencil-square"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="return showAlert1('${order.bookingId}')"><i
													class="bi bi-trash3 "></i></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<form action="#" method='POST'></form>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
		</body>

		</html>