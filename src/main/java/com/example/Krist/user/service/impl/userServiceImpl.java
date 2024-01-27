package com.example.Krist.user.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Krist.user.dao.userRepository;
import com.example.Krist.user.service.userService;
import com.example.demo.model.userBean;

@Service
public class userServiceImpl implements userService{

	@Autowired
    private userRepository userRepository;
	

	
	@Override
	public Optional<userBean> getUserBeanById(int id) {
		// TODO Auto-generated method stub
		Optional<userBean> userOptional = userRepository.findById(id);
		
		// 如果有使用者資料，則找尋其相關的資料
		if(userOptional.isPresent()) {
//			userBean user = userOptional.get();
		    // 假設 userBean 中有一個關聯屬性 otherTable，表示與其他資料表的關聯
            // 如果有這樣的關聯，則透過這個關聯屬性取得其他相關的資料
            // 如果關聯的資料表是 OtherTable，可以使用 otherTableRepository 進行查詢
            // OtherTable otherData = otherTableRepository.findById(user.getOtherTable().getId()).orElse(null);
            // 將取得的其他相關資料設定到 user 中
			

            // 這邊以 user 的其他相關資料為例，實際根據你的資料表和關聯進行調整
            // user.setOtherData(otherData);
		}
		
		return userOptional;
	}

	@Override
	public List<userBean> getUserBean() {
		// TODO Auto-generated method stub
		 return (List<userBean>) userRepository.findAll();
	}

	@Override
	public userBean save(userBean bean) {
		// TODO Auto-generated method stub
		return userRepository.save(bean);
	}

	@Override
	public userBean update(userBean bean) {
		// TODO Auto-generated method stub
		return userRepository.save(bean);
	}

	// 取消使用此方法
//	public Optional<userBean> findByUsername(String userName){
//		return userRepository.findByUserNameOption(userName);
//	}

//	@Override
//	public Integer authenticateUser(String userName, String password) {
//		// TODO Auto-generated method stub
//		Integer userId = getUserIdByCredentials(userName, password);
//        return userId;
//	}

	@Override
	public Integer authenticateUser(String account, String password) {
		// TODO Auto-generated method stub
		userBean user = userRepository.findByAccountAndPassword(account, password);
		
		if(user != null) {
			return user.getUserId();
		}else {
			return null;
		}
	}



	@Override
	public Optional<userBean> findByUsername(String username) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public userBean findByAccount(String account) {
		// TODO Auto-generated method stub
		return userRepository.findByAccount(account);
	}

	@Override
	public userBean findByAccountAndPassword(String account, String password) {
		// TODO Auto-generated method stub
		return userRepository.findByUserNameAndPassword(account, password);
	}

	@Override
    public boolean existsEmail(String email) {
        return userRepository.existsByEmail(email);
    }
	
}
