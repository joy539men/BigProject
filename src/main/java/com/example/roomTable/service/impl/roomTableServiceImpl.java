package com.example.roomTable.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.customerBean;
import com.example.demo.model.roomTableBean;
import com.example.roomTable.dao.roomTableRepositoryTest;
import com.example.roomTable.service.roomTableService;

@Service
public class roomTableServiceImpl implements roomTableService{
	
	@Autowired
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
	public roomTableBean save(roomTableBean bean) {
		// TODO Auto-generated method stub
		return roomTableRepository.save(bean);
	}

	@Override
	public roomTableBean update(roomTableBean bean) {
		// TODO Auto-generated method stub
		return roomTableRepository.save(bean);
	}

	
	

	
}
