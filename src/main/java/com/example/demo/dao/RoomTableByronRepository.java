package com.example.demo.dao;

import com.example.demo.model.BasicRoomInfoEntity;
import com.example.demo.model.roomTableBean;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

public interface RoomTableByronRepository extends CrudRepository<roomTableBean, Integer> {

    List<roomTableBean> findAll();

    List<roomTableBean> findByAddress(@Param("address") String address);
    
    
    @Query("SELECT brib FROM roomTableBean AS brib " +
            "WHERE " +
            "(:address IS NULL OR brib.address=:address) AND " +
            "(:style IS NULL OR brib.style=:style) AND " +
            "brib.guestMax >=:client AND " +
            "(:bed IS NULL OR brib.bedNum=:bed )AND " +
            "(:bath IS NULL OR brib.bathroom=:bath) AND " +
            "(:startDate IS NULL OR brib.openDate >=:startDate) AND " +
            "(:endDate IS NULL OR brib.openDate <=:endDate) AND " +
            "brib.price>=:minPrice AND " +
            "brib.price<=:maxPrice")
    List<roomTableBean>  listByRoomInfoFilterList(
    		@Param("address") String address,
            @Param("style") String style,
            @Param("client") Integer client,
            @Param("bed") Integer bed,
            @Param("bath") Integer bathroom,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate,
            @Param("minPrice") Integer minPrice,
            @Param("maxPrice") Integer maxPrice
    );
    

//    @Query("FROM RoomTableBean AS rtb WHERE rtb.style=:style AND ")
//    public List<RoomTableBean>  listByRoomFilterList(@Param("style") String style,);
}
