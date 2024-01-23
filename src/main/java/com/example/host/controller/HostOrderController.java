package com.example.host.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.model.bookingBean;
import com.example.host.service.HostBookingService;

@Controller
public class HostOrderController {
	@Autowired
	HostBookingService service;




	//查看房間列表
	@GetMapping("/hostOrders")
	public String displayOrders(Model model) {
		try {
            Iterable<bookingBean> bookings = service.findAll();
            model.addAttribute("bookings", bookings);
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
        }
		return "host/hostOrders";

	}
}
