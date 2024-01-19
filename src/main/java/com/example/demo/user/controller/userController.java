package com.example.demo.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.user.service.userService;

@Controller
public class userController {

	@Autowired
	userService userService;
	
	@GetMapping("/userLoginPage")
	public String userLoginPage() {
		return "Login";
	}
	
    @PostMapping("/userPostlogin")
    public String login(@RequestParam String userName, @RequestParam String password, HttpSession session) {
        Integer userId = userService.authenticateUser(userName, password);

        if (userId != null) {
            // 身份验证成功，将用户ID存储到session中
            session.setAttribute("userId", userId);
            return "redirect:/index"; // 重定向到主页或其他受保护的页面
        } else {
            // 身份验证失败，可以返回登录页面或其他处理逻辑
            return "Login"; // 假设存在名为 "login" 的登录页面
        }
    }
	
	@GetMapping("/logout")
    public String logout(HttpSession session) {
        // 用户注销，将session中的用户ID清除
        session.removeAttribute("userId");
        return "redirect:/login"; // 注销后重定向到登录页面
    }
	
	@GetMapping("/home")
    public String home(HttpSession session) {
        // 在主页中，你可以检查用户是否已经登录
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            // 用户已经登录，可以执行相应的操作
            return "home"; // 假设存在名为 "home" 的主页视图
        } else {
            // 用户未登录，重定向到登录页面
            return "redirect:/login";
        }
}}
