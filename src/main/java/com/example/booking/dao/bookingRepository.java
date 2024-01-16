package com.example.booking.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.bookingBean;

@Repository
public interface bookingRepository extends CrudRepository<bookingBean, Integer>{

}
