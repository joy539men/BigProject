package com.example.Krist.uploadImage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.Krist.uploadImage.dao.ImageRepository;
import com.example.Krist.uploadImage.model.Image;

// Controller Class
@Controller
public class ImageController {
	
	@Autowired
	private ImageRepository imgRepo;
	
	
	@GetMapping("/viewAllImages")
	public String viewAllIamges(Model model)
	{
		  List<Image> list=	imgRepo.findAll();
			model.addAttribute("imgList",list);
			
			return "viewAllImages";
		
	}

	
}
