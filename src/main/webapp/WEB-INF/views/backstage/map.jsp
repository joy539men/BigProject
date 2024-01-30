<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="css/map.css">
   
</head>

<body>

	<div id="popWindow">
	<div id="disRange">
		<label for="dis" >請選擇範圍距離 : </label>
		<input type="number" name="dis" id="dis"/>&nbsp;<span>公里</span>
		 <button type="button" onclick="updateMarkers()">更新距離</button>
		 <button id="goToUserLocation">回到所在地</button>
	</div>
    <div id="map">
    </div>
    </div>
   <script type="text/javascript" src="js/map.js"></script>
</body>

</html>