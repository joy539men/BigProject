<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>上傳多張圖片<h2>
	
	<!-- 給一個表格 使用 multiple 去進行多張圖片的存取-->
	<!-- <form id="imageUploadForm" action="/pillowSurfing/upload" method="post" enctype="multipart/form-data">
		<input type="file" name="images" id = "imageInput"  multiple>
		<button type= "submit">上傳圖片</button>
	</form> -->
	
	<h2>Submit Form</h2>

    <form  method="POST" id = "uploadForm" enctype="multipart/form-data">
        <!-- Photo ID: <input type="text" name="photoId"><br> -->
        Content Type: <input type="text" name="contentType"><br>
        <!-- Data: <input type="text" name="data"><br> -->
        Room ID: <input type="text" name="roomId"><br>

        Image :<input type="file" name="data" id = "imageInput" multiple><br>
        <input type="submit" value="Submit">
    </form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script>
		// 實作 Ajax 技術
		$(document).ready(function() {
        $('#uploadForm').submit(function(event) {
            event.preventDefault();

            var input = document.getElementById('imageInput');
            var formData = new FormData();

            for (var i = 0; i < input.files.length; i++) {
                formData.append("images", input.files[i]);
            }

            

            // 使用 Ajax 上傳到伺服器
            $.ajax({
                url: "/upload",
                type: "POST",
                data: formData,
                processData: false,
                contentType: 'application/json; charset=utf-8',
                success: function(response) {
                    console.log("上傳成功");
                },
                error: function(error) {
                    console.error("上傳失敗");
                }
            });
        });
    });
		
		
	</script>
</body>
</html>