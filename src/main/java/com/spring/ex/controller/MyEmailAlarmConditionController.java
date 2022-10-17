package com.spring.ex.controller;

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
		
		model.addAttribute("emailAlarmCondition", eac);
		model.addAttribute("dogBreedList", shareCenterService.getAnimalBreedList("개"));
		model.addAttribute("catBreedList", shareCenterService.getAnimalBreedList("고양이"));
		model.addAttribute("etcBreedList", shareCenterService.getAnimalBreedList("기타축종"));
		
		return "mypage/manageMyEmailAlarmCondition";
	}
	
	// 이메일 알람 조건 설정 수정
	@RequestMapping("mypage/updateMyEmailAlarmCondition")
	public String updateMyEmailAlarmCondition(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
		}
		
		String[] _kinds = request.getParameterValues("kinds");
		String[] _breeds = request.getParameterValues("breeds"); 
		String[] _ages = request.getParameterValues("ages");
		String[] _sex = request.getParameterValues("sex");
		String[] _neuter_yn = request.getParameterValues("neuter_yn");
		String[] _ass_idList = request.getParameterValues("aas_idList"); // 보호소 id
		
		String kinds = String.join(",", _kinds);
		String breeds = String.join(",", _breeds);
		String ages = String.join(",", _ages);
		String sex = String.join(",", _sex);
		String neuter_yn = String.join(",", _neuter_yn);
		String ass_idList = String.join(",", _ass_idList);
		
		EmailAlarmConditionDTO eac = emailAlarmConditionService.getEmailAlarmCondition(memberDTO.getM_id());
		eac.setKind(kinds);
		eac.setBreed(breeds);
		eac.setAge(ages);
		eac.setSex(sex);
		eac.setNeuter_yn(neuter_yn);
		eac.setRegion(ass_idList);
		if(eac == null) {
			eac.setM_id(memberDTO.getM_id());
			emailAlarmConditionService.insertEmailAlarmCondition(eac);
		}
		else {
			emailAlarmConditionService.updateEmailAlarmCondition(eac);
		}
		System.out.println(eac);
		
		model.addAttribute("emailAlarmCondition", eac);
		// abandoned_animal_info에서 kind_cd distinct로 가져온것 select option으로 만들기
		// model.addAttribute("breedList", shareCenterService.getAnimalBreedList());
		
		return "mypage/manageMyEmailAlarmCondition";
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
