package com.example.Krist.booking.controller;


import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@Autowired
	bookingService bookingService;
	
	@Autowired
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
	
	
	// 更新版本
	// 使用 PostMapping 提交資料，並且綁定錯誤，再將所選擇的 roomId 加入到 該資料表當中
	@PostMapping("/booking")
	public String insertBooking(@ModelAttribute("bookingBean") bookingBean bookingBean, BindingResult bindingResult, HttpSession session, Model model) {
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
	        bookingBean.setUuid(UUID.randomUUID());
	        bookingService.save(bookingBean);
	        
	        // 清除 Session中的selectedRoomId
	        session.removeAttribute("selectedRoomId");
	        
	        // 將計算機金額加入 Model 當中
	        double amount = calculateAmountLogic(
	        	    new SimpleDateFormat("yyyy-MM-dd").format(bookingBean.getCheckinDate()),
	        	    new SimpleDateFormat("yyyy-MM-dd").format(bookingBean.getCheckoutDate()),
	        	    bookingBean.getGuest()
	        	);
	        model.addAttribute("amount", amount);
	        model.addAttribute("booking", bookingBean);
	        model.addAttribute("roomDetail", roomTable);
	        
	        bookingBean.setTotalPrice((int) amount);

	        return "book";
	    } else {
	        // 處理 roomTable 若為 null 則返回道 roomTable 的頁面
	        return "roomTable";
	    }
	}

	
	// 使用 PostMapping 提交資料，並且綁定錯誤，再將所選擇的 roomId 加入到 該資料表當中
//	@PostMapping("/booking")
//	public String insertBooking(@ModelAttribute("bookingBean") bookingBean bookingBean, BindingResult bindingResult, HttpSession session) {
//	    new bookingValidate().validate(bookingBean, bindingResult);
//	    if (bindingResult.hasErrors()) {
//	        // 若是有錯誤訊息則跳回 roomTable 頁面
//	        return "roomTable";
//	    }
//	    
//	    
//
//	    // 從 session 選擇 selectedRoomId 
//	    Integer selectedRoomId = (Integer) session.getAttribute("selectedRoomId");
//
//	    // 根據 selectedRoomId 從資料庫獲取相對應 roomTableBean
//	    roomTableBean roomTable = roomTableRepository.findById(selectedRoomId).orElse(null);
//
//	    // 如果 roomTable 不為 null 設定 roomTable 進入資裡面
//	    if (roomTable != null) {
//	        // 設置 bookingBean 的 roomTable 屬性
//	        bookingBean.setRoomTable(roomTable);
//
//	        // 若是拿到的 bookingId 不為 null 則更新，就是因為沒有這個動作導致存不進資料庫！！！
//	        if (bookingBean.getBookingId() != null) {
//	            bookingService.update(bookingBean);
//	        }
//
//	        bookingBean.setBookingTime(new Date(System.currentTimeMillis()));
//	        bookingService.save(bookingBean);
//
//	        // 清除 Session中的selectedRoomId
//	        session.removeAttribute("selectedRoomId");
//
//	        return "book";
//	    } else {
//	        // 處理 roomTable 若為 null 則返回道 roomTable 的頁面
//	        return "roomTable";
//	    }
//	}
	
	
	// 使用 Ajax 進行運算，其中需要起始日期和結束日期，來有旅客去進行相乘
	@GetMapping("/calculateAmount")
	@ResponseBody // 就是這個鬼東西搞了我整個晚上，因為在這邊 controller 只會回傳視圖，但現在要回傳 JSON 格式的話需要加上 @ResponseBody 的註解，這樣才能實現 AJAX
	public Map<String, Double> calculateAmount(
								  
								  @RequestParam("checkinDate") String checkinDate,
	                              @RequestParam("checkoutDate") String checkoutDate,
	                              @RequestParam("guest") int guest,
	                              Model model) {
	    // 這邊進行金額的計算
	    double amount = calculateAmountLogic(checkinDate, checkoutDate, guest);

	    

	    // 將計算金額放入 Map 當中
	    Map<String, Double> response = new HashMap<>();
	    response.put("amount", amount);
	    
	    // 返回數值
	    return response;
	}
	
	private double calculateAmountLogic(String checkinDate, String checkoutDate, int guest) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	        // 字串日期軟換為 Date
	        Date checkinSqlDate = new Date(dateFormat.parse(checkinDate).getTime());
	        Date checkoutSqlDate = new Date(dateFormat.parse(checkoutDate).getTime());

	        // 計算入住天數
	        long diff = checkoutSqlDate.getTime() - checkinSqlDate.getTime();
	        int stayDuration = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

	        // 這邊使用簡單 100 元
	        double nightlyRate = 100;

	        // 計算總金額
	        return nightlyRate * stayDuration * guest;
	    } catch (ParseException e) {
	        e.printStackTrace();
	        return 0;
	    }
	}

	
	
	// 過時版本 ajax 技術
//	@GetMapping("/booking/calculateAmount")
//	@ResponseBody
//	public String calculateAmount(@RequestParam("checkinDate") String checkinDate,
//	                              @RequestParam("checkoutDate") String checkoutDate,
//	                              @RequestParam("guest") int guest) {
//	    // 在这里添加计算总金额的逻辑，例如根据日期范围和人数计算金额
//	    double amount = calculateAmountLogic(checkinDate, checkoutDate, guest);
//
//	    // 返回计算结果，这里假设返回的是字符串，你可以根据实际情况返回其他格式的数据
//	    return String.valueOf(amount);
//	}
//
//	private double calculateAmountLogic(String checkinDate, String checkoutDate, int guest) {
//	    // 这里添加你的计算逻辑，计算总金额
//	    // 可以根据入住日期、退房日期和人数等信息进行计算
//	    // 这里只是一个简单的示例，具体逻辑需要根据你的业务需求来实现
//	    // 假设计算逻辑为入住天数 * 人数 * 每人每晚费用为 100 TWD
//	    return 100 * getStayDuration(checkinDate, checkoutDate) * guest;
//	}
//
//	private int getStayDuration(String checkinDate, String checkoutDate) {
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	    try {
//	        java.util.Date checkin = dateFormat.parse(checkinDate);
//	        java.util.Date checkout = dateFormat.parse(checkoutDate);
//
//	        // 转换为 java.sql.Date 类型
//	        Date checkinSqlDate = new Date(checkin.getTime());
//	        Date checkoutSqlDate = new Date(checkout.getTime());
//
//	        // 计算入住天数，这里只是简单示例
//	        long diff = checkoutSqlDate.getTime() - checkinSqlDate.getTime();
//	        return (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
//	    } catch (ParseException e) {
//	        e.printStackTrace();
//	        return 0;
//	    }
//	}





	
		
	
}
