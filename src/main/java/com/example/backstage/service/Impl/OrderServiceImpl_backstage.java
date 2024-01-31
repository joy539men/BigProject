package com.example.backstage.service.Impl;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.SystemPropertyUtils;

import com.example.backstage.dao.OrderRepository_backstage;
import com.example.backstage.dao.RoomRepository_backstage;
import com.example.backstage.service.OrderService_backstage;
import com.example.demo.model.bookingBean;
import com.example.demo.model.roomTableBean;

@Service
@Transactional
public class OrderServiceImpl_backstage implements OrderService_backstage {

	private static Logger log = LoggerFactory.getLogger(OrderServiceImpl_backstage.class);

	OrderRepository_backstage bookingRepository;
	RoomRepository_backstage roomRepository;

//	@Autowired
	public OrderServiceImpl_backstage(OrderRepository_backstage bookingRepository,
			RoomRepository_backstage roomRepository) {
		super();
		this.bookingRepository = bookingRepository;
		this.roomRepository = roomRepository;
	}

	@Override
	public void save(bookingBean bookingBean) {
		bookingRepository.save(bookingBean);
		log.info("修改訂單功能之Sservice: 資料更新成功, UserBean=" + bookingBean);
	}

	@Override
	public List<bookingBean> findAll() {
		List<bookingBean> beans = bookingRepository.findAll();
		return beans;
	}

	@Override
	public Optional<bookingBean> findById(Integer userId) {
		Optional<bookingBean> optional = bookingRepository.findById(userId);
		return optional;
	}

	@Override
	public void deleteById(Integer id) {
//		log.info("刪除訂單功能之Service, 書籍主鍵值：" + id);
//		Optional<bookingBean> optional = bookingRepository.findById(id);
//		bookingBean bookingBean = null;
//		if (optional.isPresent()) {
//			bookingBean = optional.get();
//		}
		bookingRepository.deleteById(id);
	}

	@Override
	public List<bookingBean> searchDate(String checkinDate, String checkoutDate) {
		List<bookingBean> beans = bookingRepository.searchDate(checkinDate, checkoutDate);
		return beans;
	}

	@Override
	public List<bookingBean> findByRoomTableRoomId(Integer roomId) {
		return bookingRepository.findByRoomTableRoomId(roomId);
	}

	// 每分鐘檢查一次，檢查所有已接受訂單的入住日期到達當前日期，將房間狀態設為使用中
	@Scheduled(cron = "0 * * * * *")
	public void checkAndUpdateRoomStatus() {
		List<roomTableBean> availableRooms = roomRepository.roomAvailable();
//		System.out.println(availableRooms);
		for (roomTableBean room : availableRooms) {
			System.out.println(room);
			List<bookingBean> bookingsForRoom = bookingRepository.findByRoomTable(room);

//			System.out.println(bookingsForRoom);
			for (bookingBean booking : bookingsForRoom) {
				System.out.println(booking);
				if ("已接受".equals(booking.getStatus())) {
					LocalDate currentDate = LocalDate.now();
					LocalDate checkinDate = convertToLocalDate(booking.getCheckinDate());
					LocalDate checkoutDate = convertToLocalDate(booking.getCheckoutDate());

					if (currentDate.isEqual(checkinDate)
							|| (currentDate.isAfter(checkinDate) && currentDate.isBefore(checkoutDate))
							|| currentDate.isEqual(checkoutDate)) {
						updateRoomStatusToInUse(booking.getRoomTable().getRoomId());
					} else {
						updateRoomStatusToAvailable(booking.getRoomTable().getRoomId());
					}
				}
			}
		}
	}

	public LocalDate convertToLocalDate(Date dateToConvert) {
		return Instant.ofEpochMilli(dateToConvert.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
	}

	private void updateRoomStatusToInUse(Integer roomId) {
		roomTableBean room = roomRepository.findById(roomId).orElse(null);

		if (room != null) {
			room.setStatus("使用中");
			roomRepository.save(room);
		}
	}

	private void updateRoomStatusToAvailable(Integer roomId) {
		roomTableBean room = roomRepository.findById(roomId).orElse(null);

		if (room != null) {
			room.setStatus("可使用");
			roomRepository.save(room);
		}
	}

	// 檢查房間是否有訂單在當前日期
	@Override
	public boolean hasOrderDuringCurrentDate(roomTableBean room) {
		// 獲取當前日期
		LocalDate currentDate = LocalDate.now();
		// 獲取該房間的所有訂單
		List<bookingBean> orders = bookingRepository.findByRoomTableRoomId(room.getRoomId());
		System.out.println(orders);
		// 檢查是否有訂單在當前日期
		for (bookingBean order : orders) {
			LocalDate checkinDate = convertToLocalDate(order.getCheckinDate());
			LocalDate checkoutDate = convertToLocalDate(order.getCheckoutDate());
			System.out.println(checkinDate);
			System.out.println(checkoutDate);
			if ((currentDate.isEqual(checkinDate) || currentDate.isAfter(checkinDate))
					&& (currentDate.isEqual(checkoutDate) || currentDate.isBefore(checkoutDate))) {

				System.out.println(currentDate.isAfter(checkinDate));
				System.out.println((currentDate.isEqual(checkinDate) || currentDate.isAfter(checkinDate)));
				System.out.println((currentDate.isEqual(checkoutDate) || currentDate.isBefore(checkoutDate)));
				System.out.println(currentDate.isBefore(checkoutDate));
				return true;
			}
		}
		return false;
	}

}
