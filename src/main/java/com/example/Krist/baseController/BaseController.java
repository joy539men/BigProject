package com.example.Krist.baseController;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.Krist.roomTable.dao.roomTableRepository;
import com.example.Krist.roomTable.service.roomTableService;
import com.example.Krist.user.dao.userRepository;
import com.example.Krist.user.service.userService;
import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;

@Controller
public class BaseController {
	
	@Autowired
	private userService userService;
	
	@Autowired
	private roomTableRepository roomTableRepository;
	
	@GetMapping("/")
	public String index() {
		return "index"; 
	}
	
	@GetMapping("/webSocket/{roomId}")   
	public String webSocket(@PathVariable("roomId")Integer roomId,  Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		Optional<userBean> userOptional =  userService.findById(userId);
		Optional<roomTableBean> roomOptional = roomTableRepository.findById((Integer) roomId);
		
		if(userOptional.isPresent()) {
			userBean user = userOptional.get();
			roomTableBean room = roomOptional.get();
			
			model.addAttribute("userBean", user);
			model.addAttribute("roomBean", room);
		}
		
		model.addAttribute("user",userId);
		
//		model.addAttribute("userBean", user);
		
		return "webSocket";
	}
	
	@GetMapping("/webSocketChat")
    public String getWebSocketPage() {
        return "webSocket";  // 這裡返回視圖名稱，確保你的視圖文件（例如 websocket.jsp）位於 "src/main/resources/WEB-INF/views/" 目錄下
    }
	
	
	@GetMapping("/calendar")
	public String calendar() {
		return "calendarKrist";
	}
	
	@GetMapping("/bookTripIndex")
	public String bookTrip() {
		return "bookTripIndex";
	}
	
	@GetMapping("/chatchat")
	public String ChatChat() {
		return "ChatChat";
	}
	
	@GetMapping("/chat")
	public String chat() {
		return "chat";
	}
	
	@GetMapping("/websocketChat")
	public String websocketChat() {
		return "WebsocketChat";
	}
	

	
//	@GetMapping("/Byron")
//	public String Byron() {
//		return "roomTableGalleryByron";
//	}

	
}
