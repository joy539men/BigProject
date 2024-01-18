package com.example.roomTable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.model.roomTableBean;
import com.example.roomTable.service.roomTableService;


@Controller
public class roomTableFormController {

	private roomTableService roomTableService;

	public roomTableFormController(roomTableService roomTableService) {
		
		
			this.roomTableService = roomTableService;
	}
	
			// 本方法送出新增Customer資料的空白表單
			@GetMapping("/intoRoomTableForm")
			public String showbookingForm(Model model) {
				roomTableBean bean = new roomTableBean();
				model.addAttribute("roomTableBean", bean);
				return "/roomTableForm";
			}
			
			// 本方法送出 post 表單的內容到後端
			@PostMapping("/roomTableFormPost")
			public String insertRoomTableForm(@ModelAttribute("roomTableBean")  roomTableBean roomTableBean) {
				roomTableService.save(roomTableBean);
				
				return "index";
			}



}
