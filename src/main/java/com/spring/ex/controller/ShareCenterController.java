package com.spring.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shereCenter")
public class ShareCenterController {
	@RequestMapping("/cneterView")
	public String chats() {
		return "shereCenter";
	}
	

}
