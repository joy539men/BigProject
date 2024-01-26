package com.example.Krist.webSocketTest.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.example.Krist.roomTable.dao.roomTableRepository;
import com.example.Krist.user.dao.userRepository;
import com.example.Krist.webSocket.model.ChatMessage;
import com.example.Krist.webSocketTest.dao.MessageRepository;
import com.example.demo.model.messageBean;

@Controller
public class chatControllerKrist {

	@Autowired
    private SimpMessageSendingOperations messagingTemplate;
	
	@Autowired
    private MessageRepository messageRepository;
    private userRepository userRepository;
    private roomTableRepository roomTableRepository;

    
    public chatControllerKrist(SimpMessageSendingOperations messagingTemplate, MessageRepository messageRepository) {
        this.messagingTemplate = messagingTemplate;
        this.messageRepository = messageRepository;
    }

//    @MessageMapping("/sendMessage")
//    public void sendMessage(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor accessor) {
//        
//     	messageBean message = new messageBean();
//    	message.setContent(chatMessage.getContent());
//    	message.setTimeStamp(Timestamp.valueOf(LocalDateTime.now()));	
//    	messageRepository.save(message);
//
//
//        // 假設您希望將接收到的消息發送到其他訂閱者
//        messagingTemplate.convertAndSend("/topic/messages", chatMessage.getContent());
//       
//    }
    
    @MessageMapping("/sendMessage")
    @SendTo("/topic/messages")
    public String sendMessage(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor accessor) {
        messageBean message = new messageBean();
        message.setContent(chatMessage.getContent());
        message.setTimeStamp(Timestamp.valueOf(LocalDateTime.now()));    
        messageRepository.save(message);

        return chatMessage.getContent();
    }

    
    // 表示這個方法處理從客戶端發送到目的地/chat.addUser的消息,@Payload標註的參數傳遞給方法
    @MessageMapping("/receiveMessage")
    public void addUser(@Payload ChatMessage chatMessage,
                               SimpMessageHeaderAccessor headerAccessor) {
    	
        
    	  messagingTemplate.convertAndSend("/topic/messages", chatMessage.getContent());
    }
    
    private static final AtomicInteger counter = new AtomicInteger(0);

    public static Integer generateUniqueMessageId() {
        return counter.incrementAndGet();
    }
}