package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.customerBean;
import com.example.demo.model.roomTableBean;

public interface roomTableService {
	Optional<roomTableBean> getroomTableBeanById(int id);
	List<roomTableBean> getroomTableBean();
	customerBean save(roomTableBean bean);
	customerBean update(roomTableBean bean);
}
