package com.example.backstage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.userBean;

public interface UserRepository_backstage extends JpaRepository<userBean, Integer> {
	
	@Query(value="SELECT * FROM user WHERE CONCAT(account,status,identity,registration_time) LIKE %:search%",nativeQuery = true)
	List<userBean> searchAll(@Param("search") String account);
	
	userBean findByuserName(String username);

}
