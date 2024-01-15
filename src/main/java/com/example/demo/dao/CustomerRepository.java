package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.customerBean;

public interface CustomerRepository extends CrudRepository<customerBean, Integer>{
	
}
