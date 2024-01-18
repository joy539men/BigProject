package com.example.backstage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.backstage.service.UserService;
import com.example.demo.model.userBean;

@Controller
public class QureyAccountController {
	
	UserService userService;

	public QureyAccountController(UserService userService) {
		super();
		this.userService = userService;
	}

	// 會員帳號資料
	@GetMapping("/")
	public String getAllAccount(Model model) {
		List<userBean> beans = userService.findAll();
		model.addAttribute("users", beans);
		return "backstage/account";
	}

	// 模糊搜索
//	@GetMapping
//	public String search(@RequestParam String search,Model model) {
//		userService.findByAllLike(search);
//		return "backstage/account";
//	};
	
//	@GetMapping(value="/search")
//	public String dim(Model model,HttpServletRequest request) {
//		String name=request.getParameter("name");		//获取html页面搜索框的值
//		List<userBean> unit=userService.findByUsernameLike(name);	//在数据库中进行查询
//		//model.addAttribute("unit", unit);	//模板映射
//		return "redirect:/";
//	}
}
