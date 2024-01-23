package com.example.Krist.roomTable.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.Krist.roomTable.dao.roomTableRepository;
import com.example.demo.model.bookingBean;
import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;

@Controller
public class roomController {

	@Autowired
	private roomTableRepository roomTableRepository;


	
	
	@GetMapping("/displayRooms")
	public String displayRooms(Model model) {
		Iterable<roomTableBean> rooms = roomTableRepository.findAll(); // 假設使用JPA或Spring Data JPA

		model.addAttribute("rooms", rooms);
		return "roomsDisplayPage"; // 假設你有一個JSP頁面名稱為roomsDisplayPage.jsp

	}
	
	
	@GetMapping("/getRoomDetailsAndBook/{roomId}")
	public String getRoomDetailsAndBook(@PathVariable Integer roomId,Model model, bookingBean bookingBean, HttpSession session) {
	    Optional<roomTableBean> roomOptional = roomTableRepository.findById(roomId);
	    
	    // 設定 session 儲存在網頁當中
	    session.setAttribute("selectedRoomId", roomId);
	    roomTableBean room = roomOptional.orElse(null);
	    
	    if(room != null) {
	    	
	    	// 這一行是透過 room 不為空去搜尋是否有 user 的欄位出現
	    	userBean user = room.getUser();
	    	
	    	model.addAttribute("user",user);
		    model.addAttribute("singleRoom", room);
		    
		    
	    }
	    return "getRoomDetailsAndBook";
	}
	

	
	@GetMapping("/roomDetailTest")
	public String roomDetailTest() {
		return "roomPage";
	}
	
	
	// 本方法是將導入 roomTableGallery 然後給予一個 List 並在前端 imageGallery 給予每個 id 值
	@GetMapping("/roomTableGallery")
	public String getRoomTableGallery(Model model) {
		List<roomTableBean> roomList = (List<roomTableBean>) roomTableRepository.findAll();
		model.addAttribute("roomList", roomList);
		return "roomTableGallery";
	}
	
	
	
	

}
