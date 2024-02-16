package com.example.backstage.service;

import java.util.Hashtable;

import org.springframework.stereotype.Service;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.AllInOneBase;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.ecpayOperator.EcpayFunction;

@Service
public class ECPayService {
	
public String ecpayCheckout(PaymentData paymentData ) {
	AllInOne all = new AllInOne("");
	AioCheckOutALL obj = new AioCheckOutALL();
//	Hashtable<String, String> params = new Hashtable<>();
//	params.put("MerchantTradeNo", paymentData.getMerchantTradeNo());
//	params.put("MerchantID", "2000132");
//	params.put("MerchantTradeDate", paymentData.getMerchantTradeDate());
//	params.put("PaymentType",obj.getPaymentType() );
//	params.put("TotalAmount", paymentData.getTotalAmount());
//	params.put("TradeDesc","test Description");
//	params.put("ItemName",paymentData.getItemName());
//	params.put("ReturnURL","https://01f0-49-213-133-233.ngrok-free.app/paymentResult/"+paymentData.getOrderId());
//	params.put("ChoosePayment",obj.getChoosePayment());
//	params.put("ClientBackURL","http://localhost:8080/roomTableGallery");
//	params.put("NeedExtraPaidInfo",obj.getNeedExtraPaidInfo());
//	params.put("InvoiceMark",obj.getInvoiceMark());
//	params.put("EncryptType",obj.getEncryptType());
	
	// 添加其他参数...
	 String HashKey = AllInOneBase.HashKey;
	 String HashIV = AllInOneBase.HashIV;
	// 调用方法生成檢查碼
	
	
	// 将檢查碼加入参数
//	params.put("CheckMacValue", checkMacValue);

		
		obj.setMerchantTradeNo(paymentData.getMerchantTradeNo());
		obj.setMerchantTradeDate(paymentData.getMerchantTradeDate());
		obj.setTotalAmount(paymentData.getTotalAmount());
		obj.setTradeDesc("test Description");
		obj.setItemName(paymentData.getItemName());
		// 交易結果回傳網址，只接受 https 開頭的網站，使用 ngrok
		obj.setReturnURL(" https://1d9b-118-163-218-100.ngrok-free.app/pillowSurfing/paymentResult/"+paymentData.getOrderId()); 
		obj.setClientBackURL("http://localhost:8080/pillowSurfing/roomTableGallery"); 
		obj.setNeedExtraPaidInfo("N"); 
		Hashtable<String, String> hashtable = EcpayFunction.objToHashtable(obj);
		String checkMacValue = EcpayFunction.genCheckMacValue(HashKey, HashIV, hashtable);
		System.out.println(checkMacValue);
		String form = all.aioCheckOut(obj, null);
		System.out.println("有沒有post成功"+obj);
		return form;
	}
}
