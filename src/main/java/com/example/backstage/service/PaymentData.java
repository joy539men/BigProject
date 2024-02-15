package com.example.backstage.service;

public class PaymentData {
	private String itemName;
    private String merchantTradeNo;
    private String merchantTradeDate;
    private String totalAmount;
    private String orderId;
	
	
	public PaymentData(String itemName, String merchantTradeNo, String merchantTradeDate, String totalAmount,
			String orderId) {
		super();
		this.itemName = itemName;
		this.merchantTradeNo = merchantTradeNo;
		this.merchantTradeDate = merchantTradeDate;
		this.totalAmount = totalAmount;
		this.orderId = orderId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getMerchantTradeNo() {
		return merchantTradeNo;
	}
	public void setMerchantTradeNo(String merchantTradeNo) {
		this.merchantTradeNo = merchantTradeNo;
	}
	public String getMerchantTradeDate() {
		return merchantTradeDate;
	}
	public void setMerchantTradeDate(String merchantTradeDate) {
		this.merchantTradeDate = merchantTradeDate;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
}
