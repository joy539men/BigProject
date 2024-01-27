package com.example.backstage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.roomTableBean;

public interface RoomRepository_backstage extends JpaRepository<roomTableBean,Integer>{
//	SELECT room_id, ( 6371 * acos( cos( radians(24.19015959) ) * cos( radians( lat ) ) * cos( radians( lon ) - radians(120.5754135) ) + sin( radians(24.19015959) ) * sin( radians( lat ) ) ) ) AS distance FROM room_table HAVING distance < 25 ORDER BY distance
	@Query(value="SELECT lat, lon, file_path, title FROM room_table",nativeQuery = true)
	List<Map<String,Object>> roomMap();
	
}
