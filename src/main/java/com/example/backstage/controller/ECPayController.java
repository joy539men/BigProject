package com.example.backstage.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.backstage.service.ECPayService;
import com.example.backstage.service.OrderService_backstage;
import com.example.backstage.service.PaymentData;
import com.example.demo.model.bookingBean;

@RestController
public class ECPayController {
	@Autowired
	ECPayService ecpayService;
	@Autowired
	OrderService_backstage bookingService;

	@PostMapping("/ecpayCheckout")
	public String ecpayCheckout(PaymentData paymentData) {
		String aioCheckOutALLForm = ecpayService.ecpayCheckout(paymentData);
		System.out.println(paymentData.getItemName());
		System.out.println(paymentData.getMerchantTradeDate());
		System.out.println(paymentData.getMerchantTradeNo());
		System.out.println(paymentData.getTotalAmount());
		System.out.println(paymentData.getOrderId());
		return aioCheckOutALLForm;
	}

	@PostMapping("/paymentResult/{orderId}")
	public String handlePaymentResult(@RequestBody String  paymentResult, @PathVariable Integer orderId) {
		// 處理付款結果通知，更新訂單狀態
		System.out.println("Received payment result: " + paymentResult);
		System.out.println("orderID為: "+orderId);
	    if (orderId != null) {
	        // 根據訂單ID查找，更新付款狀態
	        Optional<bookingBean> optionalBooking = bookingService.findById(orderId);
	        if (optionalBooking.isPresent()) {
	            bookingBean booking = optionalBooking.get();
	            booking.setPaymentStatus("已付款");
	            bookingService.save(booking); 
	        } else {
	            System.out.println("Failed to retrieve booking with ID: " + orderId);
	        }
	    } else {
	        System.out.println("Failed to retrieve booking ID from session.");
	    }
		
		// 返回给綠界 "1|OK" 表示接收成功
		return "1|OK";
	}
}
