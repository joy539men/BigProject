package com.example.demo.controller;

import com.example.demo.dao.BasicRoomInfoRepository;
import com.example.demo.dao.RoomOpenDateRepository;
import com.example.demo.dao.RoomTableByronRepository;

import com.example.demo.model.BasicRoomInfoEntity;

import com.example.demo.model.RoomOpenDateEntity;

import com.example.demo.model.roomTableBean;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/room")
public class RoomByronController {

	private final RoomTableByronRepository roomTableRepository;
	private final BasicRoomInfoRepository basicRoomInfoRepository;
	private final RoomOpenDateRepository roomOpenDateRepository;

	public RoomByronController(RoomTableByronRepository roomTableRepository,
			BasicRoomInfoRepository basicRoomInfoRepository, RoomOpenDateRepository roomOpenDateRepository) {
		this.roomTableRepository = roomTableRepository;
		this.basicRoomInfoRepository = basicRoomInfoRepository;
		this.roomOpenDateRepository = roomOpenDateRepository;
	}

	/**
	 * 取得房間簡易資訊(列表)
	 *
	 * @param postParam
	 * @return
	 */
	@PostMapping("/list")
	@ResponseBody
	public List<Map<String, Object>> getRoomList(@RequestBody(required = false) RoomFilterRequest postParam) {
		System.out.println(new Gson().toJson(postParam));
		System.out.println(postParam.getMinPrice());
		System.out.println(postParam.getMaxPrice());
		
		List<Map<String, Object>> result = new ArrayList<>();
		String imageUrl = "http://localhost:8080/pillowSurfing";

//		if (postParam.getLocation().equals("")) {
//			hotelList = roomTableRepository.findAll();
//		} else {
//			hotelList = roomTableRepository.listByRoomInfoFilterList(postParam.getLocation());
//		}
		
		 List<roomTableBean> hotelList = 
				 roomTableRepository.listByRoomInfoFilterList(
						 postParam.getLocation(),
						 postParam.getStyle(),
						 postParam.getAdult(),
						 postParam.getBed(),
						 postParam.getBd(),
						 LocalDate.parse(postParam.getStartDate()),
						 LocalDate.parse(postParam.getEndDate()),
						 postParam.getMinPrice(),
						 postParam.getMaxPrice()
						 
						 );
		if(hotelList.isEmpty()) {
			
			return result;
		}

//		fileUrl
//		name
//		type
//		price
	//roomId
		for(roomTableBean roomInfo: hotelList) {
			Map<String, Object> map = new HashMap<>();
			map.put("fileUrl",imageUrl+roomInfo.getFilePath());
			map.put("name", roomInfo.getTitle());
			map.put("type", roomInfo.getType());
			map.put("price", "$"+roomInfo.getPrice());
			result.add(map);
	
		}
		
		
	 
		// 我要把 全部資料 輸出到前端 上方的DATA 那 要怎麼做?
//		for (Map.Entry<Integer, List<LocalDate>> entry : roomOpenDateMap.entrySet()) {
//			BasicRoomInfoEntity roomInfo = roomInfoMap.get(entry.getKey());
//			Map<String, Object> map = new HashMap<>();
//			Type listType = new TypeToken<List<String>>() {
//			}.getType();
//			List<String> imageList = new Gson().fromJson(roomInfo.getImages(), listType); // 圖片檔名
//			if (imageList != null) {
//				List<String> tmpList = new ArrayList<>();
//				for (String image : imageList) {
//					String tmpStr = imageUrl + image;
//					tmpList.add(tmpStr);
//				}
//				map.put("images", tmpList);
//			} else {
//				map.put("images", new ArrayList<>());
//			}
//			map.put("price", "$" + roomInfo.getPrice());
//			map.put("name", roomTableMap.get(roomInfo.getHotelId()).getTitle());
//			map.put("roomId", roomInfo.getId());
//			result.add(map);
//
//		}


//        }
		return result;
	}

	//
//    class RoomSimpleInfo {
//        private String name="";
//        private String price="";
//        private List<String> imageList = new ArrayList<>();
//
//
//
//        public void setImageList(List<String> imageList) {
//            this.imageList = imageList;
//        }
//
//        public void setName(String name) {
//            this.name = name;
//        }
//
//        public void setPrice(String price) {
//            this.price = price;
//        }
//
//
//
//
//        public List<String> getImageList() {
//            return imageList;
//        }
//
//        public String getName() {
//            return name;
//        }
//
//        public String getPrice() {
//            return price;
//        }
//    }
	private LocalDate convertTime(String date) {
		System.out.println("origin=>"+date);
		DateTimeFormatter formatter = DateTimeFormatter.ISO_INSTANT;
		ZonedDateTime parsed = ZonedDateTime.parse(date, formatter.withZone(ZoneId.of("Asia/Taipei")));
		System.out.println(parsed.toLocalDate());
		return parsed.toLocalDate();
	}
}
