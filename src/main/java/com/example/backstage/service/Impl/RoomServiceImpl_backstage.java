package com.example.backstage.service.Impl;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.backstage.dao.RoomRepository_backstage;
import com.example.backstage.service.RoomService_backstage;
import com.example.demo.model.roomTableBean;

@Service
@Transactional
public class RoomServiceImpl_backstage implements RoomService_backstage {

	private static Logger log = LoggerFactory.getLogger(RoomServiceImpl_backstage.class);
	
	RoomRepository_backstage roomRepository;

//	@Autowired
	public RoomServiceImpl_backstage(RoomRepository_backstage roomRepository) {
		super();
		this.roomRepository = roomRepository;
	}

	@Override
	public void save(roomTableBean roomBean) {
		roomRepository.save(roomBean);
		log.info("修改房間狀態功能之Sservice: 資料新增成功, UserBean=" + roomBean);
	}

	@Override
	public List<roomTableBean> findAll() {
		List<roomTableBean> beans = roomRepository.findAll();
		return beans;
	}

	@Override
	public Optional<roomTableBean> findById(Integer roomId) {
		Optional<roomTableBean> optional = roomRepository.findById(roomId);
		return optional;
	}

	@Override
	public List<Map<String,Object>> roomMap(Double lat, Double lon,Double dis) {
		List<Map<String,Object>> roomMap = roomRepository.roomMap(lat,lon,dis);
		return roomMap;
	}


}
