package com.example.demo.dao;


import com.example.demo.model.BasicRoomInfoEntity;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface BasicRoomInfoRepository extends CrudRepository<BasicRoomInfoEntity, Integer> {

    List<BasicRoomInfoEntity> findAll();

    List<BasicRoomInfoEntity> findByHotelIdIn(List<Integer> hotelId);

    @Query("SELECT brib FROM BasicRoomInfoEntity AS brib " +
            "WHERE " +
            "(:style IS NULL OR brib.style=:style) AND " +
            "brib.hotelId in :hotelId AND " +
            "brib.guest >=:client AND " +
            "(:bed IS NULL OR brib.bed=:bed )AND " +
            "(:bath IS NULL OR brib.bathroom=:bath) AND " +
            "brib.price>=:minPrice AND " +
            "brib.price<=:maxPrice")
    List<BasicRoomInfoEntity>  listByRoomInfoFilterList(
            @Param("style") String style,
            @Param("hotelId") List<Integer> hotelId,
            @Param("client") Integer client,
            @Param("bed") Integer bed,
            @Param("bath") Integer bathroom,
            @Param("minPrice") Integer minPrice,
            @Param("maxPrice") Integer maxPrice
    );

}

