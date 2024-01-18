package com.example.roomTable.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.model.roomTableBean;
import com.example.roomTable.dao.roomTableRepositoryTest;

@Controller
public class roomController {

	@Autowired
	private roomTableRepositoryTest roomTableRepository;


	
	
	@GetMapping("/displayRooms")
	public String displayRooms(Model model) {
		Iterable<roomTableBean> rooms = roomTableRepository.findAll(); // 假設使用JPA或Spring Data JPA

		model.addAttribute("rooms", rooms);
		return "roomsDisplayPage"; // 假設你有一個JSP頁面名稱為roomsDisplayPage.jsp

	}
	
	@GetMapping("/intoAjax")
	public String intoAjax() {
		return "testAjax";
	}
	
	@GetMapping("/singleRoom/{roomId}")
	public String SingleRoom(@PathVariable Integer roomId,Model model) {
	    Optional<roomTableBean> roomOptional = roomTableRepository.findById(roomId);
	    
	    // 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
	    roomTableBean room = roomOptional.orElse(null);

	    model.addAttribute("singleRoom", room);
	    return "roomPage";
	}
	
	@GetMapping("/roomDetail")
	public String roomDetail() {
		return "roomPage";
	}
	
	@GetMapping("/roomDetailTest")
	public String roomDetailTest() {
		return "roomPage";
	}
	
	
	

}
