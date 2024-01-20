package com.example.backstage.controller;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.backstage.service.RoomService_backstage;
import com.example.demo.model.roomTableBean;

@Controller
public class RoomEditController_backstage {

	RoomService_backstage roomService;

//	@Autowired
	public RoomEditController_backstage(RoomService_backstage roomService) {
		super();
		this.roomService = roomService;
	}

	// 傳送帳號編輯表單
	@GetMapping({ "/rooms" })
	public String getRoomEditForm( Model model) {
		return "backstage/room";
	}
	//編輯完成表單接收
	@PutMapping("/room/edit/{id}")
	public String updateForm(@ModelAttribute("roomBean") roomTableBean roomBean,
			BindingResult result
			) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		roomService.save(roomBean);
		return "redirect:/ ";
	}
	@ModelAttribute("roomBean")
	public roomTableBean getMember(@PathVariable Integer id, Model model) {
		roomTableBean roomBean = null;
		Optional<roomTableBean> optional = roomService.findById(id);
		if (optional.isPresent()) {
			roomBean = optional.get();
			model.addAttribute("user_id", roomBean.getRoomId());
			System.out.println(roomBean +"1");
		} else {
			throw new RuntimeException("查無此筆紀錄: 鍵值: " + id);
		} 
		return roomBean;
	}
}
