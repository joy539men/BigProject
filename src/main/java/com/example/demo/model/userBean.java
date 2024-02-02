package com.example.demo.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="user")
public class userBean  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer    userId;
	
	private String     account;
	private String     password;
	private String     userName;
	private String     email;
	private String     address;
	private String     phone;
	private Date       birthday;
	private String     identity;
	private String     status;
	private String     statusNum;
	private Timestamp  registrationTime;
//	private String     password1;
	private String	   filePath;
//	private String	   authority;
	
	
	@Transient
	private MultipartFile imageFiles;
	
//	public String getAuthority() {
//		return authority;
//	}
//
//	public void setAuthority(String authority) {
//		this.authority = authority;
//	}

	@Transient
	private MultipartFile multipartFile;
	
	@Transient
    private String newPassword;

    @Transient
    private String confirmPassword;

	
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<reviewBean> reviews = new HashSet<>();
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<bookingBean> booking;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<roomTableBean> roomTable;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<favoriteBean> favorite;
	

	public Set<reviewBean> getReviews() {
		return reviews;
	}

	public void setReviews(Set<reviewBean> reviews) {
		this.reviews = reviews;
	}

	public List<roomTableBean> getRoomTable() {
		return roomTable;
	}

	public void setRoomTable(List<roomTableBean> roomTable) {
		this.roomTable = roomTable;
	}

	public List<favoriteBean> getFavorite() {
		return favorite;
	}

	public void setFavorite(List<favoriteBean> favorite) {
		this.favorite = favorite;
	}

	public userBean(Integer userId,String  account,String password1 ,String  password, String  userName, String  email, String  address, String  phone, String  identity, String  status, String  statusNum, Timestamp  registrationTime, Date  birthday,String	authority) {
		this.userId            = userId;
		this.account           = account;
		this.password          = password;
		this.userName          = userName;
		this.email             = email;
		this.address           = address;
		this.phone             = phone;
		this.identity          = identity;
		this.status            = status;
		this.statusNum         = statusNum;
		this.registrationTime  = registrationTime;
		this.birthday          = birthday;
//		this.password1         = password1;
//		this.authority       = authority;
	}
	
	
	// 獲取用戶輸入的新密碼
	public String getNewPassword() {
        return newPassword;
    }
	// 設置用戶輸入的新密碼到 userBean 
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    // 獲取用戶輸入的確認新密碼
    public String getConfirmPassword() {
        return confirmPassword;
    }
    // 設置用戶輸入的確認新密碼到 userBean 
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }


	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public userBean() {
		
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatusNum() {
		return statusNum;
	}

	public void setStatusNum(String statusNum) {
		this.statusNum = statusNum;
	}

	public Timestamp getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(Timestamp registrationTime) {
		this.registrationTime = registrationTime;
	}


	public List<bookingBean> getBooking() {
		return booking;
	}

	public void setBooking(List<bookingBean> booking) {
		this.booking = booking;
	}

	

	public MultipartFile getImageFiles() {
		return imageFiles;
	}
	
	public void setImageFiles(MultipartFile imageFiles) {
		this.imageFiles = imageFiles;
	}

	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	
	
	
	
	
}
