package com.example.Krist.webSocketTestTest.model;


public class ChatMessage {
    private String sender;
    private String content;

    // 构造函数
    public ChatMessage() {
    }

    public ChatMessage(String sender, String content) {
        this.sender = sender;
        this.content = content;
    }

    // Getter 和 Setter 方法
    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
