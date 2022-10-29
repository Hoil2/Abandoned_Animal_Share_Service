package com.spring.ex.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCommunityDashboardController {
	
	@RequestMapping("/admin/dictionary")
	public String dictionaryDashboardPage() {
		
		return "admin/community/dictionary_dashboard";
	}
	
	@RequestMapping("/admin/daily")
	public String dailyDashboardPage() {
		
		return "admin/community/daily_dashboard";
	}
	
	@RequestMapping("/admin/info")
	public String infoDashboardPage() {
		
		return "admin/community/info_dashboard";
	}
	
	
}
