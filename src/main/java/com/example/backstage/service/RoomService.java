package com.example.backstage.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.roomTableBean;

public interface RoomService {
	
	void save(roomTableBean roomBean);

	public List<roomTableBean> findAll();

	Optional<roomTableBean> findById(Integer uid);
}
