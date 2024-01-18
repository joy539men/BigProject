package com.example.backstage.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.bookingBean;

public interface BookingRepository extends JpaRepository<bookingBean,Integer>{

}
