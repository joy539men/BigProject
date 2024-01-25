package com.example.Krist.booking.service.impl;

import java.util.Collections;
import java.util.List;

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

	@Override
	public List<bookingBean> findAllByUser(userBean userId) {
		// TODO Auto-generated method stub
		return bookingRepository.findAllByUser(userId);
	}

	
//	@Override
//    public List<bookingBean> findAllByUserId(Integer  userId) {
//        if ( userId == null) {
//            // 用户未登录，可以返回空列表或者默认数据
//            return Collections.emptyList(); // 或者返回默认数据
//        } else {
//            // 用户已登录，正常进行查询
//            return bookingRepository.findAllByUserId( userId);
//        }
//    }

	

}
