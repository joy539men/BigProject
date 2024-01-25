package com.example.host.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.roomTableBean;

@Repository

public interface HostRepository extends JpaRepository<roomTableBean, Integer> {
	
	void deleteById(Integer id);
	
    @Query("SELECT r FROM roomTableBean r LEFT JOIN FETCH r.amenities WHERE r.roomId = :roomId")
    Optional<roomTableBean> findRoomWithAmenitiesById(@Param("roomId") Integer roomId);
}
