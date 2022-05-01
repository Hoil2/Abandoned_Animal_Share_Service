package com.spring.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@RequestMapping("/daily")
	public String chats() {
		return "community/community_daily";
	}
	
	@RequestMapping("/info")
	public String questions() {
		return "community/community_info";
	}
}
