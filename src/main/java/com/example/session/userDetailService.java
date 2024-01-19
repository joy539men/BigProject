package com.example.session;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.model.userBean;
import com.example.demo.user.dao.userRepository;

@Service
public class userDetailService implements UserDetailsService{

	@Autowired
	private userRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		userBean user = userRepository.findByUserName(userName);
		
		if(user == null) {
			throw new UsernameNotFoundException("找不到用戶");
		}
		
		return org.springframework.security.core.userdetails.User
				.withUsername(user.getUserName())
				.password(user.getPassword())
				.roles("USER")
				.build();

	}

}
