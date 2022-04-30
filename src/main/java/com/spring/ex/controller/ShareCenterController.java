package com.spring.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareCenterController {
	@RequestMapping("/shereCenterPage")
	public String shereCenterPage() {
		return "shereCenter";
	}
	
	@RequestMapping("/sTestPage")
	public String shereCenterPageView2() {
		return "shereCenterTest";
	}
	
	@RequestMapping("/sTest")
	public int shereCenterTest() {
		int res = 0;
		
		
		
		
		return res; 
	}
	

}
