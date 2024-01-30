(g => { var h, a, k, p = "The Google Maps JavaScript API", c = "google", l = "importLibrary", q = "__ib__", m = document, b = window; b = b[c] || (b[c] = {}); var d = b.maps || (b.maps = {}), r = new Set, e = new URLSearchParams, u = () => h || (h = new Promise(async (f, n) => { await (a = m.createElement("script")); e.set("libraries", [...r] + ""); for (k in g) e.set(k.replace(/[A-Z]/g, t => "_" + t[0].toLowerCase()), g[k]); e.set("callback", c + ".maps." + q); a.src = `https:/maps.${c}apis.com/maps/api/js?` + e; d[q] = f; a.onerror = () => h = n(Error(p + " could not load.")); a.nonce = m.querySelector("script[nonce]")?.nonce || ""; m.head.append(a) })); d[l] ? console.warn(p + " only loads once. Ignoring:", g) : d[l] = (f, ...n) => r.add(f) && u().then(() => d[l](f, ...n)) })({
	key: "AIzaSyDh6Ay3siEcMyJN6xIcJXHgIYleQyq8nkk",
	v: "weekly",
	// Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
	// Add other bootstrap parameters as needed, using camel case.
});

let map, infoWindow, markers = [];

async function initMap() {

	const { Map, InfoWindow } = await google.maps.importLibrary("maps");
	myLocation = await getLocation();
	map = new Map(document.getElementById("map"), {
		center: myLocation,
		zoom: 14,
		mapTypeControl: false,
		streetViewControl: false,
	});

	infoWindow = new InfoWindow();
	infoWindow.setPosition(myLocation);
	infoWindow.setContent("您的位置");
	infoWindow.open(map);
	updateMarkers()

	function getLocation() {
		return new Promise((resolve, reject) => {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(
					(position) => {
						const userPosition = {
							lat: position.coords.latitude,
							lng: position.coords.longitude,
						};
						resolve(userPosition);
					},
					() => {
						handleLocationError(true, infoWindow, map.getCenter());
					}
				);
			} else {
				// Browser doesn't support Geolocation
				handleLocationError(false, infoWindow, map.getCenter());
			}
		});
	}

	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
		infoWindow.setPosition(pos);
		infoWindow.setContent(
			browserHasGeolocation
				? "Error: The Geolocation service failed."
				: "Error: Your browser doesn't support geolocation."
		);
	}

	document.getElementById('goToUserLocation').addEventListener('click', () => {
		if (myLocation) {
			//回到使用者位置
			map.panTo(myLocation);
			// 如果有之前的 InfoWindow，再次顯示
			if (infoWindow) {
				infoWindow.open(map);
			}
		}
	});


}

function displayMarkers(data) {
	for (let i = 0; i < data.length; i++) {
		let marker = new google.maps.Marker({
			position: { lat: data[i].lat, lng: data[i].lon },
			map: map,
			title: data[i].title,
		});
		var result = data[i].file_path.split("/").slice(1).join("/")
		let infowindow = new google.maps.InfoWindow({
			disableAutoPan: true,
			content: `<div style="max-width: 200px;">
				<img src='${result}' alt="檔案圖片" style="max-width: 100%;border-radius: 5px;">
				<span style="display: block">${data[i].title}</span>
				 <a href="#" class="room-link" data-room-id="${data[i].room_id}" style="text-decoration: none;display: block">View Room Details</a>
				</div>
				`,
			maxWidth: 200
		});


		marker.addListener("click", () => {
			// 如果目前有開啟中的訊息視窗，先將其關閉 
			if (this.infowindow) this.infowindow.close();
			// 顯示被點擊地標的訊息視窗
			infowindow.open(this.map, marker);
			this.infowindow = infowindow;
			console.log("按下marker")

			google.maps.event.addListenerOnce(infowindow, 'domready', function() {
				// 為超連結添加點擊事件
				$('.room-link').on('click', function(event) {
					event.preventDefault();
					// 獲取房間 ID
					let roomId = $(this).data('room-id');
					console.log("超連結roomId:", roomId)
					// 直接跳轉到後端定義的頁面
					window.location.href = `/pillowSurfing/getRoomDetailsAndBook/${roomId}`;
				});
			});
		});
		markers.push({ marker, infowindow });
	}
}

function updateMarkers() {
	// 清空之前的標記
	for (let i = 0; i < markers.length; i++) {
		markers[i].marker.setMap(null)
	}
	markers = [];

	const distanceDisplay = $('#distanceDisplay');
	const distance = $('#dis').val() || 3; // 默認距離 3 公里

	distanceDisplay.text(`目前距離範圍：${distance} 公里`);

	$.ajax({
		url: `/pillowSurfing/map/${myLocation.lat}/${myLocation.lng}/${distance}`,  // 後端 API 地址
		method: 'GET',
		dataType: 'json',
		success: function(data) {
			// 將 JSON 數據顯示在 div 中
			// $('#jsonData').text(JSON.stringify(data));

			displayMarkers(data);

		}, error: function() {
			console.error('Failed to fetch JSON data.');
		}
	});
}
function showMap() {
	initMap()
}
