package com.example.backstage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.roomTableBean;

public interface RoomRepository_backstage extends JpaRepository<roomTableBean,Integer>{
	//SELECT *, ( 6371 * acos( cos( radians(25.043800) ) * cos( radians( lat )) * cos( radians( lon ) - radians(121.529305) ) + sin( radians(25.043800) ) * sin( radians( lat ) ) ) ) AS distance FROM room_table HAVING distance < 25 ORDER BY distance LIMIT 15
	@Query(value="SELECT *, ( 6371 * acos( cos( radians(:lat1) ) "
			+ "* cos( radians( lat )) * cos( radians( lon ) - radians(:lon1) ) + "
			+ "sin( radians(:lat1) ) * sin( radians( lat ) ) ) ) AS distance FROM"
			+ " room_table HAVING distance < :dis ORDER BY distance",nativeQuery = true)
	List<Map<String,Object>> roomMap(@Param("lat1") Double lat,@Param("lon1") Double lon,@Param("dis") Double dis);
	
}
