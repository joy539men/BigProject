package com.example.demo.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="amenities")
public class amenitiesBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer amenityId;
	private String  amenityName;
	
	public amenitiesBean(Integer amenityId, String  amenityName) {
		this.amenityId=amenityId;
		this.amenityName=amenityName;
	}
	
	public amenitiesBean() {
		
	}
	
	
	
	
	public Set<roomTableBean> getRoomTable() {
		return roomTable;
	}

	public void setRoomTable(Set<roomTableBean> roomTable) {
		this.roomTable = roomTable;
	}

	@ManyToMany(mappedBy = "amenities")
	private Set<roomTableBean> roomTable = new HashSet<>();
	
	

	public Integer getAmenityId() {
		return amenityId;
	}

	public void setAmenityId(Integer amenityId) {
		this.amenityId = amenityId;
	}

	public String getAmenityName() {
		return amenityName;
	}

	public void setAmenityName(String amenityName) {
		this.amenityName = amenityName;
	}


	
}
