package com.example.backstage.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.bookingBean;

public interface OrderService_backstage {
	
	void save(bookingBean bookingBean);

	public List<bookingBean> findAll();

	Optional<bookingBean> findById(Integer uid);
	
	void deleteById(Integer id);
}
