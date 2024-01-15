package com.example.demo.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.engine.jdbc.env.spi.IdentifierCaseStrategy;

@Entity
@Table(name="user")
public class userBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer    userId;
	private String     account;
	private String     password;
	private String     userName;
	private String     email;
	private String     address;
	private String     phone;
	private Blob	   photo;
	private String     identity;
	private String     status;
	private String     statusNum;
	private Timestamp  registrationTime;
	
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<reviewBean> reviews = new HashSet<>();
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<bookingBean> booking;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<roomTableBean> roomTable;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<favoriteBean> favorite;
	
	

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public Set<reviewBean> getReviews() {
		return reviews;
	}

	public void setReviews(Set<reviewBean> reviews) {
		this.reviews = reviews;
	}

	public List<roomTableBean> getRoomTable() {
		return roomTable;
	}

	public void setRoomTable(List<roomTableBean> roomTable) {
		this.roomTable = roomTable;
	}

	public List<favoriteBean> getFavorite() {
		return favorite;
	}

	public void setFavorite(List<favoriteBean> favorite) {
		this.favorite = favorite;
	}

	public userBean(Integer userId,String  account, String  password, String  userName, String  email, String  address, String  phone,Blob	photo , String  identity, String  status, String  statusNum, Timestamp  registrationTime) {
		this.userId            = userId;
		this.account           = account;
		this.password          = password;
		this.userName          = userName;
		this.email             = email;
		this.address           = address;
		this.phone             = phone;
		this.photo             = photo;
		this.identity          = identity;
		this.status            = status;
		this.statusNum         = statusNum;
		this.registrationTime  = registrationTime;
		this.phone             = phone;
	}
	
	public userBean() {
		
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatusNum() {
		return statusNum;
	}

	public void setStatusNum(String statusNum) {
		this.statusNum = statusNum;
	}

	public Timestamp getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(Timestamp registrationTime) {
		this.registrationTime = registrationTime;
	}


	public List<bookingBean> getBooking() {
		return booking;
	}

	public void setBooking(List<bookingBean> booking) {
		this.booking = booking;
	}
	
	
	
	
}
