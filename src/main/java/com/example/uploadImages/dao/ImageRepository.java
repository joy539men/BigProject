package com.example.uploadImages.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.uploadImages.model.Image;

public interface ImageRepository extends JpaRepository<Image, Integer> {

}
