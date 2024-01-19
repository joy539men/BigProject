package com.example.Krist.booking.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Krist.booking.dao.bookingRepository;
import com.example.Krist.booking.service.bookingService;
import com.example.demo.model.bookingBean;
import com.example.demo.model.userBean;

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

	@Override
	public bookingBean createBooking(userBean user, bookingBean bean) {
		// 新建一個 booking 物件然後設定 user 進入裡面
		bookingBean booking = new bookingBean();
		booking.setUser(user);
		return bookingRepository.save(booking);
	}

}
