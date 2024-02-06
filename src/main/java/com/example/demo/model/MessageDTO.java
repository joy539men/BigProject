package com.example.demo.model;

import java.sql.Timestamp;

public class MessageDTO {
    private String content;
    private Timestamp timeStamp;
    private String senderName;

    // 构造器
    public MessageDTO() {}

    public MessageDTO(String content, Timestamp timeStamp, String senderName) {
        this.content = content;
        this.timeStamp = timeStamp;
        this.senderName = senderName;
    }

    // Getter 和 Setter
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(Timestamp timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }
}

