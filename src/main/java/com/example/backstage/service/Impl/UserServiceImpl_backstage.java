package com.example.backstage.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.backstage.dao.UserRepository_backstage;
import com.example.backstage.service.UserService_backstage;
import com.example.demo.model.userBean;

@Service
@Transactional
public class UserServiceImpl_backstage implements UserService_backstage {

	private static Logger log = LoggerFactory.getLogger(UserServiceImpl_backstage.class);

	UserRepository_backstage userRepository;

//	@Autowired
	public UserServiceImpl_backstage(UserRepository_backstage userRepository) {
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
	public List<userBean> searchAll(String account) {
		List<userBean> beans = userRepository.searchAll(account);
		return beans;
	}

	@Override
	public String getEmailByUserId(Integer userId) {
		Optional<userBean> user = userRepository.findById(userId);
//		System.out.println(userId);
//		System.out.println(user.get().getUserId());
		return user.get().getEmail();
	}

}
