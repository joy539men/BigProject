package com.example.roomTable.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.model.customerBean;
import com.example.demo.model.roomTableBean;
import com.example.roomTable.dao.roomTableRepositoryTest;
import com.example.roomTable.service.roomTableService;

@Service
public class roomTableServiceImpl implements roomTableService{
	
	
	roomTableRepositoryTest roomTableRepository;

	@Override
	public Optional<roomTableBean> getroomTableBeanById(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public List<roomTableBean> getroomTableBean() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public customerBean save(roomTableBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public customerBean update(roomTableBean bean) {
		// TODO Auto-generated method stub
		return null;
	}
	

	
}
