package com.example.Krist.user.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.userBean;

public interface userService {
	Optional<userBean> getUserBeanById(int id);
	List<userBean> getUserBean();
	userBean save(userBean bean);
	userBean update(userBean bean);
	Optional<userBean> findByUsername(String username);
	Integer authenticateUser(String userName, String password);
	userBean findByUserNameAndPassword(String userName, String password);
}
