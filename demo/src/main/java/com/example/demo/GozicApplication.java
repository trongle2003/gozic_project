package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// @SpringBootApplication(exclude = {
// org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class,
// org.springframework.boot.autoconfigure.security.servlet.SecurityFilterAutoConfiguration.class,
// org.springframework.boot.actuate.autoconfigure.security.servlet.ManagementWebSecurityAutoConfiguration.class
// })
public class GozicApplication {

	public static void main(String[] args) {
		SpringApplication.run(GozicApplication.class, args);
	}

}
