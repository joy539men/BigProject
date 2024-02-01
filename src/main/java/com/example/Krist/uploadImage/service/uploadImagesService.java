package com.example.Krist.uploadImage.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.roomPhotoBean;

public interface uploadImagesService {

	public String uploadFiles(@RequestParam("roomId") List<MultipartFile> images, Integer roomTableId);
	
	public void savePhoto(roomPhotoBean roomPhotoBean);
}
