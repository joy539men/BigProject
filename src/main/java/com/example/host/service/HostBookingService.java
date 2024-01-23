package com.example.host.service;

import com.example.demo.model.bookingBean;

public interface HostBookingService {
	Iterable<bookingBean> findAll() ;
	bookingBean save(bookingBean bean);
	bookingBean update(bookingBean bean);
}
