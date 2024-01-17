package com.example.uploadImages.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public interface uploadImagesService {

	public String uploadFiles(@RequestParam("roomId") List<MultipartFile> images, Integer roomTableId);
	
	
}
