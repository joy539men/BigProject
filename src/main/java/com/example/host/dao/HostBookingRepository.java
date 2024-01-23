package com.example.host.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.bookingBean;

public interface HostBookingRepository extends CrudRepository<bookingBean, Integer> {

}
