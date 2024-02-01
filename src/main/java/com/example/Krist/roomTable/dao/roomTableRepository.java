package com.example.Krist.roomTable.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.amenitiesBean;
import com.example.demo.model.roomTableBean;

@Repository
public interface roomTableRepository extends CrudRepository<roomTableBean, Integer>{
    List<roomTableBean> findAll();

    List<roomTableBean> findByAddress(@Param("address") String address);
    
    @Query("SELECT r.amenities FROM roomTableBean r WHERE r.roomId = :roomId")
    Set<amenitiesBean> findAmenitiesByRoomId(@Param("roomId") Integer roomId);
    
    // Query("SELECT r.amenities FROM roomTableBean r WHERE r.roomId = : roomId")
    // Set<amenitiesBean> findAmenitiesByRoomId(@Param("roomId") Integer roomId);

}
