package com.example.backstage.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.backstage.service.RoomService;
import com.example.demo.model.roomTableBean;

@Controller
public class QueryRoomController {
	
	RoomService roomService;
	
	public QueryRoomController(RoomService roomService) {
		super();
		this.roomService = roomService;
	}

	// 全部房間
	@GetMapping("/room")
	public String getAllRoom(Model model) {
		List<roomTableBean> beans = roomService.findAll();
		model.addAttribute("rooms",beans);
		return "backstage/room";
	}
	//房間詳細資訊
	@GetMapping({ "/room_info/{id}" })
	public String getRoomDetial(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
		roomTableBean roomBean = null;
		Optional<roomTableBean> optional = roomService.findById(id);
		if (optional.isPresent()) {
			roomBean = optional.get();
			System.out.println(roomBean);
		}
		model.addAttribute("room",roomBean );
		return "backstage/room_info";
	}

}
