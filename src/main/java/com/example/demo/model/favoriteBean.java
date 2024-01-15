package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "favorite")
public class favoriteBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer favoriteId;
	
	
	@ManyToOne
	@JoinColumn(name="userId")
	private userBean user;
	
	@ManyToOne
	@JoinColumn(name= "roomId")
	private roomTableBean roomTable;
	
	public favoriteBean(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}
	
	public favoriteBean() {
		
	}

	public Integer getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}

	public userBean getUser() {
		return user;
	}

	public void setUser(userBean user) {
		this.user = user;
	}

	public roomTableBean getRoomTable() {
		return roomTable;
	}

	public void setRoomTable(roomTableBean roomTable) {
		this.roomTable = roomTable;
	}

	
	
}
