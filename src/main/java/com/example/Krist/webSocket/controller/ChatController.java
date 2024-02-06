//package com.example.Krist.webSocket.controller;
//
//
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.handler.annotation.Payload;
//import org.springframework.messaging.handler.annotation.SendTo;
//import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
//import org.springframework.stereotype.Controller;
//
//import com.example.Krist.webSocket.model.ChatMessage;
//
///**
// * Created by rajeevkumarsingh on 24/07/17.
// */
//@Controller
//public class ChatController {
//
//    @MessageMapping("/chat.sendMessage")
//    @SendTo("/topic/public") // 大家都將發送目的地
//    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
//        return chatMessage;
//    }
//
//    
//    // 表示這個方法處理從客戶端發送到目的地/chat.addUser的消息,@Payload標註的參數傳遞給方法
//    @MessageMapping("/chat.addUser")
//    @SendTo("/topic/public") // 大家都將發送目的地
//    public ChatMessage addUser(@Payload ChatMessage chatMessage,
//                               SimpMessageHeaderAccessor headerAccessor) {
//    	// 發送消息的用戶名添加到WebSocket會話的標頭中
//        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
//        return chatMessage;
//    }
//
//}
