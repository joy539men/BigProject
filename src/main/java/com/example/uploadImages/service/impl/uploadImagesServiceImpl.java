package com.example.uploadImages.service.impl;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.roomPhotoBean;
import com.example.demo.model.roomTableBean;
import com.example.uploadImages.dao.uploadImagesRepository;
import com.example.uploadImages.service.uploadImagesService;

@Service
public class uploadImagesServiceImpl implements uploadImagesService{

	@Autowired
	private uploadImagesRepository uploadImagesRepository;

	@Transactional
	public String uploadFiles(List<MultipartFile> images, Integer roomTableId) {
		// TODO Auto-generated method stub
		
		
		try {
			
			
			roomTableBean roomTableBean = null;
			for(MultipartFile image: images) {
			  roomPhotoBean	roomPhotoBean = new roomPhotoBean(null, image.getBytes(), image.getContentType());
			  roomPhotoBean.setRoomTable(roomTableBean);
			  uploadImagesRepository.save(roomPhotoBean);
			}
			return "上傳成功";
		} catch (IOException e) {
	        e.printStackTrace();
	        return "上傳失敗 - 發生IO異常";
	      
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "上傳失敗";
		}
		

	}

}
