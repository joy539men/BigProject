package com.example.demo.dao;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.RoomOpenDateEntity;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface RoomOpenDateRepository extends CrudRepository<RoomOpenDateEntity, Integer> {

    List<RoomOpenDateEntity> findAll();

    @Query("SELECT rod FROM RoomOpenDateEntity AS rod WHERE rod.openDate>=:startDate")
    List<RoomOpenDateEntity> listByRoomFilterListDate(@Param("startDate") LocalDate startDate);


    
    @Query("SELECT rod FROM RoomOpenDateEntity AS rod WHERE rod.openDate>=:startDate AND rod.openDate<=:endDate AND rod.roomId IN :roomId ORDER BY rod.openDate ASC")
    List<RoomOpenDateEntity> listByRoomFilterList(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, @Param("roomId") List<Integer> roomId);

}


