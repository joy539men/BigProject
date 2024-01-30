package com.example.demo.controller;


import java.time.LocalDate;

public class RoomFilterRequest {
    private String style = "";
    private String startDate = LocalDate.now().toString();
    private String endDate = LocalDate.now().plusDays(90).toString();
    private Integer adult = 0;
    private Integer child = 0;
    private Integer baby = 0;
    private String location = "";
    private Integer minPrice = 0;
    private Integer maxPrice = 99999999;
    private Integer room = 0;
    private Integer bed = 0;
    private Integer bd = 0;
    private Boolean askStartDate = false;

    public Integer getBed() {
        if (bed == null || bed == 0) {
            return null;
        }
        return bed;
    }

    public String getStyle() {
        if (style == null || style.isBlank()) {
            return null;
        }
        return style;
    }

    public Integer getAdult() {
        if (adult == null) {
            return 0;
        }
        return adult;
    }

    public Integer getBaby() {
        if (baby == null) {
            return 0;
        }
        return baby;
    }

    public Integer getBd() {
        if (bd == null || bd==0) {
            return null;
        }
        return bd;
    }

    public Integer getChild() {
        if (child == null) {
            return 0;
        }
        return child;
    }

    public Integer getMaxPrice() {
        if (maxPrice == null) {
            return 999999999;
        }
        return maxPrice;
    }

    public Integer getMinPrice() {
        if (minPrice == null) {
            return 0;
        }
        return minPrice;
    }

    public Integer getRoom() {
        if (room == null) {
            return 0;
        }
        return room;
    }

    public String getEndDate() {
        if (endDate == null || endDate.isBlank()) {
            return  LocalDate.now().plusDays(90).toString();
        }
        return endDate;
    }

    public String getLocation() {
        if (location == null || location.isBlank()) {
            return null;
        }
        return location;
    }

    public String getStartDate() {
        if (startDate == null || startDate.isBlank()) {
            return LocalDate.now().toString();
        }
        return startDate;
    }



    public void setBed(Integer bed) {
        this.bed = bed;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public void setAdult(Integer adult) {
        this.adult = adult;
    }

    public void setBaby(Integer baby) {
        this.baby = baby;
    }

    public void setBd(Integer bd) {
        this.bd = bd;
    }

    public void setChild(Integer child) {
        this.child = child;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }
}
