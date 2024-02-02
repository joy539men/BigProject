//package com.example.backstage.service;
//
//import java.util.Arrays;
//import java.util.Collection;
//import java.util.List;
//import java.util.stream.Collectors;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import com.example.demo.model.userBean;
//
//public class MyUSer implements UserDetails {
//	
//	private final userBean userBean;
//
//	public MyUSer(com.example.demo.model.userBean userBean) {
//		super();
//		this.userBean = userBean;
//	}
//
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		 List<SimpleGrantedAuthority> authorities = 
//		            Arrays.stream(userBean.getAuthority().split(",")).map(
//		            SimpleGrantedAuthority::new).collect(Collectors.toList());
//		        return authorities;
//	}
//
//	@Override
//	public String getPassword() {
//		userBean.getPassword();
//		return null;
//	}
//
//	@Override
//	public String getUsername() {
//		userBean.getAccount();
//		return null;
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//	
//}
