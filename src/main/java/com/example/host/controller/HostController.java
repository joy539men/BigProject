package com.example.host.controller;


import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.amenitiesBean;
import com.example.demo.model.bookingBean;
import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;
import com.example.host.dao.AmenitiesRepository;
import com.example.host.service.HostService;
import com.example.host.user.dao.userRepositoryYC;


@Controller
public class HostController {

	@Autowired
	ServletContext context;

	HostService service;
	
	
	HttpSession session;
	
	AmenitiesRepository amenitiesRepository;
	
	@Autowired
	userRepositoryYC userRepository;

	public HostController( HostService service,AmenitiesRepository amenitiesRepository,HttpSession session) {
		this.service = service;
		this.amenitiesRepository = amenitiesRepository;
		this.session = session;
	}

	//查看房間列表
	@GetMapping("/hostRooms")
	public String displayRooms(Model model) {
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId != null) {
//			Iterable<roomTableBean> rooms = service.findAll(); 
//			List<roomTableBean> rooms = service.findByHostId(userId);
			List<roomTableBean> rooms = service.findByHostIdAndStatusNot(userId,"已刪除");

			model.addAttribute("rooms", rooms);
			return "host/hostRooms"; 
        } else {   // 若是資料庫沒有該資料，跳轉到 login 頁面
            return "redirect:/login";
        }


	}
	
	
	//查看個別房間詳細資訊
	@GetMapping("/hostRoomDetail/{roomId}")
	public String RoomDetail(@PathVariable("roomId") Integer roomId,Model model) {
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId != null) {
			roomTableBean room = service.getRoomWithAmenities(roomId);
		    model.addAttribute("room", room);
		    return "host/hostRoomDetail";
        } else {   // 若是資料庫沒有該資料，跳轉到 login 頁面
            return "redirect:/login";
        }

		
	}
	
	//傳送新增房間的空白表單
	@GetMapping("/addRoom")
	public String showAddRoomForm(Model model) {
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId != null) {
			List<amenitiesBean> amenities = (List<amenitiesBean>) amenitiesRepository.findAll();
		    model.addAttribute("amenities", amenities);
			
		    //
		    
			roomTableBean bean = new roomTableBean();
			model.addAttribute("roomTableBean", bean);
			return "host/addRoomForm2";
        } else {   // 若是資料庫沒有該資料，跳轉到 login 頁面
            return "redirect:/login";
        }
		
		
	}
	
	//傳送新增房間請求
	@PostMapping("/addRoom")
	public String insertRoom(@ModelAttribute roomTableBean bean,@RequestParam(value = "amenityIds", required = false) Set<Integer> amenityIds) {
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId != null) {
			Optional<userBean> optional = userRepository.findById(userId);
			if (optional.isPresent()) {
				userBean user = optional.get();
				bean.setUser(user);
			}
			
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
        } else {   // 若是資料庫沒有該資料，跳轉到 login 頁面
            return "redirect:/login";
        }
		
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
	
	//刪除房間資訊(使用者看不到 不是真從資料庫刪除)
	@PostMapping("/hostRoomDelete/{roomId}")
	public String deleteRoomByUser(@PathVariable Integer roomId) {
		roomTableBean room = null;
		Optional<roomTableBean> optional = service.findById(roomId);
		if (optional.isPresent()) {
			room = optional.get();
		}
		room.deleteRoomByUser();  //把這間房的狀態改為"已刪除"
		service.save(room);
		return "redirect:/hostRooms";
	}
	
	//刪除房間資訊
		@PostMapping("/hostRoomDeleteee/{roomId}")
		public String deleteRoom(@PathVariable Integer roomId) {
			service.deleteById(roomId);
			return "redirect:/hostRooms";
		}

	

	

	

}
