//package com.example.backstage.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.example.backstage.dao.UserRepository_backstage;
//import com.example.demo.model.userBean;
//
//@Service
//public class MyUserDetailsService implements UserDetailsService {
//
//	@Autowired
//	private UserRepository_backstage userRepository;
//
//	@Override
//	public MyUSer loadUserByUsername(String username) throws UsernameNotFoundException {
//		 userBean memberPo = userRepository.findByuserName(username);
//	        return new MyUSer(memberPo);
//	}
//}
