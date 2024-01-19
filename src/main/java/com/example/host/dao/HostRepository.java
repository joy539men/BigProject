package com.example.host.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.roomTableBean;

@Repository

public interface HostRepository extends CrudRepository<roomTableBean, Integer> {

	
}
