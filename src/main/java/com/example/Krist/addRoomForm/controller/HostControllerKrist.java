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

@Controller
public class HostControllerKrist {

	@Autowired
	private ServletContext context;

	@Autowired
	private HostService service;
	
	@Autowired
	AmenitiesRepository amenitiesRepository;

	@Autowired
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
		return "addRoomFormKrist";
	}
	
//	//傳送新增房間請求
//	@PostMapping("/addRoomKrist")
//	public String insertRoom(@ModelAttribute roomTableBean bean,@RequestParam(value = "amenityIds", required = false) Set<Integer> amenityIds) {
//		//照片用multipartFile從表單送過來
//		MultipartFile multipartFile = bean.getMultipartFile();
//		
//		//取得照片檔名以獲得檔案類型
//		String originalFilename = multipartFile.getOriginalFilename();
//		String ext = "";
//		if (originalFilename.lastIndexOf(".") > -1) {
//			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		}
//		
//		//暫時性替帶userId
//		DateFormat dateFormat = new SimpleDateFormat("ddMMHHmm");
//	    Date date = new Date();
//	    String userId = dateFormat.format(date);
//		
//		//把照片從multipartFile存到本地資料夾
//		String rootDirectory = "/Users/caiyancheng/git/BigProject/src/main/resources/static/images/imageKrist";
//		try {
//			File imageFolder = new File(rootDirectory);
//			if (!imageFolder.exists())
//				imageFolder.mkdirs();
//			File file = new File(imageFolder, "roomImage_" + userId + ext);
//			multipartFile.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
//		
//		
//		//取得照片path
//		String filePath = "/images/imageKrist/" + "roomImage_" + userId + ext;
//		
//		//path存進roomTableBean表單的filePath欄位
//		bean.setFilePath(filePath);
//		service.update(bean);
//		service.addRoomWithAmenities(bean, amenityIds);
//		return "redirect:/";
//	}
	
	
	
	//傳送新增房間請求
	@PostMapping("/addRoomKrist")
	public String insertRoom(@ModelAttribute roomTableBean bean,@RequestParam(value = "amenityIds", required = false) Set<Integer> amenityIds) throws IOException {
		//照片用multipartFile從表單送過來
		MultipartFile multipartFile = bean.getMultipartFile();
		
		//取得照片檔名以獲得檔案類型
		String originalFilename = multipartFile.getOriginalFilename();
		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}
		
		// 獲取圖片寬高比例
		int targetWidth = 350;  // 目標寬度，根據你的需求設定
		int targetHeight = 250;
		
		
		BufferedImage originalImage = ImageIO.read(multipartFile.getInputStream());
//		int originalWidth = originalImage.getWidth();
//		int originalHeight = originalImage.getHeight();
//		
//		double ratio = (double) targetWidth / originalWidth;
		
		// 計算縮放後的高度
//		int newHeight = (int) (originalHeight * ratio);

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
