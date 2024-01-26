package com.example.host.controller;


import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.amenitiesBean;
import com.example.demo.model.roomTableBean;
import com.example.host.dao.AmenitiesRepository;
import com.example.host.service.HostService;


@Controller
public class HostController {

	ServletContext context;

	HostService service;
	
	HttpSession session;
	
	AmenitiesRepository amenitiesRepository;

	public HostController( HostService service,AmenitiesRepository amenitiesRepository) {
		this.service = service;
		this.amenitiesRepository = amenitiesRepository;
	}

	//查看房間列表
	@GetMapping("/hostRooms")
	public String displayRooms(Model model) {
		Iterable<roomTableBean> rooms = service.findAll(); 

		model.addAttribute("rooms", rooms);
		return "host/hostRooms";

	}
	
	//查看個別房間詳細資訊
	@GetMapping("/hostRoomDetail/{roomId}")
	public String RoomDetail(@PathVariable("roomId") Integer roomId,Model model) {
//		roomTableBean room = null;
//		Optional<roomTableBean> optional = service.findById(roomId);
//		// 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
//		if (optional.isPresent()) {
//			room = optional.get();
//			System.out.println(room);
//		}

		roomTableBean room = service.getRoomWithAmenities(roomId);
	    model.addAttribute("room", room);
	    return "host/hostRoomDetail";
	}
	
	//傳送新增房間的空白表單
	@GetMapping("/addRoom")
	public String showAddRoomForm(Model model) {
		List<amenitiesBean> amenities = (List<amenitiesBean>) amenitiesRepository.findAll();
	    model.addAttribute("amenities", amenities);
		
	    //
	    
		roomTableBean bean = new roomTableBean();
		model.addAttribute("roomTableBean", bean);
		return "host/addRoomForm2";
	}
	
	//傳送新增房間請求
	@PostMapping("/addRoom")
	public String insertRoom(@ModelAttribute roomTableBean bean,@RequestParam(value = "amenityIds", required = false) Set<Integer> amenityIds) {
		//照片用multipartFile從表單送過來
		MultipartFile multipartFile = bean.getMultipartFile();
		String filePath = service.saveFile(multipartFile);    //用saveFile把照片存到指定路徑，並回傳路徑
		bean.setFilePath(filePath); //path存進roomTableBean表單的filePath欄位
		bean.setStatus("待審核");
		
		 // 使用Google Maps Geocoding API將地址轉換成經緯度
		String address = bean.getAddress();
		Map<String, String> latLngMap = service.convertAddress(address);
		bean.setLat(latLngMap.get("latitude"));
		bean.setLon(latLngMap.get("longitude")) ;
		
	    service.update(bean);
		service.addRoomWithAmenities(bean, amenityIds);
	    return "redirect:/hostRooms";
	}
	
	
	//送出房間編輯的表單
	@GetMapping("/hostRoomEdit/{roomId}")
	public String editRoom(@PathVariable("roomId") Integer roomId ,Model model) {
		List<amenitiesBean> amenities = (List<amenitiesBean>) amenitiesRepository.findAll();
	    model.addAttribute("amenities", amenities);
		roomTableBean room = service.getRoomWithAmenities(roomId);
		System.out.println(room.toString());
	    model.addAttribute("room", room);
	    return "host/editRoomForm";
	}
	
	//儲存更新後的房間資訊
	@PostMapping("/hostRoomEdit/{roomId}")
    public String editRoomSubmit(@PathVariable Integer roomId, @ModelAttribute roomTableBean updatedRoom,@RequestParam Set<Integer> amenityIds) {
		// Get the original room
	    roomTableBean originalRoom = service.getRoomById(roomId);

	    // Process the uploaded file
	    MultipartFile multipartFile = updatedRoom.getMultipartFile();
	    String filePath;

	    if (multipartFile != null && !multipartFile.isEmpty()) {
	        // If a new file is uploaded, save it and update the filePath
	        filePath = service.saveFile(multipartFile);
	    } else {
	        // If no new file is uploaded, use the original filePath
	        filePath = originalRoom.getFilePath();
	    }
		updatedRoom.setFilePath(filePath); //path存進roomTableBean表單的filePath欄位
		service.updateRoomWithAmenities(roomId,  updatedRoom,  amenityIds) ;
        return "redirect:/hostRooms"; // Redirect to the list of rooms or another appropriate page
    }
	
	//刪除房間資訊
	@PostMapping("/hostRoomDelete/{roomId}")
	public String deleteRoom(@PathVariable Integer roomId) {
		service.deleteById(roomId);
		return "redirect:/hostRooms";
	}

	

	

	

}
