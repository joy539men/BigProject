package com.example.demo.model;

import java.sql.Blob;

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
	private Blob    photo_1;
	private Blob    photo_2;
	private Blob    photo_3;
	private Blob    photo_4;
	private Blob    photo_5;
	private Blob    photo_6;
	private Blob    photo_7;
	
	
	
	@ManyToOne
	@JoinColumn(name="roomId")
	private roomTableBean roomTable;
	
	public roomPhotoBean(Integer photoId, Blob    photo_1, Blob    photo_2,Blob    photo_3, Blob    photo_4, Blob    photo_5, Blob    photo_6,Blob    photo_7) {
		this.photoId = photoId;
		this.photo_1 = photo_1;
		this.photo_2 = photo_2;
		this.photo_3 = photo_3;
		this.photo_4 = photo_4;
		this.photo_5 = photo_5;
		this.photo_6 = photo_6;
		this.photo_7 = photo_7;
	}

	public Integer getPhotoId() {
		return photoId;
	}

	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}

	public Blob getPhoto_1() {
		return photo_1;
	}

	public void setPhoto_1(Blob photo_1) {
		this.photo_1 = photo_1;
	}

	public Blob getPhoto_2() {
		return photo_2;
	}

	public void setPhoto_2(Blob photo_2) {
		this.photo_2 = photo_2;
	}

	public Blob getPhoto_3() {
		return photo_3;
	}

	public void setPhoto_3(Blob photo_3) {
		this.photo_3 = photo_3;
	}

	public Blob getPhoto_4() {
		return photo_4;
	}

	public void setPhoto_4(Blob photo_4) {
		this.photo_4 = photo_4;
	}

	public Blob getPhoto_5() {
		return photo_5;
	}

	public void setPhoto_5(Blob photo_5) {
		this.photo_5 = photo_5;
	}

	public Blob getPhoto_6() {
		return photo_6;
	}

	public void setPhoto_6(Blob photo_6) {
		this.photo_6 = photo_6;
	}

	public Blob getPhoto_7() {
		return photo_7;
	}

	public void setPhoto_7(Blob photo_7) {
		this.photo_7 = photo_7;
	}

	public roomTableBean getRoomTable() {
		return roomTable;
	}

	public void setRoomTable(roomTableBean roomTable) {
		this.roomTable = roomTable;
	}
	
	
}
