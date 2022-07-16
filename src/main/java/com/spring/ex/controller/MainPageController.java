package com.spring.ex.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.service.MainPageService;

@Controller
public class MainPageController {
	
	@Inject
	MainPageService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage(Model model, HttpServletRequest request) throws Exception{
		model.addAttribute("pShareCenterList", service.getPopularityShareCenterList());
		model.addAttribute("pDailyBoardList", service.getPopularityDailyCommunityBoardList(2));
		model.addAttribute("slist", service.getMainPageLostAnimalBoardList());
		
		return "index";
	}
	
	@RequestMapping("/")
	public String startPage() {
		return "index";
	}
	
}
