package com.example.backstage.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.bookingBean;
import com.example.demo.model.roomTableBean;

public interface OrderService_backstage {
	
	void save(bookingBean bookingBean);

	public List<bookingBean> findAll();

	Optional<bookingBean> findById(Integer uid);
	
	void deleteById(Integer id);
	
	List<bookingBean> searchDate(String checkingDate, String checkoutDate);

	List<bookingBean> findByRoomTableRoomId(Integer roomId);
	
	boolean hasOrderDuringCurrentDate(roomTableBean room);
	
}
