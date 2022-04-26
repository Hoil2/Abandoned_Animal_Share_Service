package com.spring.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {
	
	@RequestMapping("/main")
	public String mainPage() {
		return "index";
	}
	
	@RequestMapping("/")
	public String startPage() {
		return "index";
	}
	
}
