package com.example.backstage.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.userBean;

public interface UserRepository extends JpaRepository<userBean, Integer> {

	@Query("SELECT u FROM user u WHERE u.userName LIKE CONCAT('%',:search,'%')")
	List<String> findByAllLike(@Param("search") String search);
	
}
