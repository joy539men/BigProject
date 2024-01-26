package com.example.host.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.bookingBean;
import com.example.host.service.HostBookingService;

@Controller
public class HostOrderController {
	@Autowired
	HostBookingService service;

	
	
	
//	//	查看所有訂單
//	@GetMapping("/hostOrders")
//	public String displayOrders(HttpServletRequest request ,Model model) {
//		String requestPath = request.getRequestURI();
//		model.addAttribute("requestPath", requestPath);
//		try {
//            Iterable<bookingBean> bookings = service.findAllBookingsWithRoom();
//            model.addAttribute("bookings", bookings);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//		return "host/hostOrders";
//
//	}
	
	//	查看待確認的訂單列表  
	@GetMapping("/hostOrders")
	public String displayOrdersUncheck(Model model) {
		List<bookingBean> bookings = service.findUncheckBookings();
        model.addAttribute("bookings", bookings);
		return "host/hostOrders";

	}
	
	
	
	// 訂單列表頁面 一鍵接受功能
	@PostMapping("/acceptBooking")
    public String acceptBooking(@RequestParam("bookingId") Integer bookingId) {
		bookingBean bookingBean = null;
		Optional<bookingBean> optional = service.findById(bookingId);
		// 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
		if (optional.isPresent()) {
			bookingBean = optional.get();
//			System.out.println(bookingBean);
		}
		
        bookingBean.acceptBooking();
        service.save(bookingBean); // Save the updated booking
        return "redirect:/hostOrders"; // Redirect to the booking details page
    }
	
	// 訂單列表頁面 一鍵拒絕功能
	@PostMapping("/rejectBooking")
    public String rejectBooking(@RequestParam("bookingId") Integer bookingId) {
		bookingBean bookingBean = null;
		Optional<bookingBean> optional = service.findById(bookingId);
		// 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
		if (optional.isPresent()) {
			bookingBean = optional.get();
//			System.out.println(bookingBean);
		}
		
        bookingBean.rejectBooking();
        service.save(bookingBean); // Save the updated booking
        return "redirect:/hostOrders"; // Redirect to the booking details page
    }
	
	//	查看已接受的訂單列表  
	@GetMapping("/hostOrdersAccept")
	public String displayOrdersAccept(Model model) {
		List<bookingBean> bookings = service.findAcceptedBookings();
        model.addAttribute("bookings", bookings);
		return "host/hostOrdersAccept";

	}
	
	// 已接受訂單 一鍵取消功能
		@PostMapping("/cancelBooking")
	    public String cancelBooking(@RequestParam("bookingId") Integer bookingId) {
			bookingBean bookingBean = null;
			Optional<bookingBean> optional = service.findById(bookingId);
			// 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
			if (optional.isPresent()) {
				bookingBean = optional.get();
//				System.out.println(bookingBean);
			}
			
	        bookingBean.cancelBooking();
	        service.save(bookingBean); // Save the updated booking
	        return "redirect:/hostOrdersAccept"; // Redirect to the booking details page
	    }
	
	
}
