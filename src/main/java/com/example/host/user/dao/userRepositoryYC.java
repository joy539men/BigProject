package com.example.host.user.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.userBean;




public interface userRepositoryYC extends JpaRepository<userBean, Integer>{
//	Optional<userBean> findByUserName(String userName);
	
	userBean findByUserName(String userName);
	
	userBean findByUserNameAndPassword(String userName, String password);
	
	userBean findByAccount(String account);
	
	userBean findByAccountAndPassword(String account, String password);

}
