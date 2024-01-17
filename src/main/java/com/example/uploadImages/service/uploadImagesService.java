package com.example.uploadImages.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface uploadImagesService {

	public String uploadFiles(List<MultipartFile> images);
}
