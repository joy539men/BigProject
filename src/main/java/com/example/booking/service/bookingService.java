package com.example.booking.service;

import com.example.demo.model.bookingBean;

public interface bookingService {
	
	bookingBean save (bookingBean bean);
	bookingBean update(bookingBean bean);
	void deleteById(Integer key);

}
