package com.spring.ex.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.admin.service.AdminShareCenterService;

@Controller 
public class AdminShareCenterController {
	
	@Inject AdminShareCenterService service;
	
	//관리자 페이지 분양센터
	@RequestMapping(value = "/admin/shereCenter", method = RequestMethod.GET)
	public String AdminShereCenter(Model model) throws Exception {
		model.addAttribute("TodayRegistrationCount", service.getTodayRegistrationCount());
		model.addAttribute("AnimalDeadlineCount", service.getAnimalDeadlineCount());
		model.addAttribute("ShelterCount", service.getShelterCount());
		model.addAttribute("ApiRenewalDate", service.getApiRenewalDate());
		model.addAttribute("AnimalProtectCount", service.getAnimalProtectCount());
		model.addAttribute("AnimalAdoptionCount", service.getAnimalAdoptionCount());
		model.addAttribute("AnimalReturnCount", service.getAnimalReturnCount());
		model.addAttribute("AnimalDeathCount", service.getAnimalDeathCount());
		
		
		return "admin/animalcenter/sharecenter";
	}
	
}