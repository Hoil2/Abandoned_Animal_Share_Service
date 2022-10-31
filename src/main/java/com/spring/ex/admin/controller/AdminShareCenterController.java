package com.spring.ex.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.admin.service.AdminShareCenterService;
import com.spring.ex.service.PagingService;
import com.spring.ex.service.ShareCenterService;

@Controller 
public class AdminShareCenterController {
	
	@Inject AdminShareCenterService adminService;
	@Inject ShareCenterService service;
	
	PagingService pagingService;
	//관리자 페이지 분양센터
	@RequestMapping(value = "/admin/shereCenter", method = RequestMethod.GET)
	public String AdminShereCenter(Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("TodayRegistrationCount", adminService.getTodayRegistrationCount());
		model.addAttribute("AnimalDeadlineCount", adminService.getAnimalDeadlineCount());
		model.addAttribute("ShelterCount", adminService.getShelterCount());
		model.addAttribute("ApiRenewalDate", adminService.getApiRenewalDate());
		model.addAttribute("AnimalProtectCount", adminService.getAnimalProtectCount());
		model.addAttribute("AnimalAdoptionCount", adminService.getAnimalAdoptionCount());
		model.addAttribute("AnimalReturnCount", adminService.getAnimalReturnCount());
		model.addAttribute("AnimalDeathCount", adminService.getAnimalDeathCount());
		
		
		HttpSession session = request.getSession();
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		//String searchTheme  = request.getParameter("searchTheme");
		//String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		
		if(StringUtils.hasText(searchTheme)) {
			searchTheme = "allTheme";
			session.setAttribute("searchTheme", "allTheme");
		} else if(!StringUtils.isEmpty(searchTheme)){
			session.setAttribute("searchTheme", searchTheme);
		}
		
		if(StringUtils.hasText(searchArea)) {
			searchArea = "allArea";
			session.setAttribute("searchArea", "allArea");
		} else if(!StringUtils.isEmpty(searchArea)){
			session.setAttribute("searchArea", searchArea);
		}
		
		if(StringUtils.hasText(searchAlignment)) {
			searchAlignment = "alignmentDay";
			session.setAttribute("alignment", "alignmentDay");
		} else if(!StringUtils.hasText(searchAlignment)){
			session.setAttribute("alignment", searchAlignment);
		}
		
		
		
		
		List<String> seletedBoxList = service.getShareCenterAreaList();
		model.addAttribute("areaList", seletedBoxList);
		
		
		return "admin/animalcenter/shareCenterAdmin";
	}
	
}