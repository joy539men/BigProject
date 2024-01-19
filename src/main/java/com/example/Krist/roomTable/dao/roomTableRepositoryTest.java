package com.example.Krist.roomTable.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.roomTableBean;

@Repository
public interface roomTableRepositoryTest extends CrudRepository<roomTableBean, Integer>{

}
