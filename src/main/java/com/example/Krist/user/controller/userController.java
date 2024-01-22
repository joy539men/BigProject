package com.example.Krist.user.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Krist.user.dao.userRepository;
import com.example.Krist.user.service.userService;
import com.example.demo.model.bookingBean;
import com.example.demo.model.userBean;



@Controller
public class userController {

	@Autowired
	userService userService;
	
	@Autowired
	userRepository userRepository;
	
	@GetMapping("/userLoginPage")
	public String userLoginPage() {
		return "login";
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
        
     }
	
	
	@GetMapping("/intoRegister")
	public String register(Model modle) {
		// 建立新的 bean
		modle.addAttribute("register", new userBean());
		return "registerKrist";
	}
	
	// 利用 POST 表單取得用戶傳輸的資料
	@PostMapping("/register")
	public String register(@ModelAttribute("register") userBean userBean,  Model model) {
	
		
		// 利用 messageDigest 進行加密
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			
			// 將原始碼轉換為哈希計算
			byte[] hashedByteds = messageDigest.digest(userBean.getPassword().getBytes());
			
			// 將字串轉換為十六位組進行哈希計算
			StringBuilder stringBuilder = new StringBuilder();
			for(byte b: hashedByteds) {
				stringBuilder.append(String.format("%02x", b));
			}
			
//			return stringBuilder.toString();
			userBean.setPassword(stringBuilder.toString());
			userRepository.save(userBean);
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "registerKrist";
		}
		
		
		
		
		return "index";
		
	}
}
