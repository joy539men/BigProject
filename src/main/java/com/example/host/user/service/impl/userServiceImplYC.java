package com.example.host.user.service.impl;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.userBean;
import com.example.host.user.dao.userRepositoryYC;
import com.example.host.user.service.userServiceYC;

@Service
public class userServiceImplYC implements userServiceYC{

	@Autowired
    private userRepositoryYC userRepository;
	

	
	@Override
	public Optional<userBean> getUserBeanById(int id) {
		// TODO Auto-generated method stub
		Optional<userBean> userOptional = userRepository.findById(id);
		
		// 如果有使用者資料，則找尋其相關的資料
		if(userOptional.isPresent()) {
//			userBean user = userOptional.get();
		    // 假設 userBean 中有一個關聯屬性 otherTable，表示與其他資料表的關聯
            // 如果有這樣的關聯，則透過這個關聯屬性取得其他相關的資料
            // 如果關聯的資料表是 OtherTable，可以使用 otherTableRepository 進行查詢
            // OtherTable otherData = otherTableRepository.findById(user.getOtherTable().getId()).orElse(null);
            // 將取得的其他相關資料設定到 user 中
			

            // 這邊以 user 的其他相關資料為例，實際根據你的資料表和關聯進行調整
            // user.setOtherData(otherData);
		}
		
		return userOptional;
	}

	@Override
	public List<userBean> getUserBean() {
		// TODO Auto-generated method stub
		 return (List<userBean>) userRepository.findAll();
	}

	@Override
	public userBean save(userBean bean) {
		// TODO Auto-generated method stub
		return userRepository.save(bean);
	}

	@Override
	public userBean update(userBean bean) {
		return userRepository.save(bean);
	}

	// 取消使用此方法
//	public Optional<userBean> findByUsername(String userName){
//		return userRepository.findByUserNameOption(userName);
//	}

//	@Override
//	public Integer authenticateUser(String userName, String password) {
//		// TODO Auto-generated method stub
//		Integer userId = getUserIdByCredentials(userName, password);
//        return userId;
//	}

	@Override
	public Integer authenticateUser(String account, String password) {
		// TODO Auto-generated method stub
		userBean user = userRepository.findByAccountAndPassword(account, password);
		
		if(user != null) {
			return user.getUserId();
		}else {
			return null;
		}
	}



	@Override
	public Optional<userBean> findByUsername(String username) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public userBean findByAccount(String account) {
		// TODO Auto-generated method stub
		return userRepository.findByAccount(account);
	}

	@Override
	public userBean findByAccountAndPassword(String account, String password) {
		// TODO Auto-generated method stub
		return userRepository.findByUserNameAndPassword(account, password);
	}
	
	@Override
	public String saveFile(MultipartFile multipartFile) {
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
    		    String outputFileName = "userImage_" + userId + ext;
    		    
    		    
//    			把照片從multipartFile存到本地資料夾
    		    
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
    			String filePath = "/images/pic_backstage/" + outputFileName;
        return filePath;
    }
	
	@Override
	public String updateFile(MultipartFile multipartFile,String originalFilePath,Integer userId) {
		String targetFilePath = "C:\\Users\\sandra\\git\\BigProject\\src\\main\\resources\\static" + originalFilePath;
//		System.out.println(targetFilePath);
//		
//		//刪除舊檔案
//		File fileToDelete = new File(targetFilePath);
//		// Check if the file exists before attempting to delete
//        if (fileToDelete.exists()) {
//            // Attempt to delete the file
//            if (fileToDelete.delete()) {
//                System.out.println("File deleted successfully.");
//            } else {
//                System.out.println("Failed to delete the file.");
//            }
//        } else {
//            System.out.println("File does not exist.");
//        }
		return saveFileTest(multipartFile,userId);
	}
	
//	@Override
//	public void renameFile(String filePath,Integer userId) {
//		String ext = "";
//		if (filePath.lastIndexOf(".") > -1) {
//			ext = filePath.substring(filePath.lastIndexOf("."));
//		}
//		String newFileName = "userPhoto_" + userId + ext;
//	    // Construct the new file path with the final file name
//	    String newFilePath = filePath.replaceFirst("[^/]+$", newFileName);
//
//	    // Perform the file renaming
//	    File oldFile = new File("C:\\Users\\sandra\\git\\BigProject\\src\\main\\resources\\static" + filePath);
//	    File newFile = new File("C:\\Users\\sandra\\git\\BigProject\\src\\main\\resources\\static" + newFilePath);
//
//	    if (oldFile.exists()) {
//	        oldFile.renameTo(newFile);
//	    }
//	}
	
	@Override
	public userBean updateUser(Integer userId, userBean updateUser ) {
		userBean existingUser = userRepository.findById(userId).orElse(null);
        if (existingUser != null) {
        	existingUser.setAccount(updateUser.getAccount());
        	existingUser.setPassword(updateUser.getPassword());
        	existingUser.setUserName(updateUser.getUserName());
        	existingUser.setEmail(updateUser.getEmail());
        	existingUser.setAddress(updateUser.getAddress());
        	existingUser.setPhone(updateUser.getPhone());
        	existingUser.setBirthday(updateUser.getBirthday());
        	existingUser.setFilePath(updateUser.getFilePath());
        	
        	return userRepository.save(existingUser);
        }
		return null;
	}

	@Override
	public String saveFileTest(MultipartFile multipartFile, Integer userId) {
		//取得照片檔名以獲得檔案類型
		String originalFilename = multipartFile.getOriginalFilename();
		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}
		
		//暫時性替帶userId
//		DateFormat dateFormat = new SimpleDateFormat("ddMMHHmm");
//	    Date date = new Date();
//	    String userId = dateFormat.format(date);
	    String outputFileName = "userImage_" + userId + ext;
	    
	    
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
		String filePath = "/images/pic_backstage/" + outputFileName;
		return filePath;
		
	}


}
