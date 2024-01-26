$(document).ready(function() {
    var Lat = Number($("#lat").val());
    var Lng = Number($("#lon").val());
//    
//    console.log(Lat);
//    console.log(Lng);
//    
	// 初始化地图 
    function initializeMap() {
        var mapOptions = {
            center: { lat: Lat, lng: Lng }, // 初始地图中心坐标
            zoom: 15, // 初始缩放级别
            mapTypeId: google.maps.MapTypeId.ROADMAP, // 设置地图类型为道路地图
            mapTypeControl: false, // 禁用地圖類型控制
            streetViewControl: false, // 禁用街景檢視
            fullscreenControl: false // 禁用全螢幕模式
        };

        map = new google.maps.Map(document.getElementById('map'), mapOptions);

        // 创建地址输入框的自动完成
        var input = $('#address')[0];
        var autocomplete = new google.maps.places.Autocomplete(input);
		
		// 创建可拖曳的标记
	    var marker = new google.maps.Marker({
	        map: map,
	        position: map.getCenter(),
	        draggable: true, // 允许拖曳
	        title: 'Drag me!'
	    });
	
	    // 当标记被拖曳时，更新地址输入框的值
	    marker.addListener('dragend', function () {
	        var markerPosition = marker.getPosition();
	        map.panTo(markerPosition);
	
	        // 使用逆地理编码获取地址
	        var geocoder = new google.maps.Geocoder();
	        geocoder.geocode({ 'location': markerPosition }, function (results, status) {
	            if (status === 'OK') {
	                if (results[0]) {
	                    input.value = results[0].formatted_address;
	                }
	            }
	        });
	    });
		
		
		
        // 当地址输入框的值更改时，更新地图上的位置
        autocomplete.addListener('place_changed', function () {
            var place = autocomplete.getPlace();
            if (place.geometry) {
                map.panTo(place.geometry.location);
                map.setZoom(15); // 可以根据需要设置缩放级别

                // 清除之前的标记
                if (marker) {
                    marker.setMap(null);
                }

                // 在新位置创建标记
                marker = new google.maps.Marker({
                    map: map,
                    position: place.geometry.location,
                    title: place.name
                });
            }
        });
        
        

    }

    // 调用初始化函数
    initializeMap();

});