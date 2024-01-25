package com.example;


import javax.servlet.Filter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example",
		"com.example.demo.model", 
		"com.example.Krist",
		"com.example.Krist.webSocket", 
		"com.example.Krist.webSocket.controller", 
		"com.example.Krist.webSocket.model", 
		"com.example.Krist.webSocket.config",
		
		}) 
public class SpringBootCrudApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(SpringBootCrudApplication.class, args);
	}

	@Bean 
	FilterRegistrationBean<Filter>  hiddenHttpMethodFilter(){
		FilterRegistrationBean<Filter>  filterBean = new FilterRegistrationBean<>();
		filterBean.setFilter(new HiddenHttpMethodFilter());
		return filterBean;
	}
}
