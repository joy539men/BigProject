package com.example.Krist.booking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.bookingBean;
import com.example.demo.model.userBean;

@Repository
public interface bookingRepository extends JpaRepository<bookingBean, Integer> {
    List<bookingBean> findAllByUser(userBean userId);
}

