package com.example.roomTable.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.roomTableBean;

@Repository
public interface roomTableRepository extends CrudRepository<roomTableBean, Integer>{

}
