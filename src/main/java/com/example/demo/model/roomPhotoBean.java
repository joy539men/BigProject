package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="roomPhoto")
public class roomPhotoBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer photoId;
	private byte[]  data;
    private String  contentType;
	
	
	@ManyToOne
	@JoinColumn(name="roomId")
	private roomTableBean roomTable;
	
	public roomPhotoBean(Integer photoId, byte[] data, String contentType) {
		this.photoId     = photoId;
		this.data        = data;
		this.contentType = contentType;
	}
	
	public roomPhotoBean() {
		
	}
	
	

	public Integer getPhotoId() {
		return photoId;
	}

	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}

	public byte[] getData() {
		return data;
	}


	public void setData(byte[] data) {
		this.data = data;
	}


	public String getContentType() {
		return contentType;
	}


	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


	public roomTableBean getRoomTable() {
		return roomTable;
	}


	public void setRoomTable(roomTableBean roomTable) {
		this.roomTable = roomTable;
	}

	
	
	
}
