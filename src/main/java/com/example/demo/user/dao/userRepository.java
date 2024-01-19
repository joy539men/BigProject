package com.example.demo.user.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.userBean;


public interface userRepository extends JpaRepository<userBean, Integer>{
	Optional<userBean> findByUserName(String userName);

}
