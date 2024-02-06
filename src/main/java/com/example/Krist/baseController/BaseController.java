package com.example.Krist.baseController;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {
	
	@GetMapping("/")
	public String index() {
		return "index"; 
	}
	
	@GetMapping("/webSocket")   
	public String webSocket(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		
		model.addAttribute("user",userId);
		
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
