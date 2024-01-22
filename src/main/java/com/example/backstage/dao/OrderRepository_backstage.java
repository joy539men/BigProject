package com.example.backstage.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.bookingBean;

public interface OrderRepository_backstage extends JpaRepository<bookingBean,Integer>{
	
	@Query(value="SELECT * FROM booking WHERE checkin_date >= :checkinDate AND checkout_date <= :checkoutDate", nativeQuery = true)
	List<bookingBean> searchDate(@Param("checkinDate")String checkinDate,@Param("checkoutDate") String checkoutDate);
	
}
