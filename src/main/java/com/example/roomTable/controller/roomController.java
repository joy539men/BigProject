package com.example.roomTable.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;
import com.example.demo.user.service.userService;
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
	
	@GetMapping("/getRoomDetails/{roomId}")
	public String SingleRoom(@PathVariable Integer roomId,Model model) {
	    Optional<roomTableBean> roomOptional = roomTableRepository.findById(roomId);
	    
	    // 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
	    roomTableBean room = roomOptional.orElse(null);
	    
	    if(room != null) {
	    	
	    	// 這一行是透過 room 不為空去搜尋是否有 user 的欄位出現
	    	userBean user = room.getUser();
	    	
	    	model.addAttribute("user",user);
		    model.addAttribute("singleRoom", room);
	    }


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
	
	@GetMapping("/roomTableFromMySQL")
	public String listRoomTable(Model model) {
		model.addAttribute("roomTables", roomTableRepository.findAll());
		return "roomTableFromMySQL";
	}
	
	// 本方法是將導入 roomTableGallery 然後給予一個 List 並在前端 imageGallery 給予每個 id 值
	@GetMapping("/roomTableGallery")
	public String getRoomTableGallery(Model model) {
		List<roomTableBean> roomList = (List<roomTableBean>) roomTableRepository.findAll();
		model.addAttribute("roomList", roomList);
		return "/imageGallery";
	}
	
	
	
	

}
