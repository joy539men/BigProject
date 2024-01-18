package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

import com.example.websocketdemo.WebsocketDemoApplication;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.booking", "com.example.demo", "com.example.payment", "com.example.websocketdemo","com.example.uploadImages", "com.example.roomTable"})  
public class SpringBootCrudApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(SpringBootCrudApplication.class, args);
	}

}
