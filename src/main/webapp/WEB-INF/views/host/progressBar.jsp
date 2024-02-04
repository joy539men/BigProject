<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Progress Bar</title>
		<style>
        /* Simple progress bar styles */
        .progress-container {
            width: 100%;
            background-color: #ddd;
        }

        .progress-bar {
            width: 1%;
            height: 30px;
            background-color: #05aead;
            text-align: center;
            line-height: 30px;
            color: white;
            animation: progressAnimation 5s ease-in-out forwards;
        }

        @keyframes progressAnimation {
            from { width: 1%; }
            to { width: 100%; }
        }
    </style>
	</head>
	<body>
			<div class="progress-container">
			    <div class="progress-bar">Loading...</div>
			</div>
	</body>
	<script>
        setTimeout(function() {
            window.location.href = "/pillowSurfing/hostRooms"; // Redirect to your target page
        }, 5000); // Wait for 3 seconds before redirecting
    </script>
</html>