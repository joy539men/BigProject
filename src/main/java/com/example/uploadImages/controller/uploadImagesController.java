package com.example.uploadImages.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.uploadImages.service.uploadImagesService;



@Controller
public class uploadImagesController {

	@Autowired
	private uploadImagesService uploadImagesService;
	
	@PostMapping("/upload")
	public String handlerUpload(@RequestParam("images") List<MultipartFile> images, @RequestParam("roomId") Integer roomTableId) {
		
		
		String result = uploadImagesService.uploadFiles(images, roomTableId);
		
		return "index";
	}
		
}
