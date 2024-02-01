package com.example.Krist.addRoomForm.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.imageio.ImageIO;
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

import com.example.Krist.user.dao.userRepository;
import com.example.demo.model.amenitiesBean;
import com.example.demo.model.roomTableBean;
import com.example.demo.model.userBean;
import com.example.host.dao.AmenitiesRepository;
import com.example.host.service.HostService;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;

@Controller
public class HostControllerKrist {

	@Autowired
	private ServletContext context;

	@Autowired
	private HostService service;
	
	@Autowired
	AmenitiesRepository amenitiesRepository;
	
	@Autowired
	userRepository userRepository;

	public HostControllerKrist(ServletContext context, HostService service) {
		this.context = context;
		this.service = service;
	}

	//查看房間列表
	@GetMapping("/hostRoomsKrist")
	public String displayRooms(Model model) {
		Iterable<roomTableBean> rooms = service.findAll(); 

		model.addAttribute("rooms", rooms);
		return "host/hostRooms";

	}
	
	//查看個別房間詳細資訊
	@GetMapping("/hostRoomDetailKrist/{roomId}")
	public String RoomDetail(@PathVariable Integer roomId,Model model) {
	    Optional<roomTableBean> roomOptional = service.findById(roomId);
	    
	    // 解析 Optional，如果有值，就取得實際的 roomTableBean 物件，否則為 null
	    roomTableBean room = roomOptional.orElse(null);

	    model.addAttribute("room", room);
	    return "host/hostRoomDetail";
	}
	
	//傳送新增房間的空白表單
	@GetMapping("/addRoomKrist")
	public String showAddRoomForm(Model model) {
		List<amenitiesBean> amenities = (List<amenitiesBean>) amenitiesRepository.findAll();
	    model.addAttribute("amenities", amenities);
		
		roomTableBean bean = new roomTableBean();
		model.addAttribute("roomTableBean", bean);
		return "addRoomFormKrist2";
	}
	
	//傳送新增房間請求
	@PostMapping("/addRoomKrist")
	public String insertRoom(@ModelAttribute roomTableBean bean,@RequestParam(value = "amenityIds", required = false) Set<Integer> amenityIds, HttpSession session) throws IOException {
		//照片用multipartFile從表單送過來
		MultipartFile multipartFile = bean.getMultipartFile();
		
		//取得照片檔名以獲得檔案類型
		String originalFilename = multipartFile.getOriginalFilename();
		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}
		
		// 獲取圖片寬高比例
		int targetWidth = 650;  // 目標寬度，根據你的需求設定
		int targetHeight = 400;
		
		
		BufferedImage originalImage = ImageIO.read(multipartFile.getInputStream());

		// 創建縮放後的圖片
		BufferedImage resizedImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_INT_RGB);
		resizedImage.createGraphics().drawImage(originalImage.getScaledInstance(targetWidth, targetHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
		
		//暫時性替帶userId
		DateFormat dateFormat = new SimpleDateFormat("ddMMHHmm");
	    Date date = new Date();
	    String userId = dateFormat.format(date);
		
		//把照片從multipartFile存到本地資料夾
		String rootDirectory = "/Users/caiyancheng/git/BigProject/src/main/resources/static/images/imageKrist";
		
		
		try {
			File imageFolder = new File(rootDirectory);
			
			// 將處理後的圖片存在本地端
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			
			File file = new File(imageFolder, "roomImage_" + userId + ext);
			ImageIO.write(resizedImage, "jpg", file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
		//取得照片path
		String filePath = "/images/imageKrist/" + "roomImage_" + userId + ext;
		
		//path存進roomTableBean表單的filePath欄位
		
		// 先取得 userId
		Integer userIdSession = (Integer) session.getAttribute("userId");
		
		// 根據 userId 取得對應的 userBean
		userBean userBean = userRepository.findById(userIdSession).orElse(null);
		
		// 如果 userId 不為 null 設定 進入 roomTable 當中
		
		
		if(userBean != null) {
			bean.setUser(userBean);
			
			if (bean.getRoomId() != null) {
				service.update(bean);
			} 
		}
		
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
		
		bean.setFilePath(filePath);
		service.update(bean);
		service.addRoomWithAmenities(bean, amenityIds);
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@PostMapping("/addRoom")
//	public String insertRoom(@ModelAttribute roomTableBean bean) {
//
//		if (bean.getRoomId() != null) {
//			service.update(bean);
//		}
//		service.save(bean);
//		return "redirect:/hostRooms";
//	}
//	
	
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
