package com.example.Krist.user.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Krist.user.dao.userRepository;
import com.example.Krist.user.service.userService;
import com.example.demo.model.userBean;

@Controller
public class userController {
	
	

	@Autowired
	userService userService;
	
	@Autowired
	userRepository userRepository;
	
	// 登入的頁面
	@GetMapping("/login")
	public String userLoginPage() {
		return "login";
	}
	
	// 登入的表單
	 @PostMapping("/login")
	    public String login(@RequestParam String account, @RequestParam String password, Model model, HttpSession session) {
	        // 利用 Account 取得 user 的 userBean
	        userBean user = userService.findByAccount(account);

	        // 驗證密碼和 userId 不為空值
	        if (user != null &&  PasswordHashing.verifyPassword(password, user.getPassword())) {
	            // 驗證成功，將 userId 存到 session 當中，記得加入 HttpSession
	            session.setAttribute("userId", user.getUserId());
	            return "indexLogout"; 
	        } else {
	            // 驗證失敗
	            return "login";
	        }
	    }
	
	
	
	
//    @PostMapping("/login")
//    public String login(@RequestParam String password,@RequestParam  String account,  HttpSession session) {
//    	
//    	userBean storedUser = userRepository.findByAccount(account);
//        Integer userId = userService.authenticateUser(account, password);
//
//        if (userId != null && verifyPassword(password, storedUser.getPassword())) {
//            // 身份验证成功，将用户ID存储到session中
//        	
//            session.setAttribute("userId", userId);
//            return "redirect:/index"; // 重定向到主页或其他受保护的页面
//        } else {
//            // 身份验证失败，可以返回登录页面或其他处理逻辑
//            return "login"; // 假设存在名为 "login" 的登录页面
//        }
//    }
	
	@GetMapping("/logout")
    public String logout(HttpSession session) {
        // 登出的時候，要註銷 session 然後將其跳轉到登入畫面
        session.removeAttribute("userId");
        return "redirect:/login"; 
    }
	
	@GetMapping("/home")
    public String home(HttpSession session) {
        // 在主頁拿到 userId
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            // 用戶登入跳轉 home
            return "home"; 
        } else {
            // 若是資料庫沒有該資料，跳轉到 login 頁面
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
	
    
	// 驗證密碼的方法
    public class PasswordHashing {

        // 生成哈希值
        public static String hashPassword(String password) {
            try {
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] hashedBytes = md.digest(password.getBytes());
                return bytesToHex(hashedBytes);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
                return null;
            }
        }

        // 轉換為十六進位
        private static String bytesToHex(byte[] bytes) {
            StringBuilder result = new StringBuilder();
            for (byte b : bytes) {
                result.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
            }
            return result.toString();
        }

        // 驗證密碼的方法
        public static boolean verifyPassword(String inputPassword, String hashedPassword) {
            String hashedInputPassword = hashPassword(inputPassword);
            return hashedInputPassword != null && hashedInputPassword.equals(hashedPassword);
        }
    }
}
