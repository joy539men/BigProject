package com.example.host.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.amenitiesBean;

@Repository

public interface AmenitiesRepository extends CrudRepository<amenitiesBean, Integer> {

	
}
