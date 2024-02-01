
  $(document).ready(function() {
 	    // Your existing variable definitions...
 	    var width_crop =650, // 圖片裁切寬度 px 值
			    height_crop = 400, // 圖片裁切高度 px 值
			    type_crop = "square", // 裁切形狀: square 為方形, circle 為圓形
			    width_preview = 780, // 預覽區塊寬度 px 值
			    height_preview = 480, // 預覽區塊高度 px 值
			    compress_ratio = 0.8, // 圖片壓縮比例 0~1
			    type_img = "jpeg", // 圖檔格式 jpeg png webp
			    color = "#ffffff",
			    oldImg = new Image(),
			    myCrop, file, oldImgDataUrl;

 	    // Your existing Croppie initialization...
 	    myCrop = $("#oldImg").croppie({
			    viewport: { // 裁切區塊
				    width: width_crop,
				    height: height_crop,
				    type: type_crop,
				    background: color
		    	},
		    	boundary: { // 預覽區塊
				    width: width_preview,
				    height: height_preview,
				    background: color
			    }
		    });

 	    // Modified readFile function
 	    function readFile(input) {
	    if (input.files && input.files[0]){
	        var file = input.files[0];
	
	        if (file.type.indexOf("image") == 0) {
	            var reader = new FileReader();
	            
	            reader.onload = function(e) {
	                oldImgDataUrl = e.target.result;
	                oldImg.src = oldImgDataUrl;
	
	                // Bind the image to Croppie for cropping
	                myCrop.croppie("bind", {
	                    url: oldImgDataUrl
	                }).then(function() {
	                    console.log('Image binding complete.');
	                    // Image is now ready for any further processing or actions
	                    // For instance, you can enable the submit button here if it was disabled
	                });
	            };
	
	            reader.readAsDataURL(file);
	        } else {
	            alert("您上傳的不是圖檔！");
	        }
	    } else {
	        alert("瀏覽器不支援此功能！建議使用最新版本 Chrome");
	    }
		}


 	    $("#upload_img").on("change", function() {
 	        $("#oldImg").show();
 	        readFile(this);
 	    });

		function dataURItoBlob(dataURI) {
		   // Convert data URI to Blob
		   var byteString = atob(dataURI.split(',')[1]);
		   var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
		   var ab = new ArrayBuffer(byteString.length);
		   var ia = new Uint8Array(ab);
		
		   for (var i = 0; i < byteString.length; i++) {
		      ia[i] = byteString.charCodeAt(i);
		   }
		
		   return new Blob([ab], { type: mimeString });
		}
 	    
 	    // Modify the submitForm click event handler
 	    $("#submitRoomForm").on("click", function(event) {
 	        event.preventDefault();  // Prevent the default form submission
 	        myCrop.croppie("result", {
 	            type: "canvas",
 	            format: type_img,
 	            quality: compress_ratio
 	        }).then(function(src) {
 	            var formData = new FormData($("form")[0]);
 	            var blob = dataURItoBlob(src);
 	            formData.append("multipartFile", blob, "cropped_image.jpg");

 	            // Log formData entries for debugging
 	            for (var pair of formData.entries()) {
 	                console.log(pair[0] + ', ' + pair[1]);
 	            }

 	            // Perform the AJAX request
 	            $.ajax({
 	                url: "/pillowSurfing/addRoom",
 	                type: "POST",
 	                data: formData,
 	                processData: false,
 	                contentType: false,
 	               success: function (response) {
			        	// Check if a roomUrl is present in the response
			        	    if (response && response.roomUrl) {
			        	        // Redirect to the specified URL
			        	        console.log(response);
			        	        window.location.href = response.roomUrl;
			        	    } else {
			        	        // Handle the case when no roomUrl is present in the response
			        	        console.error("No roomUrl in the response");
			        	        alert("Error: Redirect URL not provided. Please try again.");
			        	    }
			         },
 	                error: function(jqXHR, textStatus, errorThrown) {
 	                    console.error("AJAX request failed: ", textStatus, errorThrown, jqXHR.responseText);
 	                }
 	            });
 	        });
 	    });
 	});

