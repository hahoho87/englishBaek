package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/about/*")
@AllArgsConstructor
public class MainController {

	@GetMapping("/about")
	public void about() {
	}
	
	@GetMapping("/contact")
	public void contact() {
	}
	@GetMapping("/facilities")
	public void facilities() {
	}
	
	@GetMapping("/history")
	public void history() {
	}
	
}  
