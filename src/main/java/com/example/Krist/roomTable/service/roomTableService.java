package com.example.Krist.roomTable.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.roomTableBean;

public interface roomTableService {
	Optional<roomTableBean> getroomTableBeanById(int id);
	List<roomTableBean> getroomTableBean();
	roomTableBean save(roomTableBean bean);
	roomTableBean update(roomTableBean bean);
}
