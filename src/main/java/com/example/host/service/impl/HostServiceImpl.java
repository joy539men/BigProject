package com.example.host.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.amenitiesBean;
import com.example.demo.model.roomTableBean;
import com.example.host.dao.AmenitiesRepository;
import com.example.host.dao.HostRepository;
import com.example.host.service.HostService;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;


@Service
public class HostServiceImpl implements HostService {
	
	@Autowired
	private HostRepository hostRepository;
	
	 @Autowired
	 private AmenitiesRepository amenitiesRepository;

	@Override
	public Optional<roomTableBean> getroomTableBeanById(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public List<roomTableBean> getroomTableBean() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public roomTableBean save(roomTableBean bean) {
		return hostRepository.save(bean);
	}

	@Override
	public roomTableBean update(roomTableBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterable<roomTableBean> findAll() {
		return hostRepository.findAll();
	}

	@Override
	public Optional<roomTableBean> findById(int id) {
		return hostRepository.findById(id);
	}


   
    @Override
    public roomTableBean addRoomWithAmenities(roomTableBean room, Set<Integer> amenityIds) {
        Set<amenitiesBean> amenities = ((Collection<amenitiesBean>) amenitiesRepository.findAllById(amenityIds)).stream().collect(Collectors.toSet());
        room.setAmenities(amenities);

        return hostRepository.save(room);
    }
	
    
    @Override
    public roomTableBean getRoomWithAmenities(Integer roomId) {
        return hostRepository.findRoomWithAmenitiesById(roomId).orElse(null);
    }
    
    @Override
    public roomTableBean updateRoomWithAmenities(Integer roomId, roomTableBean updatedRoom, Set<Integer> amenityIds) {
        roomTableBean existingRoom = hostRepository.findById(roomId).orElse(null);

        if (existingRoom != null) {
        	existingRoom.setTitle(updatedRoom.getTitle());
        	existingRoom.setType(updatedRoom.getType());
            existingRoom.setDescription(updatedRoom.getDescription());
            existingRoom.setGuestMax(updatedRoom.getGuestMax());
            existingRoom.setBedNum(updatedRoom.getBedNum());
            existingRoom.setBathroom(updatedRoom.getBathroom());
            existingRoom.setRoomNum(updatedRoom.getRoomNum());
            existingRoom.setFilePath(updatedRoom.getFilePath());
            String address = updatedRoom.getAddress();
            existingRoom.setAddress(address);
            Map<String, String> latLngMap = convertAddress(address);
            existingRoom.setLat(latLngMap.get("latitude"));
            existingRoom.setLon(latLngMap.get("longitude")) ;

            Set<amenitiesBean> amenities = ((Collection<amenitiesBean>) amenitiesRepository.findAllById(amenityIds)).stream().collect(Collectors.toSet());
            existingRoom.setAmenities(amenities);

            return hostRepository.save(existingRoom);
        }

        return null; // Handle the case where the room with the specified ID is not found
    }
    
    @Override
    public void deleteById(Integer id) {
    	hostRepository.deleteById(id);
    }
    
    @Override
    public String saveFile(MultipartFile multipartFile) {
    	//取得照片檔名以獲得檔案類型
    			String originalFilename = multipartFile.getOriginalFilename();
    			String ext = "";
    			if (originalFilename.lastIndexOf(".") > -1) {
    				ext = originalFilename.substring(originalFilename.lastIndexOf("."));
    			}
    			
    			// 獲取圖片寬高比例
    			int targetWidth = 650;  // 目標寬度，根據你的需求設定
    			int targetHeight = 400;
    			
    			
    			BufferedImage originalImage;
				try {
					originalImage = ImageIO.read(multipartFile.getInputStream());
					// 創建縮放後的圖片
	    			BufferedImage resizedImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_INT_RGB);
	    			resizedImage.createGraphics().drawImage(originalImage.getScaledInstance(targetWidth, targetHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
	    			
	    			
	    			//暫時性替帶userId
	    			DateFormat dateFormat = new SimpleDateFormat("ddMMHHmm");
	    		    Date date = new Date();
	    		    String userId = dateFormat.format(date);
	    		    String outputFileName = "roomImage_" + userId + ext;
	    		    
	    		    
//	    			把照片從multipartFile存到本地資料夾
	    		    String rootDirectory = "C:\\Users\\sandra\\git\\BigProject\\src\\main\\resources\\static\\images\\roomPic";
	    			try {
	    				File imageFolder = new File(rootDirectory);
	    				if (!imageFolder.exists())
	    					imageFolder.mkdirs();
	    				File file = new File(imageFolder, outputFileName);
	    				ImageIO.write(resizedImage, "jpg", file);
//	    				multipartFile.transferTo(file);
	    				
	    				//取得照片path
	        			String filePath = "/images/roomPic/" + outputFileName;
	        			return filePath;
	    			} catch (Exception e) {
	    				e.printStackTrace();
	    				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
	    			}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}


    			
    			
    			
    			
    			
    			
        return null;
    }
    
    
//    @Override   //未裁切版
//    public String saveFile(MultipartFile multipartFile) {
//    	//取得照片檔名以獲得檔案類型
//    			String originalFilename = multipartFile.getOriginalFilename();
//    			String ext = "";
//    			if (originalFilename.lastIndexOf(".") > -1) {
//    				ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//    			}
//    			
//    			//暫時性替帶userId
//    			DateFormat dateFormat = new SimpleDateFormat("ddMMHHmm");
//    		    Date date = new Date();
//    		    String userId = dateFormat.format(date);
//    		    String outputFileName = "roomImage_" + userId + ext;
//    		    
//    		    
////    			把照片從multipartFile存到本地資料夾
//    			String rootDirectory = "C:\\Users\\sandra\\git\\BigProject\\src\\main\\resources\\static\\images\\roomPic";
//    			try {
//    				File imageFolder = new File(rootDirectory);
//    				if (!imageFolder.exists())
//    					imageFolder.mkdirs();
//    				File file = new File(imageFolder, outputFileName);
//    				multipartFile.transferTo(file);
//    			} catch (Exception e) {
//    				e.printStackTrace();
//    				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//    			}
//    			
//    			
//    			//取得照片path
//    			String filePath = "/images/roomPic/" + outputFileName;
//        return filePath;
//    }
    
    @Override  // 使用Google Maps Geocoding API將地址轉換成經緯度
    public Map<String, String> convertAddress(String address) {
    	Map<String, String> latLngMap = new HashMap<>();
        // Implementation logic to convert address to latitude and longitude
    	GeoApiContext context = new GeoApiContext.Builder().apiKey("AIzaSyCoCS3e-5nUFhkFZq0gUiywb6OyAHb7GSs").build(); // Google API Key
	    try {
	    	GeocodingResult[] results = GeocodingApi.geocode(context, address).await();
	        if (results.length > 0) {
	            String latitude = String.valueOf(results[0].geometry.location.lat);
	            String longitude = String.valueOf(results[0].geometry.location.lng);
	            
	         // Invoke .shutdown() after your application is done making requests
	            context.shutdown();
	            latLngMap.put("latitude", latitude);
	            latLngMap.put("longitude", longitude);
	        }
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
        // Create a Map to store latitude and longitude
        return latLngMap;
    }
    
    @Override
    public roomTableBean getRoomById(Integer roomId) {
        return hostRepository.findById(roomId).orElse(null);
    }

	@Override
	public List<roomTableBean> findByHostId(Integer userId) {
		return hostRepository.findByUserUserId(userId);
	}
	
	@Override
    public List<roomTableBean> findByHostIdAndStatusNot(Integer hostId, String status) {
        return hostRepository.findByUserUserIdAndStatusNot(hostId, status);
    }

}
