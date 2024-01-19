package com.example.demo.user.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.userBean;

@Repository
public interface userRepository extends CrudRepository<userBean, Integer>{

}
