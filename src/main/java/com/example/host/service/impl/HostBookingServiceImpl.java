package com.example.host.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.bookingBean;
import com.example.host.dao.HostBookingRepository;
import com.example.host.service.HostBookingService;

@Service
public class HostBookingServiceImpl implements HostBookingService {

	@Autowired
	HostBookingRepository repository;
	
	@Override
	public Iterable<bookingBean> findAll() {
		return repository.findAll();
	}

	@Override
	public bookingBean save(bookingBean bean) {
		return repository.save(bean);
	}

	@Override
	public bookingBean update(bookingBean bean) {
		return null;
	}

}
