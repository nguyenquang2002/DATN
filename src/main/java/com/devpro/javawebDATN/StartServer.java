package com.devpro.javawebDATN;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Cú pháp chạy 1 ứng dụng spring-boot
 * 1. Class phải annotation với @SpringBootApplication
 * 2. Trong hàm main SpringApplication.run(StartServer.class, args);
 * @author daing
 *
 */
@SpringBootApplication
public class StartServer {
	public static void main(String[] args) {
		SpringApplication.run(StartServer.class, args);
		
	}
}
