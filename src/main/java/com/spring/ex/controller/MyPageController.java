package com.spring.ex.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.dto.EmailAlarmConditionDTO;
import com.spring.ex.dto.EmailAlarmDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.MemberPetDTO;
import com.spring.ex.service.EmailAlarmConditionService;
import com.spring.ex.service.EmailAlarmService;
import com.spring.ex.service.LostAnimalService;
import com.spring.ex.service.MemberPetService;

@Controller
public class MyPageController {
	@Inject
	private MemberPetService memberPetService;
	
	@Inject
	private EmailAlarmService emailAlarmService;
	
	@Inject
	private EmailAlarmConditionService emailAlarmConditionService;
	
	@Inject
	private LostAnimalService lostAnimalService;
	
	@RequestMapping("mypage")
	public String myPage(HttpServletRequest request) {
		return "mypage/mypage";
	}
	
	// 나의 반려동물 관리 페이지
	@RequestMapping("mypage/manageMyPet")
	public String manageMyPet(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		List<MemberPetDTO> memberPetList = memberPetService.selectMemberPetList(memberDTO.getM_id());
		model.addAttribute("memberPetList", memberPetList);
		
		return "mypage/manageMyPet";
	}
	
	// 나의 반려동물 수정
	@RequestMapping("mypage/updateMyPet")
	public String updateMyPet(HttpServletRequest request) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		String[] desertion_noList = request.getParameterValues("mp_id");
		String[] nameList = request.getParameterValues("name");
		
		/*
		List<MemberPetDTO> memberPetList = new ArrayList<MemberPetDTO>();
		System.out.println(memberDTO);
		System.out.println(desertion_noList);
		System.out.println(nameList);
		if(desertion_noList != null) {
			for(int i = 0; i < desertion_noList.length; i++) {
				MemberPetDTO memberPetDTO = new MemberPetDTO();
				memberPetDTO.setM_id(memberDTO.getM_id());
				System.out.println(memberPetDTO);
				memberPetList.add(memberPetDTO);
			}
		}
		
		memberPetService.updateMemberPet(memberDTO.getM_id(), memberPetList);
		*/
		return "redirect:/mypage";
	}
	
	// 좋아요 표시한 동물 알람 관리 페이지
	@RequestMapping("mypage/manageMyGoodAnimalEmailAlarm")
	public String manageMyEmailAlarm(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		List<EmailAlarmDTO> emailAlarmList = emailAlarmService.getEmailAlarmListByM_id(memberDTO.getM_id());
		System.out.println(emailAlarmList);
		
		model.addAttribute("emailAlarmList", emailAlarmList);
		
		return "mypage/manageMyGoodAnimalEmailAlarm";
	}
	
	// 좋아요 표시한 동물 알람 
	@RequestMapping("mypage/updateMyGoodEmailAlarm")
	public String updateMyEmailAlarm(HttpServletRequest request) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		String[] desertion_noList = request.getParameterValues("desertion_no");
		
		List<EmailAlarmDTO> emailAlarmList = new ArrayList<EmailAlarmDTO>();
		System.out.println(memberDTO);
		System.out.println(desertion_noList);
		
		if(desertion_noList != null) {
			for(int i = 0; i < desertion_noList.length; i++) {
				EmailAlarmDTO emailAlarmDTO = new EmailAlarmDTO();
				emailAlarmDTO.setM_id(memberDTO.getM_id());
				emailAlarmDTO.setDesertion_no(desertion_noList[i]);
				emailAlarmDTO.setEa_classify(2);
				System.out.println(emailAlarmDTO);
				emailAlarmList.add(emailAlarmDTO);
			}
		}
		emailAlarmService.updateEmailAlarm(memberDTO.getM_id(), emailAlarmList);
		
		return "redirect:/mypage";
	}
}
