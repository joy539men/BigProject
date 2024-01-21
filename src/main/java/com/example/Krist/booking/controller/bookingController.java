package com.example.Krist.booking.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.Krist.booking.service.bookingService;
import com.example.Krist.booking.validate.bookingValidate;
import com.example.Krist.roomTable.dao.roomTableRepository;
import com.example.Krist.user.dao.userRepository;
import com.example.demo.model.bookingBean;
import com.example.demo.model.roomTableBean;

@Controller
public class bookingController {

	@Autowired
	roomTableRepository roomTableRepository;
	bookingService bookingService;
	userRepository userRepository;
	
	public bookingController (bookingService bookingService, userRepository userRepository) {
		
		this.bookingService = bookingService;
		this.userRepository = userRepository;
	}
	
	
	// 本方法送出新增roomPage資料的空白表單
	@GetMapping("/roomPageTest")
	public String showbookingForm(Model model) {
		bookingBean bean = new bookingBean();
		model.addAttribute("bookingBean", bean);
		return "roomPageTest";
	}

//	@PostMapping("/booking")
//	public String insertBooking(@ModelAttribute("bookingBean") bookingBean bookingBean, BindingResult bindingResult, HttpSession session) {
//	    new bookingValidate().validate(bookingBean, bindingResult);
//	    if (bindingResult.hasErrors()) {
//	        System.out.println("==================");
//	        List<ObjectError> list = bindingResult.getAllErrors();
//
//	        // 從Session中获取选定的roomId
//	        Integer selectedRoomId = (Integer) session.getAttribute("selectedRoomId");
//
//	        // 根據 selectedRoomId 從數據庫當中選定特定的 roomTableBean
//	        roomTableBean roomTable = roomTableRepository.findById(selectedRoomId).orElse(null);
//
//	        // 設置 bookingBean 的 roomTable 属性
//	        bookingBean.setRoomTable(roomTable);
//
//	        for (ObjectError error : list) {
//	            System.out.println("這邊訂房的地方有錯誤" + error);
//	        }
//	        System.out.println("=============");
//	        return "roomTable";
//	    }
//
//	    if (bookingBean.getBookingId() != null) {
//	        bookingService.update(bookingBean);
//	    }
//
//	    bookingBean.setBookingTime(new Date(System.currentTimeMillis()));
//	    bookingService.save(bookingBean);
//	    // 清除Session中的selectedRoomId，可选
//	    session.removeAttribute("selectedRoomId");
//
//	    return "book";
//	}
	
	
	// 使用 PostMapping 提交資料，並且綁定錯誤，再將所選擇的 roomId 加入到 該資料表當中
	@PostMapping("/booking")
	public String insertBooking(@ModelAttribute("bookingBean") bookingBean bookingBean, BindingResult bindingResult, HttpSession session) {
	    new bookingValidate().validate(bookingBean, bindingResult);
	    if (bindingResult.hasErrors()) {
	        // 若是有錯誤訊息則跳回 roomTable 頁面
	        return "roomTable";
	    }

	    // 從 session 選擇 selectedRoomId 
	    Integer selectedRoomId = (Integer) session.getAttribute("selectedRoomId");

	    // 根據 selectedRoomId 從資料庫獲取相對應 roomTableBean
	    roomTableBean roomTable = roomTableRepository.findById(selectedRoomId).orElse(null);

	    // 如果 roomTable 不為 null 設定 roomTable 進入資裡面
	    if (roomTable != null) {
	        // 設置 bookingBean 的 roomTable 屬性
	        bookingBean.setRoomTable(roomTable);

	        // 若是拿到的 bookingId 不為 null 則更新，就是因為沒有這個動作導致存不進資料庫！！！
	        if (bookingBean.getBookingId() != null) {
	            bookingService.update(bookingBean);
	        }

	        bookingBean.setBookingTime(new Date(System.currentTimeMillis()));
	        bookingService.save(bookingBean);

	        // 清除 Session中的selectedRoomId
	        session.removeAttribute("selectedRoomId");

	        return "book";
	    } else {
	        // 處理 roomTable 若為 null 則返回道 roomTable 的頁面
	        return "roomTable";
	    }
	}



	
		
	
}
