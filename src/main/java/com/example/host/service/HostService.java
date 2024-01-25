package com.example.host.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.roomTableBean;

public interface HostService {
	Iterable<roomTableBean> findAll();
	Optional<roomTableBean> findById(int id);
	Optional<roomTableBean> getroomTableBeanById(int id);
	List<roomTableBean> getroomTableBean();
	roomTableBean save(roomTableBean bean);
	roomTableBean update(roomTableBean bean);
	roomTableBean addRoomWithAmenities (roomTableBean room, Set<Integer> amenityIds);
	roomTableBean getRoomWithAmenities(Integer roomId);
	roomTableBean updateRoomWithAmenities(Integer roomId, roomTableBean updatedRoom, Set<Integer> amenityIds);
	String saveFile(MultipartFile multipartFile);
	Map<String, String> convertAddress(String address);
	roomTableBean getRoomById(Integer roomId);
	void deleteById(Integer id);

}
