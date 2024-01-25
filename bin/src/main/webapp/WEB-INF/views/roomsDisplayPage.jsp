<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>房間列表</title>
</head>
<body>

<h1>房間列表</h1>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>房間名稱</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="room" items="${rooms}">
            <tr>
                <td>${room.room_id}</td>
                <td>${room.title}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
