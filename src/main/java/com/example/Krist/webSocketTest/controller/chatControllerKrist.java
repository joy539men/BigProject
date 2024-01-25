package com.example.Krist.webSocketTest.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.example.Krist.roomTable.dao.roomTableRepository;
import com.example.Krist.user.dao.userRepository;
import com.example.Krist.webSocket.model.ChatMessage;
import com.example.Krist.webSocketTest.dao.MessageRepository;
import com.example.demo.model.messageBean;
import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;

@Controller
public class chatControllerKrist {

    private final SimpMessageSendingOperations messagingTemplate;
    private final MessageRepository messageRepository;
    private userRepository userRepository;
    private roomTableRepository roomTableRepository;

    
    public chatControllerKrist(SimpMessageSendingOperations messagingTemplate, MessageRepository messageRepository) {
        this.messagingTemplate = messagingTemplate;
        this.messageRepository = messageRepository;
    }

    @MessageMapping("/sendMessage")
    public void sendMessage(@Payload ChatMessage chatMessage, HttpSession session) {
        // 將消息存儲到資料庫的邏輯（這裡僅為示例）
    	Integer roomId = (Integer) session.getAttribute("webSocketRoomId");
    	Integer userId = (Integer) session.getAttribute("userId");
    	userBean user = userRepository.findById(userId).orElse(null);
    	roomTableBean room = roomTableRepository.findById(roomId).orElse(null);
    	userBean roomUser =  room.getUser();
    	
     	messageBean message = new messageBean();
//    	message.setReceiverId(null)
    	message.setContent(chatMessage.getContent());
    	message.setTimeStamp(Timestamp.valueOf(LocalDateTime.now()));
    	
    	message.setSenderId(user);   	
     	message.setReceiverId( roomUser); 	
    	messageRepository.save(message);
        // ...

        // 假設您希望將接收到的消息發送到其他訂閱者
        messagingTemplate.convertAndSend("/topic/messages", chatMessage.getContent());
    }
    
    // 表示這個方法處理從客戶端發送到目的地/chat.addUser的消息,@Payload標註的參數傳遞給方法
    @MessageMapping("/receiveMessage")
    public void addUser(@Payload ChatMessage chatMessage,
                               SimpMessageHeaderAccessor headerAccessor) {
    	
        
    	  messagingTemplate.convertAndSend("/topic/messages", chatMessage.getContent());
    }
}