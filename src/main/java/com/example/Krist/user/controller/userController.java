package com.example.Krist.user.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.Krist.user.dao.userRepository;
import com.example.Krist.user.service.userService;
import com.example.Krist.user.service.impl.userServiceImpl;
import com.example.demo.model.userBean;

@Controller
public class userController {
	@Autowired
	userService userService;

	@Autowired
	userRepository userRepository;
	
	@Autowired
	userServiceImpl userServiceImpl;

	// 登入的頁面
	@GetMapping("/login")
	public String userLoginPage(HttpSession session) {
		// 檢查 session 中是否有登入標誌
		Integer isLoggedIn = (Integer) session.getAttribute("userId");

        // 如果已經登入，導向到另一個頁面
        if (isLoggedIn != null) {
            return "indexLogout";
        }
		return "login";
	}

	// 登入的表單
	@PostMapping("/login")
	public String login(@RequestParam String account, @RequestParam String password, Model model, HttpSession session) {
		// 利用 Account 取得 user 的 userBean
		userBean user = userService.findByAccount(account);
		
		// 驗證密碼和 userId 不為空值
		if (user != null && PasswordHashing.verifyPassword(password, user.getPassword())) {
			  // 驗證成功，判斷是否是管理者
	        if ("admin123".equals(user.getAccount())) { 
	            // 如果是管理者，将管理员信息存储到 session
	            session.setAttribute("isAdmin", true);
	        }
			// 驗證成功，將 userId 存到 session 當中，記得加入 HttpSession
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userImg", user.getFilePath());
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
		session.removeAttribute("isAdmin");
		session.removeAttribute("userImg");
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

//	// 利用 POST 表單取得用戶傳輸的資料
//	@PostMapping("/register")
//	public String register(@ModelAttribute("register") userBean userBean, Model model) {
//			
//		// 驗證 email 格式
//		if (!isEmailValid(userBean.getEmail())) {
//			model.addAttribute("error", "電子郵件格式不正確！");
//			return "registerKrist";
//		}
//		
//		// 檢查電子郵件是否已存在
//		if (userRepository.existsByEmail(userBean.getEmail())) {
//			model.addAttribute("error", "電子郵件已被使用！");
//			return "registerKrist";
//		}
//
//		// 設定當前時間為註冊時間
//		userBean.setRegistrationTime(new Timestamp(System.currentTimeMillis()));
//
//		// 利用 messageDigest 進行加密
//		try {
//			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
//
//			// 將原始碼轉換為哈希計算
//			byte[] hashedByteds = messageDigest.digest(userBean.getPassword().getBytes());
//
//			// 將字串轉換為十六位組進行哈希計算
//			StringBuilder stringBuilder = new StringBuilder();
//			for (byte b : hashedByteds) {
//				stringBuilder.append(String.format("%02x", b));
//			}
//
////			return stringBuilder.toString();
//			userBean.setPassword(stringBuilder.toString());
//			userService.save(userBean);
//
//			MultipartFile multipartFile = userBean.getMultipartFile();
//			Integer userId = userBean.getUserId();
//			String filePath = userService.saveFileTest(multipartFile,userId);    //用saveFile把照片存到指定路徑，並回傳路徑
//			userBean.setFilePath(filePath); //path存進roomTableBean表單的filePath欄位
//			userService.save(userBean);
//			
//		} catch (NoSuchAlgorithmException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return "registerKrist";
//		}
//
//		// 保存用戶信息到數據庫
//		userRepository.save(userBean);
//		return "index";
//
//	}
	
	@GetMapping("/check-phone")
	@ResponseBody
	public Map<String, Boolean> checkPhoneExists(@RequestParam String phone) {
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("exists", userRepository.existsByPhone(phone));
	    return response;
	}


	private boolean isEmailValid(String email) {
		String emailRegex = "^[A-Za-z0-9+_.-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,6}$";
		return email != null && email.matches(emailRegex);
	}

	@GetMapping("/check-email")
	@ResponseBody
	public Map<String, Boolean> checkEmail(@RequestParam String email) {
		Map<String, Boolean> response = new HashMap<>();
		boolean exists = userServiceImpl.existsEmail(email);
		response.put("exists", exists);
		return response;
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
	
	//查看會員資料
    @GetMapping("/userProfile")
    public String getUserData(HttpSession session,Model model) {
        // 在主頁拿到 userId
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
        	userBean user = null;
        	Optional<userBean> optional = userService.getUserBeanById(userId);
    		// 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
    		if (optional.isPresent()) {
    			user = optional.get();
    			model.addAttribute("user", user);
    		}
        	
            return "userProfile"; 
        } else {
            // 若是資料庫沒有該資料，跳轉到 login 頁面
            return "redirect:/login";
        }
        
     }
    
    //會員資料 編輯表單
    @GetMapping("/userProfileEdit")
    public String editUserData(HttpSession session,Model model) {
        // 在主頁拿到 userId
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
        	userBean user = null;
        	Optional<userBean> optional = userService.getUserBeanById(userId);
    		// 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
    		if (optional.isPresent()) {
    			user = optional.get();
    			model.addAttribute("user", user);
    		}
        	
            return "userMod"; 
        } else {
            // 若是資料庫沒有該資料，跳轉到 login 頁面
            return "redirect:/login";
        }
        
     }
    
  //儲存更新後的會員資料
  	@PostMapping("/userModSave")
      public String editRoomSubmit(@ModelAttribute userBean updatedUser,HttpSession session, Model model) {
  		Integer userId = (Integer) session.getAttribute("userId");
        
  		
  		if (userId != null) {
        	userBean originalUser = null;
        	Optional<userBean> optional = userService.getUserBeanById(userId);
//    		// 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
    		if (optional.isPresent()) {
    			originalUser = optional.get();
    		}
    		
    		// 檢查新密碼是否已輸入並且兩次輸入是否一致
    	    if (StringUtils.hasText(updatedUser.getNewPassword()) && updatedUser.getNewPassword().equals(updatedUser.getConfirmPassword())) {
    	        // 加密新密碼並設置到原始用戶對象
    	        try {
    	            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
    	            byte[] hashedBytes = messageDigest.digest(updatedUser.getNewPassword().getBytes(StandardCharsets.UTF_8));
    	            StringBuilder stringBuilder = new StringBuilder();
    	            for (byte b : hashedBytes) {
    	                stringBuilder.append(String.format("%02x", b));
    	            }
    	            originalUser.setPassword(stringBuilder.toString());
    	        } catch (NoSuchAlgorithmException e) {
    	            // 密碼加密失敗，處理異常
    	            model.addAttribute("error", "密碼加密過程中發生錯誤。");
    	            return "userProfileEdit";
    	        }
    	    } else if (StringUtils.hasText(updatedUser.getNewPassword())) {
    	        // 新密碼和確認密碼不一致
    	        model.addAttribute("error", "新密碼和確認密碼不匹配。");
    	        return "userProfileEdit";
    	    }
        	
    		// Process the uploaded file
    	    MultipartFile multipartFile = updatedUser.getMultipartFile();
    	    String filePath;
    	    String originalPath =originalUser.getFilePath();

    	    if (multipartFile != null && !multipartFile.isEmpty()) {
    	        // If a new file is uploaded, save it and update the filePath
//    	        filePath = userService.saveFile(multipartFile);
    	    	filePath = userService.updateFile(multipartFile, originalPath,userId);
    	    } else {
    	        // If no new file is uploaded, use the original filePath
    	        filePath = originalUser.getFilePath();
    	    }
    	    updatedUser.setFilePath(filePath); //path存進roomTableBean表單的filePath欄位
    	    updatedUser.setAccount(originalUser.getAccount()); 
    	    updatedUser.setPassword(originalUser.getPassword()); 
    	    updatedUser.setRegistrationTime(new Timestamp(System.currentTimeMillis()));// 更新 registrationTime 為當前時間
    	    userService.updateUser(userId,updatedUser);
    	    //            return "index"; 
            return "index";
        } else {
            // 若是資料庫沒有該資料，跳轉到 login 頁面
            return "redirect:/login";
        }

  	    
      }
    
}