package com.example.uploadImages.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.roomPhotoBean;
import com.example.uploadImages.service.uploadImagesService;

import java.io.IOException;

@RestController
@RequestMapping("/photos")
public class uploadImagesController {

    @Autowired
    private uploadImagesService uploadImagesService; // 假设你有一个 PhotoService 处理业务逻辑

    @PostMapping("/upload")
    public String uploadPhoto(
            @RequestParam("contentType") String contentType,
            @RequestParam("data") MultipartFile data
    		) {
        try {
            byte[] photoData = data.getBytes();

            roomPhotoBean photo = new roomPhotoBean();
            photo.setContentType(contentType);
            photo.setData(photoData);
//            photo.setPhotoId(roomId);

            uploadImagesService.savePhoto(photo);
            
            

//            return ResponseEntity.status(HttpStatus.CREATED).body("Photo uploaded successfully!");
        } catch (IOException e) {
        	e.printStackTrace();
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to upload photo.");
        }
		return "index";
    }

    
    // 还可以添加其他处理照片的方法，如获取照片信息、删除照片等
}



















//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.example.uploadImages.service.uploadImagesService;
//
//
//
//@Controller
//public class uploadImagesController {
//
//	@Autowired
//	private uploadImagesService uploadImagesService;
//	
//	@PostMapping("/upload")
//	public String handlerUpload(@RequestParam("images") List<MultipartFile> images, @RequestParam("roomId") Integer roomTableId) {
//		
//		
//		String result = uploadImagesService.uploadFiles(images, roomTableId);
//		
//		return "index";
//	}
//		
//}
