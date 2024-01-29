package com.example.Krist.booking.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.reviewBean;

@Repository
public interface reviewRepository extends JpaRepository<reviewBean, Integer>{

}
