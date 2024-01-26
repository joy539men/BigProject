package com.example.Krist.booking.controller;


import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.Krist.booking.service.bookingService;
import com.example.Krist.booking.validate.bookingValidate;
import com.example.Krist.roomTable.dao.roomTableRepository;
import com.example.Krist.user.dao.userRepository;
import com.example.demo.model.bookingBean;
import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;

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
	    Integer night = (Integer) session.getAttribute("night");
	    Integer selecteduserId = (Integer) session.getAttribute("userId");

	    // 根據 selectedRoomId 從資料庫獲取相對應 roomTableBean
	    roomTableBean roomTable = roomTableRepository.findById(selectedRoomId).orElse(null);
	    userBean user = userRepository.findById(selecteduserId).orElse(null);

	    // 如果 roomTable 不為 null 設定 roomTable 進入資裡面
	    if (roomTable != null && user != null) {
	        // 設置 bookingBean 的 roomTable 屬性
	        bookingBean.setRoomTable(roomTable);
	        bookingBean.setUser(user);
	        // 若是拿到的 bookingId 不為 null 則更新，就是因為沒有這個動作導致存不進資料庫！！！
	        if (bookingBean.getBookingId() != null) {
	            bookingService.update(bookingBean);
	        }

	        bookingBean.setStatus("待確認");
	        bookingBean.setBookingTime(new Date(System.currentTimeMillis()));
	        bookingBean.setUuid(UUID.randomUUID());
//	        bookingService.save(bookingBean);
	        
	       
	        
	        // 將計算機金額加入 Model 當中
	        double amount = calculateAmountLogic(
	        	    new SimpleDateFormat("yyyy-MM-dd").format(bookingBean.getCheckinDate()),
	        	    new SimpleDateFormat("yyyy-MM-dd").format(bookingBean.getCheckoutDate()),
	        	    bookingBean.getGuest(),
	        	    session
	        	);
	        
	        // 將幾個晚上也設定進入 bookingBean
	        bookingBean.setNight(night);
	        bookingBean.setTotalPrice((int) Math.round(amount));
	        
	        bookingService.save(bookingBean);
	        model.addAttribute("amount", amount);
	        model.addAttribute("booking", bookingBean);
	        model.addAttribute("roomDetail", roomTable);
	        
	        
	        
	        bookingBean.setTotalPrice((int) amount);
	        
	     // 清除 Session中的selectedRoomId *** 記得這個放最後面，不然前面會抓不到 session!!!!!!
	        session.removeAttribute("selectedRoomId");
	        session.removeAttribute("night");

	        return "book";
	    } else {
	        // 處理 roomTable 若為 null 則返回道 roomTable 的頁面
	        return "roomTable";
	    }
	}

	
	
	// 使用 Ajax 進行運算，其中需要起始日期和結束日期，來有旅客去進行相乘
	@GetMapping("/calculateAmount")
	@ResponseBody // 就是這個鬼東西搞了我整個晚上，因為在這邊 controller 只會回傳視圖，但現在要回傳 JSON 格式的話需要加上 @ResponseBody 的註解，這樣才能實現 AJAX
	public Map<String, Double> calculateAmount(
								  HttpSession session,
								  @RequestParam("checkinDate") String checkinDate,
	                              @RequestParam("checkoutDate") String checkoutDate,
	                              @RequestParam("guest") int guest,
	                              Model model) {
	    // 這邊進行金額的計算
	    double amount = calculateAmountLogic(checkinDate, checkoutDate, guest, session);

	    

	    // 將計算金額放入 Map 當中
	    Map<String, Double> response = new HashMap<>();
	    response.put("amount", amount);
	    
	    // 返回數值
	    return response;
	}
	
	private double calculateAmountLogic(String checkinDate, String checkoutDate, int guest, HttpSession session) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	        // 字串日期軟換為 Date，記得要使用 new Data(dataFormat.parse(checkinDate).getTime()); 方法
	        Date checkinSqlDate = new Date(dateFormat.parse(checkinDate).getTime());
	        Date checkoutSqlDate = new Date(dateFormat.parse(checkoutDate).getTime());

	        // 計算入住天數
	        long diff = checkoutSqlDate.getTime() - checkinSqlDate.getTime();
	        int stayDuration = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

	        // 這邊使用 session 抓取各個房間的價位去進行計算，先由 selectedRoomId 去取得 session 再由 repository 去抓取 Id 然後取得 roomTable 後拿到價錢
	        Integer selectedRoomId = (Integer) session.getAttribute("selectedRoomId");
	        session.setAttribute("night", stayDuration);
	        
	        // 驗證 selectedRoomId 是否為 null
	        if (selectedRoomId == null) {
	        	// 處理 selectedRoomId 為 null 的情況，例如返回到合適的頁面
	        	return 0;  // 或者您可以根據實際需求進行其他處理
	        }
	        
	        
	        roomTableBean roomTable = roomTableRepository.findById(selectedRoomId).orElse(null);
	     
	        
	        double nightlyRate = roomTable.getPrice();

	        // 計算總金額
	        return nightlyRate * stayDuration * guest;
	    } catch (ParseException e) {
	        e.printStackTrace();
	        return 0;
	    }
	}	
	
//	@GetMapping("/bookTrip")
//	public String bookTrip(Model model, HttpSession session) {
//	    Integer user = (Integer) session.getAttribute("userId");
//
//	    List<bookingBean> bookRoomList = (List<bookingBean>) bookingService.findAllByUserId(user);
//	    
//	    if (bookRoomList.isEmpty()) {
//	        // 不存在匹配的记录，触发错误处理
//	        return "index";
//	    }
//
//	    model.addAttribute("bookTripRoomList", bookRoomList);
//	    return "bookTrip";
//	}
	
	// bookTrip 備份資料 
//	@GetMapping("/bookTrip")
//	public String bookTrip(Model model, HttpSession session) {
//	    Integer userId = (Integer) session.getAttribute("userId");
//
//	    userBean userBean = userRepository.findById(userId).orElse(null);
//	    // 檢查用戶是否登入
//	    if (userId != null) {
//	        // 用戶有登入資料則進行查詢
//	        List<bookingBean> bookRoomList = bookingService.findAllByUser(userBean);
//	        model.addAttribute("bookTripRoomList", bookRoomList);
//	        return "bookTrip";
//	    } else {
//	        // 用戶為登入重新轉向
//	        return "redirect:/login";  // 錯誤的話重新導入其他路徑
//	    }
//	}
	
	
	@GetMapping("/bookTrip")
	public String bookTrip(Model model, HttpSession session) {
	    Integer userId = (Integer) session.getAttribute("userId");
	    
	    userBean userBean = userRepository.findById(userId).orElse(null);
	    // 檢查用戶是否登入
	    if (userId != null) {
	        // 用戶有登入資料則進行查詢
	        List<bookingBean> bookRoomList = bookingService.findAllByUser(userBean);
	        List<roomTableBean> roomList = new ArrayList<>();
	        for (bookingBean booking : bookRoomList) {
	            roomList.add(booking.getRoomTable());
	        }
	        
	        List<Map<String, Object>> combinedList = new ArrayList<>();
	        for (bookingBean booking : bookRoomList) {
	            Map<String, Object> itemMap = new HashMap<>();
	            itemMap.put("id", booking.getBookingId());
	            itemMap.put("title", booking.getRoomTable().getTitle());
	            itemMap.put("description", booking.getRoomTable().getDescription());
	            itemMap.put("filePath", booking.getRoomTable().getFilePath());
	            itemMap.put("roomNum", booking.getRoomTable().getRoomNum());
	            itemMap.put("guest", booking.getGuest());
	            itemMap.put("address", booking.getRoomTable().getAddress());
	            itemMap.put("uuid", booking.getUuid());
	            itemMap.put("bookingTime", booking.getBookingTime());
	            itemMap.put("night", booking.getNight());
	            itemMap.put("totalPrice", booking.getTotalPrice());
	            itemMap.put("price", booking.getRoomTable().getPrice());
	            itemMap.put("bookingTime", booking.getBookingTime());
	            combinedList.add(itemMap);
	        }
	        model.addAttribute("userId",userId);
	        model.addAttribute("combinedList", combinedList);
	        model.addAttribute("bookTripRoomList", bookRoomList);
	        model.addAttribute("roomList", roomList);
	        return "bookTrip";
	    } else {
	        // 用戶為登入重新轉向
	        return "redirect:/login.jsp";  // 錯誤的話重新導入其他路徑
	    }
	}


	
//	@GetMapping("/bookTrip")
//	public String bookTrip(@ModelAttribute("bookingBean") bookingBean bookingBean, Model model, HttpSession session) {
//		Integer selectedUserId = (Integer)session.getAttribute("userId");
//		(Iterable<Integer>) user =  userRepository.findAllById(selectedUserId);
//		bookingBean.setUser(user);
//		
//		return "bookTrip";
//	}
}
