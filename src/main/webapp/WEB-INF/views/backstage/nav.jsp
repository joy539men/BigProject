<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 導覽列 -->
	<nav class="navbar navbar-expand fixed-top">
		<img src="<c:url value='/images/logo.png' />">
		<div id="navbarNav">
			<ul class="navbar-nav flex-column ">
				<li class="nav-item"><a class="nav-link text-success fs-3"
					href='<c:url value="/account" />'>帳號管理</a></li>
				<li class="nav-item"><a class="nav-link text-success fs-3"
					href="<c:url value="/order" />">訂單管理</a></li>
				<li class="nav-item"><a class="nav-link text-success fs-3"
					href="<c:url value="/room" />">房間管理</a></li>
			</ul>
		</div>
		<div>
			<a href="" class="text-success" style="text-decoration: none;">返回首頁</a>
		</div>
	</nav>