package com.example.host.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import com.example.demo.model.roomTableBean;

public interface HostService {
	Iterable<roomTableBean> findAll();
	Optional<roomTableBean> findById(int id);
	Optional<roomTableBean> getroomTableBeanById(int id);
	List<roomTableBean> getroomTableBean();
	roomTableBean save(roomTableBean bean);
	roomTableBean update(roomTableBean bean);
	roomTableBean addRoomWithAmenities (roomTableBean room, Set<Integer> amenityIds);

}
