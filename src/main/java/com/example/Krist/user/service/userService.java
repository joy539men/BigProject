package com.example.Krist.user.service;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.userBean;

public interface userService {
	Optional<userBean> getUserBeanById(int id);
	List<userBean> getUserBean();
	userBean save(userBean bean);
	userBean update(userBean bean);
	Optional<userBean> findByUsername(String username);
	Integer authenticateUser(String account, String password);
	userBean findByAccountAndPassword(String account, String password);
	userBean findByAccount(String account);
	Boolean existsByPhone(String phone);
	boolean existsEmail(String email);
	Optional<userBean> findById(Integer userId);
		
	String saveFile(MultipartFile multipartFile);
	userBean updateUser(Integer userId, userBean updateUser);
	String saveFileTest(MultipartFile multipartFile, Integer userId);
	String updateFile(MultipartFile multipartFile, String originalFilePath, Integer userId);
}
