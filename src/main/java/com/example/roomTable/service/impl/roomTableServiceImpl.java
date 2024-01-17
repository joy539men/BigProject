package com.example.roomTable.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.dao.roomTableRepository;
import com.example.demo.model.roomTableBean;
import com.example.roomTable.service.roomTableService;

public class roomTableServiceImpl implements roomTableService{

	@Autowired
	roomTableRepository roomTableRepository;
	
	@Override
	public roomTableBean save(roomTableBean Bean) {
		// TODO Auto-generated method stub
		return roomTableRepository.save(Bean);
	}

	@Override
	public roomTableBean update(roomTableBean Bean) {
		// TODO Auto-generated method stub
		return roomTableRepository.save(Bean);
	}

}
