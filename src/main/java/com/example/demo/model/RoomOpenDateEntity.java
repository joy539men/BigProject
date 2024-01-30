package com.example.demo.model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "room_open_date")
public class RoomOpenDateEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer roomId;

    private LocalDate openDate;


    public RoomOpenDateEntity() {

    }

    public Integer getId() {
        return id;
    }

    public LocalDate getOpenDate() {
        return openDate;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setOpenDate(LocalDate openDate) {
        this.openDate = openDate;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }
}
