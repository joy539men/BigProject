<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Single Room Details</title>
</head>
<body>
    <h1>Single Room Details</h1>
    
    <c:if test="${not empty singleRoom}">
        <p>ID: ${singleRoom.roomId}</p>
        <p>Other properties...</p>
    </c:if>
    <c:if test="${empty singleRoom}">
        <p>Room not found.</p>
    </c:if>
</body>
</html>