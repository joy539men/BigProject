//package com.example.Krist.user.controller;
//
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//import java.sql.Timestamp;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.example.Krist.user.dao.userRepository;
//import com.example.Krist.user.service.userService;
//import com.example.demo.model.userBean;
//
//@RestController
//public class userRsettController {
//
//	@Autowired
//	userService userService;
//
//	@Autowired
//	userRepository userRepository;
//
//	HttpSession session;
//
//	public userRsettController(userService userService, userRepository userRepository, HttpSession session) {
//		super();
//		this.userService = userService;
//		this.userRepository = userRepository;
//		this.session = session;
//	}
//
//	// 利用 POST 表單取得用戶傳輸的資料
//	// 裁切照片
//	@PostMapping("/register")
//	public ResponseEntity<String> register(@ModelAttribute("register") userBean userBean,  Model model,@RequestParam("multipartFile") MultipartFile multipartFile) {
////		Integer a = userBean.getUserId();
//		
//		if (!isEmailValid(userBean.getEmail())) {
//			model.addAttribute("error", "電子郵件格式不正確！");
//			ResponseEntity.ok("{\"redirectUrl\": \"/registerKrist/\"}");
//		}
//		
//		// 檢查電子郵件是否已存在
//		if (userRepository.existsByEmail(userBean.getEmail())) {
//			model.addAttribute("error", "電子郵件已被使用！");
//			ResponseEntity.ok("{\"redirectUrl\": \"/registerKrist/\"}");
//		}
//		
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
//			for(byte b: hashedByteds) {
//				stringBuilder.append(String.format("%02x", b));
//			}
//			
//			userBean.setPassword(stringBuilder.toString());
//			userService.save(userBean);
//			
//			// Handle the cropped image
//			   if (multipartFile != null && !multipartFile.isEmpty()) {
//			       Integer userId = userBean.getUserId(); // Assuming you have a userId in your UserBean
//			       String filePath = userService.saveFileTest(multipartFile, userId);
//			       userBean.setFilePath(filePath); // Assuming UserBean has a field for the file path
//			       userService.save(userBean);
//			   }else {
//				   userService.save(userBean);
//			   }
//			
//		} catch (NoSuchAlgorithmException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return ResponseEntity.ok("Registration fail");
//		}
//		System.out.println("OK");
//		userRepository.save(userBean);
//		return ResponseEntity.ok("{\"redirectUrl\": \"/pillowSurfing/\"}");
//		
//		
//		
//		
//	}
//
//	private boolean isEmailValid(String email) {
//		String emailRegex = "^[A-Za-z0-9+_.-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,6}$";
//		return email != null && email.matches(emailRegex);
//	}
//
//}
