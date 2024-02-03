package com.example.backstage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.backstage.service.RoomService_backstage;

@Controller
public class MapController {
	
	RoomService_backstage roomService;
	
	public MapController(RoomService_backstage roomService) {
		super();
		this.roomService = roomService;
	}

	// 地圖
	@GetMapping("/map/{lat}/{lng}/{dis}")
	public @ResponseBody List<Map<String, Object>> roomMap(@PathVariable Double lat, @PathVariable Double lng,
			@PathVariable Double dis) {
		List<Map<String, Object>> map = roomService.roomMap(lat, lng, dis);
//		System.out.println(map);
		for (Map<String, Object> room : map) {
			// 獲取經緯度的字符串值
			String latitudeStr = (String) room.get("lat");
			String longitudeStr = (String) room.get("lon");
//			System.out.println(latitudeStr);

			// 轉換為數字
			Double latitude = convertStringToDouble(latitudeStr);
			Double longitude = convertStringToDouble(longitudeStr);
			Map<String, Object> modifiedRoom = new HashMap<>(room);
			modifiedRoom.put("lat", latitude);
			modifiedRoom.put("lon", longitude);

			// 將修改後的Map替換回原始列表中的Map
			int index = map.indexOf(room);
			map.set(index, modifiedRoom);
			// 將轉換後的值放回Map
//		    room.put("lat", latitude);
//		    room.put("lon", longitude);
		}
		return map;
	}
	

	private Double convertStringToDouble(String value) {
		try {
			// 使用 Double.parseDouble 將字符串轉換為雙精度浮點數
			return Double.parseDouble(value);
		} catch (NumberFormatException | NullPointerException e) {
			// 轉換失敗時的處理邏輯，這裡選擇返回 null
			return null;
		}
	}
}
