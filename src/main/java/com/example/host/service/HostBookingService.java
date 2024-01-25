package com.example.host.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.model.bookingBean;

@Service
public interface HostBookingService {
	Iterable<bookingBean> findAll() ;
	Iterable<bookingBean> findAllBookingsWithRoom();
	bookingBean save(bookingBean bean);
	bookingBean update(bookingBean bean);
	Optional<bookingBean> findById(Integer bookingId);
	List<bookingBean> findAcceptedBookings();
	List<bookingBean> findUncheckBookings();
	
}
