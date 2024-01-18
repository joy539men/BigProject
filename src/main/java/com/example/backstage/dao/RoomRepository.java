package com.example.backstage.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.roomTableBean;

public interface RoomRepository extends JpaRepository<roomTableBean,Integer>{

}
