package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.customerBean;

public interface CustomerService {
	Optional<customerBean> getCustomerById(int id);
	List<customerBean> getCustomers();
	customerBean save(customerBean bean);
	customerBean update(customerBean bean);
	void deleteCustomerByPrimary(int key);
}
