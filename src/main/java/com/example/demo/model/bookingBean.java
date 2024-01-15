package com.example.demo.model;

import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="booking")
public class bookingBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bookingId;
	private Date    checkinDate;
	private Date    checkoutDate;
	private Integer totalPrice;
	private Date    bookingTime;
	private Integer guest;
	private String  tips;
	private Integer night;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private userBean user;
	
	@ManyToOne
	@JoinColumn(name="roomId")
	private roomTableBean roomTable;
	
	

	public bookingBean(Integer bookingId, Date checkinDate, Date checkoutDate, Integer totalPrice, Date bookingTime, Integer guest, String  tips, Integer night) {
		this.bookingId = bookingId;
		this.checkinDate = checkinDate;
		this.checkoutDate = checkoutDate;
		this.totalPrice = totalPrice;
		this.bookingTime = bookingTime;
		this.guest = guest;
		this.tips = tips;
		this.night = night;
	}
	
	public bookingBean() {
		
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

	public Integer getBookingId() {
		return bookingId;
	}

	public void setBookingId(Integer bookingId) {
		this.bookingId = bookingId;
	}

	public Date getCheckinDate() {
		return checkinDate;
	}

	public void setCheckinDate(Date checkinDate) {
		this.checkinDate = checkinDate;
	}

	public Date getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(Date checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(Date bookingTime) {
		this.bookingTime = bookingTime;
	}

	public Integer getGuest() {
		return guest;
	}

	public void setGuest(Integer guest) {
		this.guest = guest;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public Integer getNight() {
		return night;
	}

	public void setNight(Integer night) {
		this.night = night;
	}



	
	
}
