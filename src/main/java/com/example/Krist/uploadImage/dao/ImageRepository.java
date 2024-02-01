package com.example.Krist.uploadImage.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Krist.uploadImage.model.Image;


public interface ImageRepository extends JpaRepository<Image, Integer> {

}
