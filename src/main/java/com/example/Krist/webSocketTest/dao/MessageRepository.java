package com.example.Krist.webSocketTest.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.messageBean;
import com.example.demo.model.userBean;

import java.util.List;

public interface MessageRepository extends JpaRepository<messageBean, Integer> {

    List<messageBean> findBySenderId(userBean sender);

    List<messageBean> findByReceiverId(userBean receiver);

    // 其他可能的查詢方法

}
