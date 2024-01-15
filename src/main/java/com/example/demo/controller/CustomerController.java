package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.CustomerRepository;
import com.example.demo.model.customerBean;

@Controller
public class CustomerController {

    private final CustomerRepository customerRepository;

    public CustomerController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }
    
    @GetMapping("/")
    public String mainPage() {
    	return "index";
    }

    @GetMapping("/getCustomers")
    public @ResponseBody List<customerBean> getCustomers() {
        // 使用 CustomerRepository 的 findAll 方法來取得所有客戶資料
    	customerRepository.findAll();
    	
        return (List<customerBean>)customerRepository.findAll();
    }
}

