package com.example.demo.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "review")
public class reviewBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reviewId;
	private String  rating;
	private String  comment;
	private Date    review_date;
	
//	@ManyToOne
//	@JoinColumn(name= "userId")
//	private userBean user;
	
	@ManyToOne
    @JoinColumn(name = "user")
    private userBean user;

    @ManyToOne
    @JoinColumn(name = "roomTable")
    private roomTableBean roomTable;
	
	
	
	
	public reviewBean(Integer reviewId, String  rating ,String  comment, Date   review_date) {
		this.reviewId    = reviewId;
		this.rating      = rating;
		this.comment     = comment;
		this.review_date = review_date;
	}
	
	public reviewBean() {
		
	}


	public roomTableBean getRoomTable() {
		return roomTable;
	}


	public void setRoomTable(roomTableBean roomTable) {
		this.roomTable = roomTable;
	}


	public Integer getReviewId() {
		return reviewId;
	}


	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public Date getReview_date() {
		return review_date;
	}


	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}


	public userBean getUser() {
		return user;
	}


	public void setUser(userBean user) {
		this.user = user;
	}



	
	
}
