package com.spring.ex.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.admin.service.AdminDashBoardService;

@Controller 
public class AdminDashBoardController {
	
	@Inject AdminDashBoardService service;
	
	//관리자 페이지 메인 대시보드
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public String AdminDashBoard(HttpSession session, Model model) throws Exception {
		
		model.addAttribute("todayRegisterMemberTotalCount", service.getTodayRegisterMemberTotalCount());
		model.addAttribute("todayBoardWriteTotalCount", service.getTodayBoardWriteTotalCount());
		model.addAttribute("todayAbandonedAnimalTotalCount", service.getTodayAbandonedAnimalTotalCount());
		model.addAttribute("todayProtectAbandonedAnimalTotalCount", service.getTodayProtectAbandonedAnimalTotalCount());
		
		return "admin/index";
	}
	
	//관리자 실종동물
	@RequestMapping(value = "/admin/lostAnimal", method = RequestMethod.GET)
	public String AdminLostAnimal(HttpSession session, Model model) throws Exception {
		return "admin/";
	}
	
}