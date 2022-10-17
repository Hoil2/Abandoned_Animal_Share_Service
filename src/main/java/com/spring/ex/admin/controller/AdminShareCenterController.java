package com.spring.ex.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class AdminShareCenterController {
	
	//@Inject AdminDashBoardService service;
	
	//관리자 페이지 메인 대시보드
	@RequestMapping(value = "/admin/shereCenter", method = RequestMethod.GET)
	public String AdminShereCenter() throws Exception {
		
		return "admin/animalcenter/sharecenter";
	}
	
}