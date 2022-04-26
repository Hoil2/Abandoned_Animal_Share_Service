package com.spring.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareCenterController {
	@RequestMapping("/shereCenterPageView")
	public String chats() {
		return "shereCenter";
	}
	

}
