package com.example.backstage.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.backstage.service.OrderService_backstage;
import com.example.demo.model.bookingBean;

@Controller
public class QueryOrderController_backstage {

	OrderService_backstage bookingService;

	public QueryOrderController_backstage(OrderService_backstage bookingService) {
		super();
		this.bookingService = bookingService;
	}

	// 全部訂單
	@GetMapping("/order")
	public String getAllOrder(Model model) {
		List<bookingBean> beans = bookingService.findAll();
		model.addAttribute("orders", beans);
		return "backstage/order";
	}

	// 訂單詳細資訊
	@GetMapping({ "/order_info/{id}" })
	public String getOrderDetial(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
		bookingBean bookingBean = null;
		Optional<bookingBean> optional = bookingService.findById(id);
		if (optional.isPresent()) {
			bookingBean = optional.get();
			System.out.println(bookingBean);
		}
		model.addAttribute("booking", bookingBean);
		return "backstage/order_info";
	}

	// 刪除訂單
	@DeleteMapping("/order_delete/{id}")
	public String delete(@PathVariable Integer id, Model model) {
		bookingService.deleteById(id);
		return "redirect:/order";
	}

	// 模糊搜尋
	@GetMapping("/backend/dateSearch")
	public String searchUser(Model model, HttpServletRequest request) {
		String checkingDate = request.getParameter("checkinDateSearch");
		String checkoutDate = request.getParameter("checkoutDateSearch");
		
		List<bookingBean> beans = bookingService.searchDate(checkingDate, checkoutDate);
//		if (search.isEmpty()) {
//			return "redirect:/account";
//		}
		System.out.println(beans);
		System.out.println(checkingDate+checkoutDate);
		model.addAttribute("orders", beans);
		return "backstage/order";
	}
}
