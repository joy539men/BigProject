package com.example.backstage.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.backstage.service.UserService_backstage;
import com.example.backstage.service.Impl.MailService;
import com.example.demo.model.userBean;

@Controller
@RequestMapping("/admin")
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
			return "redirect:/admin/account";
		}
		System.out.println(search);
		model.addAttribute("users", beans); 
		return "backstage/account";
	}
	
	//發送Email
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
		String subject = "PillowSurfing 重要訊息通知!!!";
		String content = "親愛的會員您好~ 您的PillowSurfing會員帳號已被"+'"'+"禁止使用"+'"'+"，請聯繫客服人員!" ;
		mailService.sendEmail(userEmail, subject, content);
		return "redirect:/admin/account";
	}
	
	@GetMapping("/backstage/logout")
	public String logout(HttpSession session) {
		// 登出的時候，要註銷 session 然後將其跳轉到登入畫面
		session.removeAttribute("userId");
		session.removeAttribute("isAdmin");
		return "redirect:/login";
	}
}
