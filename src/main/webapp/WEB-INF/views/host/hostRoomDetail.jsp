<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>房間資訊</title>
</head>
<body>

	<h1>房間資訊</h1>

	<p>名稱: ${room.title} </p>
	<p>類型: ${room.type} </p>
	<p>介紹: ${room.description} </p>
	<p>地址: ${room.address} </p>
	
</body>
</html>