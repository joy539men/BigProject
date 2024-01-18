package com.example.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.payment.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	private final PaymentService paymentService;
	
	@Autowired
	public PaymentController(PaymentService paymentService) {
		this.paymentService = paymentService;
	}
	
}
