package com.example.demo.model;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "roomTable")
public class roomTableBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer  roomId;
	private String   title;
	private Integer  price;
	private Blob     photos;
	private String   description;
	private Integer  guestMax;
	private Integer  roomNum;
	private Integer  bedNum;
	private Integer  bathroom;
	private String   status;
	private String   type;
	private String   address;
	private String   lon;
	private String   lat;
	
	@ManyToMany
	@JoinTable(name= "roomTableAndAmenities",
					joinColumns = @JoinColumn(name="roomId"),
					inverseJoinColumns = @JoinColumn(name="amenitiesId"))
	private Set<amenitiesBean> amenities = new HashSet<>();
	
	@ManyToOne
	@JoinColumn(name="userId")
	private userBean user;
	
	@OneToMany(mappedBy = "roomTable", cascade =CascadeType.ALL)
	private Set<bookingBean> bookingBean;
	
	@OneToMany(mappedBy = "roomTable", cascade = CascadeType.ALL)
	private Set<roomPhotoBean> roomPhotos;
	
	@OneToMany(mappedBy = "roomTable", cascade = CascadeType.ALL)
	private Set<reviewBean> reviews;
	
	@OneToMany(mappedBy = "roomTable", cascade = CascadeType.ALL)
	private Set<favoriteBean> favorite;
	
	
	public roomTableBean(Integer  roomId, Integer  hostId, Integer  price, String   title, Blob     photos, String   description, Integer  guestMax, Integer  roomNum, Integer  bedNum, Integer  bathroom, String status, String type,String address, String lon, String lat) {
		this.roomId      = roomId;
		this.price       = price;
		this.title       = title;
		this.photos      = photos;
		this.description = description;
		this.guestMax    = guestMax;
		this.roomNum     = roomNum;
		this.bedNum      = bedNum;
		this.bathroom    = bathroom;
		this.status      = status;
		this.type        = type;
		this.address     = address;
		this.lon         = lon;
		this.lat         = lat;
	}
	
	public roomTableBean() {
    }


	
	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public userBean getUser() {
		return user;
	}


	public void setUser(userBean user) {
		this.user = user;
	}


	public Set<bookingBean> getBookingBean() {
		return bookingBean;
	}


	public void setBookingBean(Set<bookingBean> bookingBean) {
		this.bookingBean = bookingBean;
	}


	public Set<reviewBean> getReviews() {
		return reviews;
	}


	public void setReviews(Set<reviewBean> reviews) {
		this.reviews = reviews;
	}


	public Set<favoriteBean> getFavorite() {
		return favorite;
	}


	public void setFavorite(Set<favoriteBean> favorite) {
		this.favorite = favorite;
	}


	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Blob getPhotos() {
		return photos;
	}

	public void setPhotos(Blob photos) {
		this.photos = photos;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getGuestMax() {
		return guestMax;
	}

	public void setGuestMax(Integer guestMax) {
		this.guestMax = guestMax;
	}

	public Integer getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}

	public Integer getBedNum() {
		return bedNum;
	}

	public void setBedNum(Integer bedNum) {
		this.bedNum = bedNum;
	}

	public Integer getBathroom() {
		return bathroom;
	}

	public void setBathroom(Integer bathroom) {
		this.bathroom = bathroom;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public Set<amenitiesBean> getAmenities() {
		return amenities;
	}

	public void setAmenities(Set<amenitiesBean> amenities) {
		this.amenities = amenities;
	}

	public Set<roomPhotoBean> getRoomPhotos() {
		return roomPhotos;
	}

	public void setRoomPhotos(Set<roomPhotoBean> roomPhotos) {
		this.roomPhotos = roomPhotos;
	}


	
	
}
