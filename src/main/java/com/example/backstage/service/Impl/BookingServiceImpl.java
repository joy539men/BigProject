package com.example.backstage.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.backstage.dao.BookingRepository;
import com.example.backstage.service.BookingService;
import com.example.demo.model.bookingBean;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {

	private static Logger log = LoggerFactory.getLogger(BookingServiceImpl.class);
	
	BookingRepository bookingRepository;
	
//	@Autowired
	public BookingServiceImpl(BookingRepository bookingRepository) {
		super();
		this.bookingRepository = bookingRepository;
	}

	@Override
	public void save(bookingBean bookingBean) {
		bookingRepository.save(bookingBean);
		log.info("修改會員狀態功能之Sservice: 資料新增成功, UserBean=" + bookingBean);
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
}
