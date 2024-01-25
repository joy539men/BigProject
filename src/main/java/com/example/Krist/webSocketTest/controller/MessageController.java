package com.example.Krist.webSocketTest.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.Krist.roomTable.dao.roomTableRepository;
import com.example.Krist.user.dao.userRepository;
import com.example.Krist.webSocketTest.service.MessageService;
import com.example.demo.model.bookingBean;
import com.example.demo.model.messageBean;
import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;
    
    @Autowired
    private userRepository userRepository;
    
    @Autowired
    private roomTableRepository roomTableRepository;

//    @PostMapping("/send/{roomId}")
//    @ResponseBody
//    public String sendMessage(@RequestBody messageBean messageBean, @PathVariable Integer roomId, Model model,  HttpSession session, bookingBean bookingBean) {
//        // Assuming MessageDto is a data transfer object that represents the incoming message data
//        // You might want to create a DTO if the structure of incoming data is different from MessageBean
//
//    	// 尋找房間 Id
//    	Optional<roomTableBean> roomOptional = roomTableRepository.findById(roomId);
//    	
//    	
//    	// 利用 session 先取得 userId 
//    	Integer user = (Integer) session.getAttribute("userId");
//    	userBean sender = userRepository.findById(user).orElse(null);
//    	
//    	messageBean.setSenderId(sender);
//    	
//    	// 設定 session 儲存在網頁當中
//	    session.setAttribute("webSocketRoomId", roomId);
//	    roomTableBean room = roomOptional.orElse(null);
//	    
//	    if(room != null) {
//	    	
//	    	// 這一行是透過 room 不為空去搜尋是否有 user 的欄位出現
//	    	userBean receiver = room.getUser();
//	    	
//	    	model.addAttribute("sender", sender);
//		    model.addAttribute("receiver", receiver);
//		    
//		    messageBean.setReceiverId(receiver);
//		    
//		    // Create a new MessageBean
//	        messageBean message = new messageBean();
//	        
//	        messageService.saveMessage(message);
//	    }
//    	
//    	
////    	messageBean.setReceiverId(receiver);
//    	
//    
//
//        // Create a new MessageBean
////        messageBean message = new MessageBean(messageBean.getContent(), messageBean.getTimeStamp(), sender, receiver);
//
//        // Save the message to the database
////        messageService.saveMessage(message);
//
//        return "Message sent successfully!";
//    }
    
    
//    @PostMapping("/send/{roomId}")
//    @ResponseBody
//    public String sendMessage(@RequestBody messageBean messageBean, @PathVariable Integer roomId, Model model, HttpSession session, bookingBean bookingBean) {
//        // 尋找房間 Id
//        Optional<roomTableBean> roomOptional = roomTableRepository.findById(roomId);
//
//        // 如果房間存在，則繼續處理
//        roomOptional.ifPresent(room -> {
//            // 這裡可以繼續處理房間存在的邏輯
//            // ...
//
//            // 利用 session 先取得 userId
//            Integer user = (Integer) session.getAttribute("userId");
//            userBean sender = userRepository.findById(user).orElse(null);
//
//            messageBean.setSenderId(sender);
//
//            // 設定 session 儲存在網頁當中
//            session.setAttribute("webSocketRoomId", roomId);
//
//            // 這一行是透過 room 不為空去搜尋是否有 user 的欄位出現
//            userBean receiver = room.getUser();
//
//            model.addAttribute("sender", sender);
//            model.addAttribute("receiver", receiver);
//
//            messageBean.setReceiverId(receiver);
//
//            // Save the message to the database using the provided messageBean
//            messageService.saveMessage(messageBean);
//            
//            // 跳轉聊天頁面
//            return "redirect:/chat-room";
//        });
//
//        return "Message sent successfully!";
//    }
    
    @PostMapping("/send/{roomId}")
    @ResponseBody
    public String sendMessage(@RequestBody messageBean messageBean, 
                              @PathVariable Integer roomId, 
                              Model model, 
                              HttpSession session, 
                              bookingBean bookingBean) {
        Optional<roomTableBean> roomOptional = roomTableRepository.findById(roomId);

        if (roomOptional.isPresent()) {
            roomTableBean room = roomOptional.get();
            Integer userId = (Integer) session.getAttribute("userId");
            userBean sender = userRepository.findById(userId).orElse(null);

            messageBean.setSenderId(sender);
            session.setAttribute("webSocketRoomId", roomId);

            userBean receiver = room.getUser();

            model.addAttribute("sender", sender);
            model.addAttribute("receiver", receiver);

            messageBean.setReceiverId(receiver);

            messageService.saveMessage(messageBean);

            // 跳轉到聊天頁面，這裡假設聊天頁面的路徑是 "/chat-room"
            return "Message sent successfully!";
        }

        // 如果房間不存在，你可能需要返回一個錯誤頁面或者其他處理
        return "error???";
    }


}
