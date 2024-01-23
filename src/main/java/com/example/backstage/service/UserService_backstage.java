package com.example.backstage.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.userBean;

public interface UserService_backstage {
	
	void save(userBean userBean);

	public List<userBean> findAll();

	Optional<userBean> findById(Integer uid);
	
	List<userBean> searchAll(String account);

	String getEmailByUserId(Integer userId);

}
