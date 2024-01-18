package com.example.backstage.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.backstage.service.UserService;
import com.example.demo.model.userBean;

@Controller
public class UserEditController {

	UserService userService;

//	@Autowired
	public UserEditController(UserService userService) {
		super();
		this.userService = userService;
	}

	// 傳送帳號編輯表單
	@GetMapping({ "/account_edit/{id}", "/account_info/{id}" })
	public String getAccountEditForm(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
//			UserBean ub = new UserBean();
//			model.addAttribute("userBean",ub);
		String view = "";
		if (request.getRequestURI().contains("/account_edit/")) {
			view = "backstage/account_edit";
		} else if (request.getRequestURI().contains("/account_info/")) {
			view = "backstage/account_info";
		}

		return view;
	}
	//編輯完成表單接收
	@PutMapping("/account_edit/UserUpdate/{id}")
	public String updateForm(@ModelAttribute userBean userBean,
			BindingResult result
			) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		userService.save(userBean);
		return "redirect:/ ";
	}
	@ModelAttribute
	public userBean getMember(@PathVariable Integer id, Model model) {
		userBean userBean = null;
		Optional<userBean> optional = userService.findById(id);
		if (optional.isPresent()) {
			userBean = optional.get();
			model.addAttribute("user_id", userBean.getUserId());
			System.out.println(userBean);
		}
		return userBean;
	}
}
