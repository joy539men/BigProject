package com.example.backstage.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.backstage.service.BookingService;
import com.example.demo.model.bookingBean;

@Controller
public class QueryOrderController {
	
	BookingService bookingService;
	
	public QueryOrderController(BookingService bookingService) {
		super();
		this.bookingService = bookingService;
	}

	// 全部訂單
	@GetMapping("/order")
	public String getAllOrder(Model model) {
		List<bookingBean> beans = bookingService.findAll();
		model.addAttribute("orders",beans);
		return "backstage/order";
	}
	//訂單詳細資訊
	@GetMapping({ "/order_info/{id}" })
	public String getOrderDetial(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
		bookingBean bookingBean = null;
		Optional<bookingBean> optional = bookingService.findById(id);
		if (optional.isPresent()) {
			bookingBean = optional.get();
			System.out.println(bookingBean);
		}
		model.addAttribute("booking",bookingBean );
		return "backstage/order_info";
	}
	//刪除訂單
	@DeleteMapping("/order_delete/{id}")
	public String delete(@PathVariable Integer id, Model model) {
		bookingService.deleteById(id);
		return "redirect:/order";
	}
}
