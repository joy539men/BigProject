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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.backstage.service.OrderService_backstage;
import com.example.backstage.service.RoomService_backstage;
import com.example.demo.model.roomTableBean;

@Controller
@RequestMapping("/admin")
public class QueryRoomController_backstage {

	RoomService_backstage roomService;
	OrderService_backstage orderService;

	public QueryRoomController_backstage(RoomService_backstage roomService, OrderService_backstage orderService) {
		super();
		this.roomService = roomService;
		this.orderService = orderService;
	}

	// 全部房間
	@GetMapping("/room")
	public String getAllRoom(Model model) {
		List<roomTableBean> roombean = roomService.findAll();
//		List<roomTableBean> filteredRooms = StreamSupport.stream(roombean.spliterator(), false)
//	            .filter(room -> !"使用中".equals(room.getStatus()) && !"待審核".equals(room.getStatus()) && !"未開放".equals(room.getStatus())&& !"禁止使用".equals(room.getStatus()))
//	            .collect(Collectors.toList());
		model.addAttribute("rooms", roombean);
		return "backstage/room";
	}

	// 更改房間狀態
	@PostMapping("/updateRoomStatus")
	@ResponseBody
	public roomTableBean updateRoomStatus(@RequestParam Integer roomIds, @RequestParam String status) {
		// 根據房間ID查找房間
		roomTableBean room = roomService.findById(roomIds).orElse(null);
		System.out.println(room);
		if (room != null) {
			// 如果有訂單入住期間，將狀態設為使用中
			if (orderService.hasOrderDuringCurrentDate(room)) {
				status = "使用中";
			}
//			// 修改房間狀態
			room.setStatus(status);
			// 保存更新後的房間
			roomService.save(room);
//			System.out.println(room);
	    }
		return room; 
	}
	
	// 判斷房間狀態
	@GetMapping("/checkRoomInUseDuringOrderPeriod")
	@ResponseBody
	public boolean checkRoomInUseDuringOrderPeriod(@RequestParam Integer roomIds) {
		// 根據房間ID查找房間
		roomTableBean room = roomService.findById(roomIds).orElse(null);
		System.out.println(orderService.hasOrderDuringCurrentDate(room));
		return orderService.hasOrderDuringCurrentDate(room); 
	}

	// 房間詳細資訊
	@GetMapping({ "/room_info/{id}" })
	public String getRoomDetial(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
		roomTableBean roomBean = null;
		Optional<roomTableBean> optional = roomService.findById(id);
		if (optional.isPresent()) {
			roomBean = optional.get();
//			System.out.println(roomBean);
		}
		model.addAttribute("room", roomBean);
		return "backstage/room_info";
	}




}
