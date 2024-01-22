package com.example.Krist.user.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	@GetMapping("/login")
	public String userLoginPage() {
		return "login";
	}
	
	
	 @PostMapping("/login")
	    public String login(@RequestParam String account, @RequestParam String password, Model model, HttpSession session) {
	        // 获取用户信息（示例中使用 userService）
	        userBean user = userService.findByAccount(account);

	        // 验证密码
	        if (user != null &&  PasswordHashing.verifyPassword(password, user.getPassword())) {
	            // 验证成功，将用户ID存储到session中
	            session.setAttribute("userId", user.getUserId());
	            return "index"; // 重定向到主页或其他受保护的页面
	        } else {
	            // 验证失败，返回登录页面或其他处理逻辑
	            return "login"; // 假设存在名为 "login" 的登录页面
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
	
	// 對密碼進行哈希加密
//    private String encodePassword(String rawPassword) {
//        try {
//            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
//            byte[] hashedBytes = messageDigest.digest(rawPassword.getBytes());
//            StringBuilder stringBuilder = new StringBuilder();
//            for (byte b : hashedBytes) {
//                stringBuilder.append(String.format("%02x", b));
//            }
//            return stringBuilder.toString();
//        } catch (NoSuchAlgorithmException e) {
//            throw new RuntimeException("Password encoding failed", e);
//        }
//    }
    
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

        // 将字节数组转换为十六进制字符串
        private static String bytesToHex(byte[] bytes) {
            StringBuilder result = new StringBuilder();
            for (byte b : bytes) {
                result.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
            }
            return result.toString();
        }

        // 验证密码
        public static boolean verifyPassword(String inputPassword, String hashedPassword) {
            String hashedInputPassword = hashPassword(inputPassword);
            return hashedInputPassword != null && hashedInputPassword.equals(hashedPassword);
        }
    }

	
//	// 驗證密碼
//    private boolean verifyPassword(String rawPassword, String hashedPassword) {
//        // 对用户输入的密码进行哈希运算
//        String hashedInputPassword = encodePassword(rawPassword);
//        // 将哈希后的用户输入密码与数据库中存储的哈希密码比较
//        return hashedInputPassword.equals(hashedPassword);
//    }
}
