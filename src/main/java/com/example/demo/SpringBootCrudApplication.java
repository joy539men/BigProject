package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

import com.example.websocketdemo.WebsocketDemoApplication;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.booking"})  
@Import(WebsocketDemoApplication.class)
public class SpringBootCrudApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(SpringBootCrudApplication.class, args);
	}

}
