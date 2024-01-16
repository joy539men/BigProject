package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import com.example.websocketdemo.WebsocketDemoApplication;

@SpringBootApplication
@Import(WebsocketDemoApplication.class)
public class SpringBootCrudApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(SpringBootCrudApplication.class, args);
	}

}
