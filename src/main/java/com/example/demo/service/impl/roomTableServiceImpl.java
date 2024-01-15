package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.roomTableRepository;
import com.example.demo.model.roomTableBean;

@Service
public class roomTableServiceImpl implements roomTableRepository{
	
	@Autowired
	roomTableRepository roomTableRepository;

	@Override
	public <S extends roomTableBean> S save(S entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends roomTableBean> Iterable<S> saveAll(Iterable<S> entities) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<roomTableBean> findById(Integer id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public boolean existsById(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Iterable<roomTableBean> findAll() {
		// TODO Auto-generated method stub
		return (Iterable<roomTableBean>) roomTableRepository.findAll();
	}

	@Override
	public Iterable<roomTableBean> findAllById(Iterable<Integer> ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(roomTableBean entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllById(Iterable<? extends Integer> ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll(Iterable<? extends roomTableBean> entities) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}
	
}
