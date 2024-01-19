package com.example.Krist.booking.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.demo.model.bookingBean;

public class bookingValidate implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return bookingBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmpty(errors, "checkinDate", "bookingBean.checkinDate.empty", "必須傳入入住日期");
	    ValidationUtils.rejectIfEmpty(errors, "checkoutDate", "bookingBean.checkoutDate.empty", "必須傳入退房日期");
	    ValidationUtils.rejectIfEmpty(errors, "guest", "bookingBean.guest.empty", "必須傳入住人數");
		
	}
	
}
