package com.example.backstage.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.backstage.dao.RoomRepository;
import com.example.backstage.service.RoomService;
import com.example.demo.model.roomTableBean;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {

	private static Logger log = LoggerFactory.getLogger(RoomServiceImpl.class);
	
	RoomRepository roomRepository;

//	@Autowired
	public RoomServiceImpl(RoomRepository roomRepository) {
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

}
