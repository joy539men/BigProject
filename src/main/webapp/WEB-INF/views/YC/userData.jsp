<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include necessary CSS and JS files -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="croppie.js"></script>
	<title>會員資料</title>
    
</head>
<body>

	帳號<p>${user.account}</p>
	姓名<p>${user.userName}</p>
	信箱<p>${user.email}</p>
	手機<p>${user.phone}</p>
	圖片<img src="<c:url value = '${user.filePath}'/>" style="height:300px">
    
    <a href="<c:url value = '/userDataEditYC'/>">編輯</a>

    <script>
        $(document).ready(function() {
            
        });
    </script>

</body>
</html>
