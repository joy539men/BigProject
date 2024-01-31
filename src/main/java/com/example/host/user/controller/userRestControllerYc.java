package com.example.host.user.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.userBean;
import com.example.host.user.dao.userRepositoryYC;
import com.example.host.user.service.userServiceYC;

@RestController
public class userRestControllerYc {
	
	@Autowired
	userServiceYC userService;
	
	@Autowired
	userRepositoryYC userRepository;
	
	HttpSession session;
	
	
	
	public userRestControllerYc(userServiceYC userService, userRepositoryYC userRepository,
			HttpSession session) {
		super();
		this.userService = userService;
		this.userRepository = userRepository;
		this.session = session;
	}


	// 利用 POST 表單取得用戶傳輸的資料 
			//裁切照片
			@PostMapping("/registerYC")
			public ResponseEntity<String> register(@ModelAttribute("register") userBean userBean,  Model model,@RequestParam("multipartFile") MultipartFile multipartFile) {
//				Integer a = userBean.getUserId();
				
				userBean.setRegistrationTime(new Timestamp(System.currentTimeMillis()));
				
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
					
					userBean.setPassword(stringBuilder.toString());
					userService.save(userBean);
					
					// Handle the cropped image
					   if (multipartFile != null && !multipartFile.isEmpty()) {
					       Integer userId = userBean.getUserId(); // Assuming you have a userId in your UserBean
					       String filePath = userService.saveFileTest(multipartFile, userId);
					       userBean.setFilePath(filePath); // Assuming UserBean has a field for the file path
					       userService.save(userBean);
					   }else {
						   userService.save(userBean);
					   }
					
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return ResponseEntity.ok("Registration fail");
				}
				
				return ResponseEntity.ok("{\"redirectUrl\": \"/pillowSurfing/\"}");
				
			}
			
			

}
