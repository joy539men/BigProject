package com.example.Krist.booking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.reviewBean;
import com.example.demo.model.roomTableBean;

@Repository
public interface reviewRepository extends JpaRepository<reviewBean, Integer>{


	List<reviewBean> findAllByRoomTable(roomTableBean room);

}
