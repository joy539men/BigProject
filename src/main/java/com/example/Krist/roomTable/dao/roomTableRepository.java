package com.example.Krist.roomTable.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.roomTableBean;

@Repository
public interface roomTableRepository extends CrudRepository<roomTableBean, Integer>{
    List<roomTableBean> findAll();

    List<roomTableBean> findByAddress(@Param("address") String address);

}
