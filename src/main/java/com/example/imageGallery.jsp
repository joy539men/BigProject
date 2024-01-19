<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Gallery</title>
    
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>

    function parse(a){
    	var str = a;
        var roomId = parseInt(str.match(/\d+/)[0]);
        return roomId;
        }
   
    
    function getImageDetails(roomId) {
        // 使用jQuery的Ajax向后端发送请求
        $.ajax({
            type: "GET",
            url: "/pillowSurfing/getRoomDetails/" + roomId,
            dataType: "json",
            success: function(response) {
                // 在这里处理从后端返回的数据
                alert("Room Details: " + response);
            },
            error: function(xhr, status, error) {
                // 在这里处理请求失败的情况
                console.error("Error fetching room details: " + error);
            }
        });
        }
    </script>
</head>
<body>
    <!-- 遍历数据库中的图片列表，并为每张图片生成相应的JavaScript代码 -->
    <c:forEach var="room" items="${roomList}">
        <img src="${room.photos}" alt="${room.description}" onclick="getImageDetails(parse(${room.roomId}))">
    </c:forEach>
</body>
</html>

</html>