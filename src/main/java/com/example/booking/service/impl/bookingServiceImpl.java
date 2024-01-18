package com.example.booking.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.booking.dao.bookingRepository;
import com.example.booking.service.bookingService;
import com.example.demo.model.bookingBean;

@Service
public class bookingServiceImpl implements bookingService{

	@Autowired
	bookingRepository bookingRepository;
	
	@Override
	public bookingBean save(bookingBean bean) {
		// TODO Auto-generated method stub
		return bookingRepository.save(bean);
	}

	@Override
	public bookingBean update(bookingBean bean) {
		// TODO Auto-generated method stub
		return bookingRepository.save(bean);
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		bookingRepository.deleteById(id);
		
	}

}
