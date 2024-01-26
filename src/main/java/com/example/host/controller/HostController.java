package com.example.host.controller;


import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletContext;

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
import com.example.demo.model.roomTableBean;
import com.example.host.dao.AmenitiesRepository;
import com.example.host.service.HostService;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;


@Controller
public class HostController {

	@Autowired
	private ServletContext context;

	@Autowired
	private HostService service;
	
	@Autowired
	AmenitiesRepository amenitiesRepository;

	@Autowired
	public HostController(ServletContext context, HostService service) {
		this.context = context;
		this.service = service;
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
	public String RoomDetail(@PathVariable Integer roomId,Model model) {
	    Optional<roomTableBean> roomOptional = service.findById(roomId);
	    
	    // 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
	    roomTableBean room = roomOptional.orElse(null);

	    model.addAttribute("room", room);
	    return "host/hostRoomDetail";
	}
	
	//傳送新增房間的空白表單
	@GetMapping("/addRoom")
	public String showAddRoomForm(Model model) {
		List<amenitiesBean> amenities = (List<amenitiesBean>) amenitiesRepository.findAll();
	    model.addAttribute("amenities", amenities);
		
	    //
	    String apiKey = "AIzaSyCoCS3e-5nUFhkFZq0gUiywb6OyAHb7GSs";
        model.addAttribute("apiKey", apiKey);
	    
		roomTableBean bean = new roomTableBean();
		model.addAttribute("roomTableBean", bean);
		return "host/addRoomForm2";
	}
	
	//傳送新增房間請求
	@PostMapping("/addRoom")
	public String insertRoom(@ModelAttribute roomTableBean bean,@RequestParam(value = "amenityIds", required = false) Set<Integer> amenityIds) {
		//照片用multipartFile從表單送過來
		MultipartFile multipartFile = bean.getMultipartFile();
		
		//取得照片檔名以獲得檔案類型
		String originalFilename = multipartFile.getOriginalFilename();
		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}
		
		//暫時性替帶userId
		DateFormat dateFormat = new SimpleDateFormat("ddMMHHmm");
	    Date date = new Date();
	    String userId = dateFormat.format(date);
	    String outputFileName = "roomImage_" + userId + ext;
	    
	    
//		把照片從multipartFile存到本地資料夾
		String rootDirectory = "D:\\BigProject-1\\src\\main\\resources\\static\\images\\pic_backstage";
		try {
			File imageFolder = new File(rootDirectory);
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, outputFileName);
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
		
		//取得照片path
		String filePath = "/images/roomPic/" + outputFileName;
		
		//path存進roomTableBean表單的filePath欄位
		bean.setFilePath(filePath);
		
		
		 // 使用Google Maps Geocoding API將地址轉換成經緯度
		String address = bean.getAddress();
        GeoApiContext context = new GeoApiContext.Builder().apiKey("AIzaSyCoCS3e-5nUFhkFZq0gUiywb6OyAHb7GSs").build(); // Google API Key
	    try {
	    	GeocodingResult[] results = GeocodingApi.geocode(context, address).await();
	        if (results.length > 0) {
	            String latitude = String.valueOf(results[0].geometry.location.lat);
	            String longitude = String.valueOf(results[0].geometry.location.lng);
	            
	         // Invoke .shutdown() after your application is done making requests
	            context.shutdown();
	
	            bean.setLat(latitude);
	            bean.setLon(longitude);
	        }
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    service.update(bean);
		service.addRoomWithAmenities(bean, amenityIds);
	    return "redirect:/hostRooms";
	}
	
	
	
	

	
//	@ModelAttribute
//	public roomTableBean editCustomerBean(@RequestParam(value = "roomId", required = false) Integer id) {
//		roomTableBean rbean = new roomTableBean();
//		if (id != null) {
//			rbean = service.findById(id).get();
//			System.out.println("在@ModelAttribute修飾的方法 getCustomerBean()中，讀到物件:" + rbean);
//		} else {
//			
//			System.out.println("在@ModelAttribute修飾的方法 getCustomerBean()中，無法讀取物件:" + rbean);
//		}
//		return rbean;
//	}
//	

	

}
