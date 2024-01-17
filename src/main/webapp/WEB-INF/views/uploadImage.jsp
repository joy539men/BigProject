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
	<form>
		<input type="file" name="image" id = "imageInput" multiple>
		<button type="button" onclick="uploadImages()">上傳圖片</button>
	</form>
	
	<script>
		// 實作 Ajax 技術
		function uploadImages(){
				var input = document.getElementById('imageInput');
				var formData = new FormDate();


				for(var i = 0; i < input.files.length; i++){
					formData.append("images", input.files[s]);
				}

				// 使用 Ajax 上傳到伺服器
				$.ajax({
					url: "/upload",
					type: "POST",
					data: formData,
					processData: false,
					contentType: false,
					success: function(response){
							console.log("上傳成功");
					},
					error: function(error){
							console.error("上傳失敗");
						}
					});
					
			}

		
	</script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</body>
</html>