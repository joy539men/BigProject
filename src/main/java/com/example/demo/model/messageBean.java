package com.example.demo.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "message")
public class messageBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer   messageId;
	private String    content;
	private Timestamp timeStamp;
	
	@ManyToOne
    @JoinColumn(name = "senderId", referencedColumnName = "userID")
    private userBean senderId;

    @ManyToOne
    @JoinColumn(name = "receiverId", referencedColumnName = "userID")
    private userBean receiverId;
	
	public messageBean(Integer   messageId, String    content, Timestamp timeStamp) {
		this.messageId = messageId;
		this.content = content;
		this.timeStamp = timeStamp;
		
	}
	
	
	public messageBean() {
		
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

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

	public userBean getSenderId() {
		return senderId;
	}

	public void setSenderId(userBean senderId) {
		this.senderId = senderId;
	}

	public userBean getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(userBean receiverId) {
		this.receiverId = receiverId;
	}
	
	
}
