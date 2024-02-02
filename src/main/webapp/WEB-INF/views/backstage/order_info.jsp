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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
                                <h1>訂單詳細資訊</h1>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">訂單編號</th>
                            <td>${booking.bookingId }</td>
                        </tr>
                        <tr>
                            <th scope="row">訂購人帳號</th>
                            <td>${booking.user.account}</td>
                        </tr>
                        <tr>
                            <th scope="row">訂購人姓名</th>
                            <td>${booking.user.userName }</td>
                        </tr>
                        <tr>
                            <th scope="row">房間名稱</th>
                            <td>${booking.roomTable.title }</td>
                        </tr>
                        <tr>
                            <th scope="row">地址</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row">入住日期</th>
                            <td>${booking.checkinDate }</td>
                        </tr>
                        <tr>
                            <th scope="row">退房日期</th>
                            <td>${booking.checkoutDate }</td>
                        </tr>
                        <tr>
                            <th scope="row">入住人數</th>
                            <td>${booking.guest }</td>
                        </tr>
                        <tr>
                            <th scope="row">備註</th>
                            <td>${booking.tips }</td>
                        </tr>
                        <tr>
                            <th scope="row">價格</th>
                            <td>${booking.totalPrice }</td>
                        </tr>
                        <tr>
                            <th scope="row">訂單狀態</th>
                            <td></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                          <td colspan="2">
								<a href="<spring:url value='/admin/order' />">回前頁</a>
								<a href="<spring:url value='/admin/order_edit/${booking.bookingId }'/>" >編輯</a>
							</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>

</body>

</html>