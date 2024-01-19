package com.example.host.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.amenitiesBean;
import com.example.demo.model.roomTableBean;
import com.example.host.dao.AmenitiesRepository;
import com.example.host.dao.HostRepository;
import com.example.host.service.HostService;


@Service
public class HostServiceImpl implements HostService {
	
	@Autowired
	HostRepository hostRepository;
	
	 @Autowired
	 private AmenitiesRepository amenitiesRepository;

	@Override
	public Optional<roomTableBean> getroomTableBeanById(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public List<roomTableBean> getroomTableBean() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public roomTableBean save(roomTableBean bean) {
		return hostRepository.save(bean);
	}

	@Override
	public roomTableBean update(roomTableBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterable<roomTableBean> findAll() {
		return hostRepository.findAll();
	}

	@Override
	public Optional<roomTableBean> findById(int id) {
		return hostRepository.findById(id);
	}


   
    @Override
    public roomTableBean addRoomWithAmenities(roomTableBean room, Set<Integer> amenityIds) {
        Set<amenitiesBean> amenities = ((Collection<amenitiesBean>) amenitiesRepository.findAllById(amenityIds)).stream().collect(Collectors.toSet());
        room.setAmenities(amenities);

        return hostRepository.save(room);
    }
	

}
