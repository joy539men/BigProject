package com.example.Krist.webSocketTest.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Krist.webSocketTest.dao.MessageRepository;
import com.example.demo.model.messageBean;
import com.example.demo.model.userBean;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public void saveMessage(messageBean message) {
        // 在這裡可以添加額外的業務邏輯，例如對訊息內容的處理、驗證等
        messageRepository.save(message);
    }

    public List<messageBean> getMessagesBySender(userBean sender) {
        // 根據發送者查詢相關的訊息
        return messageRepository.findBySenderId(sender);
    }

    public List<messageBean> getMessagesByReceiver(userBean receiver) {
        // 根據接收者查詢相關的訊息
        return messageRepository.findByReceiverId(receiver);
    }

    // 其他可能的業務邏輯

}
