package com.example.host.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;
import com.example.host.dao.AmenitiesRepository;
import com.example.host.service.HostService;
import com.example.host.user.dao.userRepositoryYC;

@RestController
public class HostRestController {
	@Autowired
	ServletContext context;

	HostService service;
	
	
	HttpSession session;
	
	AmenitiesRepository amenitiesRepository;
	
	@Autowired
	userRepositoryYC userRepository;
	
	public HostRestController( HostService service,AmenitiesRepository amenitiesRepository,HttpSession session) {
		this.service = service;
		this.amenitiesRepository = amenitiesRepository;
		this.session = session;
	}
	
	
	//傳送新增房間請求
	@PostMapping("/addRoom")
	public ResponseEntity<Map<String, String>> insertRoom(@ModelAttribute roomTableBean bean,
														  @RequestParam(value = "amenityIds", required = false) Set<Integer> amenityIds,
														  @RequestParam("multipartFile") MultipartFile multipartFile) {
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId != null) {
			Optional<userBean> optional = userRepository.findById(userId);
			if (optional.isPresent()) {
				userBean user = optional.get();
				bean.setUser(user);
			}
			
			//照片用multipartFile從表單送過來
//			MultipartFile multipartFile = bean.getMultipartFile();
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
			System.out.println("OK1");
			
			Map<String, String> responseBody = new HashMap<>();
			responseBody.put("roomUrl","/pillowSurfing/hostRooms");
			System.out.println(responseBody);
//		    return "redirect:/hostRooms";
//		    return ResponseEntity.ok("{\"roomUrl\": \"/pillowSurfing/hostRooms\"}");
		    return ResponseEntity.ok(responseBody);
        } else {   // 若是資料庫沒有該資料，跳轉到 login 頁面
        	Map<String, String> responseBody = new HashMap<>();
			responseBody.put("roomUrl","/pillowSurfing/login");
			
        	return ResponseEntity.ok(responseBody);
        }
		
	}
	
	//儲存更新後的房間資訊
		@PostMapping("/hostRoomEdit/{roomId}")
	    public ResponseEntity<String> editRoomSubmit(@PathVariable Integer roomId, 
	    											 @ModelAttribute roomTableBean updatedRoom,
	    											 @RequestParam Set<Integer> amenityIds,
	    											 @RequestParam String type,
	    											 @RequestParam(value = "multipartFile", required = false ) MultipartFile multipartFile) {
			// Get the original room
		    roomTableBean originalRoom = service.getRoomById(roomId);

		    // Process the uploaded file
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
			return ResponseEntity.ok("{\"redirectUrl\": \"/pillowSurfing/hostRooms\"}"); // Redirect to the list of rooms or another appropriate page
	    }
}
