package com.example.host.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.model.bookingBean;

@Repository
public interface HostBookingRepository extends JpaRepository<bookingBean, Integer> {

	@Query("SELECT b FROM bookingBean b JOIN FETCH b.roomTable")
    Iterable<bookingBean> findAllBookingsWithRoom();

    List<bookingBean> findByStatus(String status);
    
    List<bookingBean> findByRoomTableUserUserIdAndStatus(Integer userId, String status);
}
