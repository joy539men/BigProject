package com.example.Krist.webSocketTestTest.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.example.Krist.user.dao.userRepository;
import com.example.Krist.user.service.userService;
import com.example.Krist.webSocketTest.dao.MessageRepository;
import com.example.Krist.webSocketTestTest.model.ChatMessage;
import com.example.demo.model.MessageDTO;
import com.example.demo.model.messageBean;
import com.example.demo.model.userBean;

@Controller
public class ChatController {

	@Autowired
    private final SimpMessagingTemplate messagingTemplate;
	
	@Autowired
	private userRepository userRepository;
	
	@Autowired
	private MessageRepository messageRepository;
	

    public ChatController(SimpMessagingTemplate messagingTemplate, HttpSession session) {
        this.messagingTemplate = messagingTemplate;
    }

    @MessageMapping("/send-message")
    public void sendMessage(@Payload ChatMessage message) {
       
        messagingTemplate.convertAndSend("/topic/chat", message);
    }
    
}
