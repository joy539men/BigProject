package com.example.backstage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.roomTableBean;

public interface RoomRepository_backstage extends JpaRepository<roomTableBean,Integer>{
	
	@Query(value="SELECT lat, lon, file_path FROM room_table",nativeQuery = true)
	List<Map<String,Object>> roomMap();
	
}
