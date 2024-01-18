package com.example.roomTable.controller;

import java.io.IOException;
import java.util.Base64;

import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.roomTableBean;
import com.example.roomTable.service.roomTableService;


@Controller
public class roomTableFormController {

	private roomTableService roomTableService;

	public roomTableFormController(roomTableService roomTableService) {
		
		
			this.roomTableService = roomTableService;
	}
	
			// 本方法送出新增Customer資料的空白表單
			@GetMapping("/intoRoomTableForm")
			public String showbookingForm(Model model) {
				roomTableBean bean = new roomTableBean();
				model.addAttribute("roomTableBean", bean);
				return "/roomTableForm";
			}
			
			

			// 新增訂單
//			@PostMapping("/roomTableFormPost")
//			public String insertRoomTableForm (@ModelAttribute("roomTableBean") roomTableBean roomTableBean) {
//				
//				MultipartFile multipartFile = roomTableBean.getPhotos();
//				
//				roomTableService.save(roomTableBean);
//				
//				return "index";
//				
//			}
			
//			@PostMapping("/roomTableFormPost")
//			public String insertRoomTableForm(@ModelAttribute("roomTableBean") roomTableBean roomTableBean,
//			                                  @RequestParam("photos") MultipartFile multipartFile) {
//			    try {
//			        byte[] photoBytes = multipartFile.getBytes();
//			        roomTableBean.setPhotos(photoBytes);
//
//			        roomTableService.save(roomTableBean);
//
//			        return "index";
//			    } catch (IOException e) {
//			        // 處理異常
//			        e.printStackTrace();
//			        return "redirect:/errorPage";
//			    }
//			}
			
			
			@PostMapping("/roomTableFormPost")
			public String insertRoomTableForm(@ModelAttribute("roomTableBean")  roomTableBean roomTableBean
		) {
				
				MultipartFile multipartFile = roomTableBean.getMultipartFile();
				String originalFilename = multipartFile.getOriginalFilename();
				
//				if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
//					roomTableBean.setPhotos(originalFilename);
//				}
				
				String ext = "";
				if (originalFilename.lastIndexOf(".") > -1) {
					ext = originalFilename.substring(originalFilename.lastIndexOf("."));
				}
				
				// 建立Blob物件，交由 Hibernate 寫入資料庫
				if (multipartFile != null && !multipartFile.isEmpty()) {
					try {
						byte[] b = multipartFile.getBytes();
						roomTableBean.setPhotos(b);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
				}
//			    try {
//			        byte[] photoBytes = multipartFile.getBytes();
//			        
//			        roomTableBean.setPhotos(photoBytes);
//
//			        roomTableService.save(roomTableBean);
//
//			        return "index";
//			    } catch (IOException e) {
//			        // 處理異常
//			        e.printStackTrace();
//			        return "redirect:/errorPage";
//			    }
				return ext;
			}



}
