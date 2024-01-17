package com.example.uploadImages.dao;

import java.awt.Image;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.roomPhotoBean;

public interface uploadImagesRepository extends JpaRepository<roomPhotoBean, Long>{


}
