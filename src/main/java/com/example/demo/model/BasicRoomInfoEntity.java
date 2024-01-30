package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "basic_room_info")
public class BasicRoomInfoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer hotelId;
    private Integer hotelRoomNumber;
    private String style;
    private Integer bed;
    private Integer bathroom;
    private Integer guest;
    private Integer price;
    private String images;

    public  BasicRoomInfoEntity(){

    }

    public Integer getBathroom() {
        return bathroom;
    }

    public Integer getGuest() {
        return guest;
    }

    public String getImages() {
        return images;
    }

    public String getStyle() {
        return style;
    }

    public Integer getBed() {
        return bed;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public Integer getHotelRoomNumber() {
        return hotelRoomNumber;
    }

    public Integer getId() {
        return id;
    }

    public Integer getPrice() {
        return price;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public void setBathroom(Integer bathroom) {
        this.bathroom = bathroom;
    }

    public void setBed(Integer bed) {
        this.bed = bed;
    }

    public void setGuest(Integer guest) {
        this.guest = guest;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public void setHotelRoomNumber(Integer hotelRoomNumber) {
        this.hotelRoomNumber = hotelRoomNumber;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setImages(String images) {
        this.images = images;
    }
}
