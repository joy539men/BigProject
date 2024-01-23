package com.example.Krist.booking.service;

import com.example.demo.model.bookingBean;
import com.example.demo.model.userBean;

public interface bookingService {
	
	bookingBean save (bookingBean bean);
	bookingBean update(bookingBean bean);
	void deleteById(Integer key);
	bookingBean createBooking (userBean user,  bookingBean bean);


}
