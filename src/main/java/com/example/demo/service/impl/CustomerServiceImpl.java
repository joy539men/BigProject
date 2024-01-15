package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CustomerRepository;
import com.example.demo.model.customerBean;
import com.example.demo.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	CustomerRepository custDao;
	
	@Override
	public List<customerBean> getCustomers() {
		// TODO Auto-generated method stub
		return (List<customerBean>) custDao.findAll();
	}

	@Override
	public customerBean save(customerBean bean) {
		// TODO Auto-generated method stub
		return custDao.save(bean);
	}

	@Override
	public customerBean update(customerBean bean) {
		// TODO Auto-generated method stub
		return custDao.save(bean);
	}

	@Override
	public void deleteCustomerByPrimary(int key) {
		// TODO Auto-generated method stub
		custDao.deleteById(key);
	}

	@Override
	public Optional<customerBean> getCustomerById(int id) {
		// TODO Auto-generated method stub
		return custDao.findById(id);
	}

}
