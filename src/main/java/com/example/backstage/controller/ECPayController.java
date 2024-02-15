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
		// 处理付款结果通知
		// 这里可以调用相应的服务方法来处理付款结果，比如更新订单状态等
		System.out.println("Received payment result: " + paymentResult);
		System.out.println("orderID為: "+orderId);
	    if (orderId != null) {
	        // 根据订单ID查找订单
	        Optional<bookingBean> optionalBooking = bookingService.findById(orderId);
	        if (optionalBooking.isPresent()) {
	            // 更新订单状态为已付款等操作
	            bookingBean booking = optionalBooking.get();
	            booking.setPaymentStatus("已付款"); // 假设状态为已付款
	            bookingService.save(booking); // 保存更新后的订单
	        } else {
	            // 如果无法找到相应订单，处理错误
	            System.out.println("Failed to retrieve booking with ID: " + orderId);
	        }
	    } else {
	        // 如果无法从会话中获取订单ID，处理错误
	        System.out.println("Failed to retrieve booking ID from session.");
	    }
		
		// 返回给绿界服务器的响应，一般返回 "1|OK" 表示接收成功
		return "1|OK";
	}
}
