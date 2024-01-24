<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	/* function getRoomDetails(roomId){
			$.ajax({
				type:"GET",
				url: '/pillowSurfing/singleRoom/' + roomId,
				success: function(data){
					console.log(data)
					},

					error: function(){
						console.error("Error requesting room details");
						}

				}) */
				
				function getRoomDetails(roomId){
            		window.location.href = '/pillowSurfing/singleRoom/' + roomId;
				}
 </script>
</head>
<body>
	<h2>
		Select Room
		<h2>
			<img src="images/index_start.png" alt="banner image"
				onclick="getRoomDetails(1)">
</body>
</html>