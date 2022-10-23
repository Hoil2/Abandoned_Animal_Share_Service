package com.spring.ex.controller;

import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.dto.EmailAlarmConditionDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.service.EmailAlarmConditionService;
import com.spring.ex.service.ShareCenterService;

@Controller
public class MyEmailAlarmConditionController {
	
	@Inject
	private EmailAlarmConditionService emailAlarmConditionService;
	
	@Inject
	private ShareCenterService shareCenterService;
	
	// 이메일 알람 조건 설정 페이지
	@RequestMapping("mypage/manageMyEmailAlarmCondition")
	public String manageMyConditionEmailAlarm(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
		}
		
		EmailAlarmConditionDTO eac = emailAlarmConditionService.getEmailAlarmCondition(memberDTO.getM_id());
		System.out.println(eac);
		
		model.addAttribute("eac", eac);
		model.addAttribute("shareCenterService", shareCenterService);
		model.addAttribute("nowYear", Calendar.getInstance().get(Calendar.YEAR));
		
		return "mypage/manageMyEmailAlarmCondition";
	}
	
	// 이메일 알람 조건 저장
	@RequestMapping("mypage/updateMyEmailAlarmCondition")
	public String updateMyEmailAlarmCondition(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
		}
		
		String dog_breeds = null;
		String cat_breeds = null;
		String etc_breeds = null;
		String ages = null;
		String sexs = null;
		String neuterings = null;
		String shelter_ids = null;
		
		String[] _kinds = request.getParameterValues("kind[]");
		String[] _dog_breeds = request.getParameterValues("dog_breed[]");
		String[] _cat_breeds = request.getParameterValues("cat_breed[]");
		String[] _etc_breeds = request.getParameterValues("etc_breed[]");
		String[] _sexs = request.getParameterValues("sex[]");
		String[] _ages = request.getParameterValues("age[]");
		String[] _neuterings = request.getParameterValues("neutering[]");
		String[] _shelter_ids = request.getParameterValues("shelter_id[]"); // 보호소 id
		
		String kinds = String.join(",", _kinds); 
		if(_dog_breeds != null) dog_breeds = String.join(",", _dog_breeds);
		if(_cat_breeds != null) cat_breeds = String.join(",", _cat_breeds);
		if(_etc_breeds != null) etc_breeds = String.join(",", _etc_breeds);
		if(_ages != null) ages = String.join(",", _ages);
		if(_sexs != null) sexs = String.join(",", _sexs);
		if(_neuterings != null) neuterings = String.join(",", _neuterings);
		if(_shelter_ids != null) shelter_ids = String.join(",", _shelter_ids);
		
		System.out.println("kinds : " + kinds);
		System.out.println("dog_breeds : " + dog_breeds);
		System.out.println("cat_breeds : " + cat_breeds);
		System.out.println("etc_breeds : " + etc_breeds);
		System.out.println("ages : " + ages);
		System.out.println("sexs : " + sexs);
		System.out.println("neuterings : " + neuterings);
		System.out.println("shelter_ids : " + shelter_ids);
		
		EmailAlarmConditionDTO eac = emailAlarmConditionService.getEmailAlarmCondition(memberDTO.getM_id());
		if(eac == null) {
			eac = new EmailAlarmConditionDTO();
			eac.setM_id(memberDTO.getM_id());
			eac.setKinds(kinds);
			eac.setDog_breeds(dog_breeds);
			eac.setCat_breeds(cat_breeds);
			eac.setEtc_breeds(etc_breeds);
			eac.setAges(ages);
			eac.setSexs(sexs);
			eac.setNeuterings(neuterings);
			eac.setShelter_ids(shelter_ids);
			emailAlarmConditionService.insertEmailAlarmCondition(eac);
		}
		else {
			eac.setKinds(kinds);
			eac.setDog_breeds(dog_breeds);
			eac.setCat_breeds(cat_breeds);
			eac.setEtc_breeds(etc_breeds);
			eac.setAges(ages);
			eac.setSexs(sexs);
			eac.setNeuterings(neuterings);
			eac.setShelter_ids(shelter_ids);
			emailAlarmConditionService.updateEmailAlarmCondition(eac);
		}
		System.out.println(eac);
		
		model.addAttribute("emailAlarmCondition", eac);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping("/getSelectAnimalBreedList")
	public String getAnimalBreedList(HttpServletRequest request, Model model) {
		String kind = request.getParameter("kind");
		String engToKR = "";
		if(kind.equals("dog")) 
			engToKR = "개";
		else if(kind.equals("cat"))
			engToKR = "고양이";
		else engToKR = "기타축종";
			
			
		System.out.println("kind" + kind);
		System.out.println("breedList" + shareCenterService.getAnimalBreedList(engToKR));
		
		model.addAttribute("animalBreedList", shareCenterService.getAnimalBreedList(engToKR));
		model.addAttribute("kind", kind);
		return "mypage/module/breedSelectList";
	}
}
