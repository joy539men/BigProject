package com.example.uploadImages.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.roomPhotoBean;
import com.example.uploadImages.dao.uploadImagesRepository;
import com.example.uploadImages.service.uploadImagesService;

@Service
public class uploadImagesServiceImpl implements uploadImagesService{

	@Autowired
	private uploadImagesRepository uploadImagesRepository;

	@Transactional
	public String uploadFiles(List<MultipartFile> images) {
		// TODO Auto-generated method stub
		try {
			for(MultipartFile image: images) {
			  roomPhotoBean	roomPhotoBean = new roomPhotoBean(null, image.getBytes(), image.getContentType());
			  uploadImagesRepository.save(roomPhotoBean);
			}
			return "上傳成功";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "上傳失敗";
		}
		

	}

}
