package com.example.booking.controller;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.booking.service.bookingService;
import com.example.booking.validate.bookingValidate;
import com.example.demo.model.bookingBean;
import com.example.demo.model.userBean;
import com.example.demo.user.dao.userRepository;

@Controller
public class bookingController {

	bookingService bookingService;
	userRepository userRepository;
	
	public bookingController (bookingService bookingService) {
		
		this.bookingService = bookingService;
	}
	
	
	// 本方法送出新增Customer資料的空白表單
	@GetMapping("/roomPageTest")
	public String showbookingForm(Model model) {
		bookingBean bean = new bookingBean();
		model.addAttribute("bookingBean", bean);
		return "/roomPageTest";
	}

	// 新增訂單
	@PostMapping("/booking")
	public String insertBooking (@ModelAttribute("bookingBean") bookingBean bookingBean, BindingResult bindingResult) {
		new bookingValidate().validate(bookingBean, bindingResult);
		if(bindingResult.hasErrors()) {
			System.out.println("==================");
			List<ObjectError> list = bindingResult.getAllErrors();
			for(ObjectError error : list) {
				System.out.println("有錯誤" + error);
			}
			System.out.println("=============");
			return "roomTable";
		}
		
		if(bookingBean.getBookingId() != null) {
			bookingService.update(bookingBean);
		}
		
		bookingBean.setBookingTime(new Date(System.currentTimeMillis()));
		bookingService.save(bookingBean);
		
		return "book";
		
	}
	
	
	// 設定訂單，並且使用 userName 去取得 id 值並且跳轉到下一個頁面。
	@PostMapping("/createBook")
	public String createBook (String userName,  Model model) {
		Optional<userBean> userOptional = userRepository.findByUserName(userName);
		 if (userOptional.isPresent()) {
	            userBean user = userOptional.get();
	            
	            bookingBean booking = new bookingBean();
	            booking.setBookingId(user.getUserId());
	            
	            bookingService.save(booking);
		 }

		return "book";
		
	}
		
	
}
