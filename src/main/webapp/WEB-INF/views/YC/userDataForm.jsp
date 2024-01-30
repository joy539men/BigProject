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
	<title>會員資料編輯</title>
    
</head>
<body>
<c:url var='register' value='/userDataSaveYC' />
 <form:form method="post" modelAttribute="user" action="${ register}" enctype="multipart/form-data">
	帳號<p>${user.account}</p>
	姓名<form:input path="userName" value="${user.userName}" />
	信箱<form:input path="email" value="${user.email}" />
	手機<form:input path="phone" value="${user.phone}" />
	圖片<img src="<c:url value = '${user.filePath}'/>" style="height:300px">
	<form:input path="multipartFile" type="file" />
    
     <button type="submit" class="btn btn-primary" style="font-size: 20px;">儲存</button>
</form:form>
    <script>
        $(document).ready(function() {
            
        });
    </script>

</body>
</html>
