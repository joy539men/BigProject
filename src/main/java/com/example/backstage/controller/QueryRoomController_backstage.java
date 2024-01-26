package com.example.backstage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.backstage.service.RoomService_backstage;
import com.example.demo.model.roomTableBean;

@Controller
public class QueryRoomController_backstage {

	RoomService_backstage roomService;

	public QueryRoomController_backstage(RoomService_backstage roomService) {
		super();
		this.roomService = roomService;
	}

	// 全部房間
	@GetMapping("/room")
	public String getAllRoom(Model model) {
		List<roomTableBean> beans = roomService.findAll();

		model.addAttribute("rooms", beans);
		return "backstage/room";
	}

	// 房間詳細資訊
	@GetMapping({ "/room_info/{id}" })
	public String getRoomDetial(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
		roomTableBean roomBean = null;
		Optional<roomTableBean> optional = roomService.findById(id);
		if (optional.isPresent()) {
			roomBean = optional.get();
			System.out.println(roomBean);
		}
		model.addAttribute("room", roomBean);
		return "backstage/room_info";
	}

	// 地圖
	@GetMapping("/map")

	public @ResponseBody List<Map<String, Object>> roomMap() {
		List<Map<String, Object>> map = roomService.roomMap();
//		System.out.println(map);
		for (Map<String, Object> room : map) {
			// 獲取經緯度的字符串值
			String latitudeStr = (String) room.get("lat");
			String longitudeStr = (String) room.get("lon");
			System.out.println(latitudeStr);

			// 轉換為數字，如果轉換失敗，保留原始字符串值
			Double latitude = convertStringToDouble(latitudeStr);
			Double longitude = convertStringToDouble(longitudeStr);
			if (latitude instanceof Double) {
				System.out.println("obj 是 Integer 類型");
				// 如果需要，可以進行相應的類型轉換
			}
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

	@GetMapping("/roomMap")
	public String RoomMap() {

		return "backstage/map";
	}
}
