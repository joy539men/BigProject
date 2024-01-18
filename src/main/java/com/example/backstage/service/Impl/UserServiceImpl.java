package com.example.backstage.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.backstage.dao.UserRepository;
import com.example.backstage.service.UserService;
import com.example.demo.model.userBean;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	private static Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	
	UserRepository userRepository;
	
//	@Autowired
	public UserServiceImpl(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}

	@Override
	public void save(userBean userBean) {
		userRepository.save(userBean);
		log.info("修改會員狀態功能之Sservice: 資料新增成功, UserBean=" + userBean);
	}

	@Override
	public List<userBean> findAll() {
		List<userBean> beans = userRepository.findAll();
		return beans;
	}

	@Override
	public Optional<userBean> findById(Integer userId) {
		Optional<userBean> optional = userRepository.findById(userId);
		return optional;
	}

	@Override
	public List<String> findByAllLike(String keyword) {
		System.out.println(keyword);
		List<String> searchResult = userRepository.findByAllLike(keyword);
		return searchResult;
	}


}
