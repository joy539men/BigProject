package com.example.backstage.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.backstage.service.OrderService_backstage;
import com.example.demo.model.bookingBean;

@Controller
public class OrderEditController_backstage {

	OrderService_backstage bookingService;

//	@Autowired
	public OrderEditController_backstage(OrderService_backstage bookingService) {
		super();
		this.bookingService = bookingService;
	}

	// 傳送帳號編輯表單
	@GetMapping({ "/order_edit/{id}"})
	public String getOrderEditForm(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
//			UserBean ub = new UserBean();
//			model.addAttribute("userBean",ub);
		
			return "backstage/order_edit";
	}
	//編輯完成表單接收
	@PutMapping("/order_edit/{id}")
	public String updateForm(@ModelAttribute bookingBean bookingBean,
			BindingResult result
			) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		bookingService.save(bookingBean);
		return "redirect:/order ";
	}
	@ModelAttribute
	public bookingBean getMember(@PathVariable Integer id, Model model) {
		bookingBean bookingBean = null;
		Optional<bookingBean> optional = bookingService.findById(id);
		if (optional.isPresent()) {
			bookingBean = optional.get();
			model.addAttribute("user_id", bookingBean.getBookingId());				
			System.out.println(bookingBean);
		}
		return bookingBean;
	}
}


