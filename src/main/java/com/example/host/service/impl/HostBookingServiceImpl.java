package com.example.host.service.impl;

import java.util.List;
import java.util.Optional;

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
	public Iterable<bookingBean> findAllBookingsWithRoom(){
		return repository.findAllBookingsWithRoom();
	}

	@Override
	public bookingBean save(bookingBean bean) {
		return repository.save(bean);
	}

	@Override
	public bookingBean update(bookingBean bean) {
		return null;
	}

	@Override
	public Optional<bookingBean> findById(Integer bookingId) {
		return repository.findById(bookingId);
	}
	
	@Override
	public List<bookingBean> findAcceptedBookings() {
        return repository.findByStatus("已接受");
    }

	@Override
	public List<bookingBean> findUncheckBookings() {
		return repository.findByStatus("待確認");
	}

}
