package com.example.backstage.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.backstage.service.UserService_backstage;
import com.example.backstage.service.Impl.MailService;
import com.example.demo.model.userBean;

@Controller
public class QureyAccountController_backstage {

	UserService_backstage userService;
	MailService mailService;

	public QureyAccountController_backstage(UserService_backstage userService,MailService mailService) {
		super();
		this.userService = userService;
		this.mailService = mailService;
	}

	// 會員帳號資料
	@GetMapping("/account")
	public String getAllAccount(Model model) {
		List<userBean> beans = userService.findAll();
		model.addAttribute("users", beans);
		return "backstage/account";
	}

	// 模糊搜尋
	@GetMapping("/backend/search")
	public String searchUser(Model model, HttpServletRequest request) {
		String search = request.getParameter("search"); 
		List<userBean> beans = userService.searchAll(search); 
		if(search.isEmpty()) {
			return "redirect:/account";
		}
		System.out.println(search);
		model.addAttribute("users", beans); 
		return "backstage/account";
	}
	
	@GetMapping("/sendEmail/{id}")
	public  String sendEmail(@PathVariable Integer id,Model model){
		userBean userBean = null;
		Optional<userBean> optional = userService.findById(id);
		if (optional.isPresent()) {
			userBean = optional.get();
			userBean.setStatus("禁止使用");
			userService.save(userBean);
			System.out.println(userBean);
		}
		String userEmail = userService.getEmailByUserId(id);
		String subject = "我是標題主旨";
		String content = "這裡是內容";
		mailService.sendEmail(userEmail, subject, content);
		return "redirect:/account";
	}
	
//	   @GetMapping("/backstage/login")
//	    public String login(HttpServletRequest request, Model model) {
//	        // 模拟用户登录，将用户信息存储在HttpServletRequest中
//	        userBean user = new userBean();
//	        user.setAccount("exampleUser");
//	        request.setAttribute("user", user);
//
//	        return "redirect:/roomTableGallery";
//	    }
}
