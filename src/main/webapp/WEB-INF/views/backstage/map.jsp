<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <style>
        #map {
            height: 100%;
        }

        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #locationButton {
            width: 250px;
            font-size: 20px;
            background-color: cornflowerblue;
            color: aliceblue;
            margin-top: 10px;
        }
    </style>
</head>

<body>

	<p id="jsonData"></p>
    <div id="map">
    </div>
   <script type="text/javascript" src="js/map.js"></script>
</body>

</html>