package com.example.Krist.baseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BaseController {
	
	@GetMapping("/")
	public String index() {
		return "index"; 
	}
	
	@GetMapping("/webSocket")   
	public String webSocket() {
		return "webSocket";
	}
	
	@GetMapping("/webSocketChat")
    public String getWebSocketPage() {
        return "webSocket";  // 這裡返回視圖名稱，確保你的視圖文件（例如 websocket.jsp）位於 "src/main/resources/WEB-INF/views/" 目錄下
    }
	
	@GetMapping("/googleAPI")
	public String googleAPI() {
		return "googleMap";
	}
	
	@GetMapping("/mainPage")
	public String mainPage() {
		return "mainRoomPage";
	}
	
	@GetMapping("/calendar")
	public String calendar() {
		return "calendarKrist";
	}
}
