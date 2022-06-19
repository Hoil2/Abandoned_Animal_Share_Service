package com.spring.ex.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.dto.EmailAlarmDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.MemberPetDTO;
import com.spring.ex.service.EmailAlarmService;
import com.spring.ex.service.MemberPetService;

@Controller
public class MyPageController {
	@Inject
	private MemberPetService memberPetService;
	
	@Inject
	private EmailAlarmService emailAlarmService;
	
	@RequestMapping("mypage")
	public String myPage(HttpServletRequest request) {
		return "mypage/mypage";
	}
	
	@RequestMapping("mypage/manageMyPet")
	public String manageMyPet(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		List<MemberPetDTO> memberPetList = memberPetService.selectMemberPetList(memberDTO.getM_id());
		model.addAttribute("memberPetList", memberPetList);
		
		return "mypage/manageMyPet";
	}
	
	@RequestMapping("mypage/updateMyPet")
	public String updateMyPet(HttpServletRequest request) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		String[] desertion_noList = request.getParameterValues("desertion_no");
		String[] pet_nameList = request.getParameterValues("pet_name");
		
		List<MemberPetDTO> memberPetList = new ArrayList<MemberPetDTO>();
		System.out.println(memberDTO);
		System.out.println(desertion_noList);
		System.out.println(pet_nameList);
		if(desertion_noList != null) {
			for(int i = 0; i < desertion_noList.length; i++) {
				MemberPetDTO memberPetDTO = new MemberPetDTO();
				memberPetDTO.setM_id(memberDTO.getM_id());
				memberPetDTO.setDesertion_no(desertion_noList[i]);
				memberPetDTO.setPet_name(pet_nameList[i]);
				System.out.println(memberPetDTO);
				memberPetList.add(memberPetDTO);
			}
		}
		
		memberPetService.updateMemberPet(memberDTO.getM_id(), memberPetList);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping("mypage/manageMyEmailAlarm")
	public String manageMyEmailAlarm(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		List<EmailAlarmDTO> emailAlarmList = emailAlarmService.getEmailAlarmListByM_id(memberDTO.getM_id());
		System.out.println(emailAlarmList);
		
		model.addAttribute("emailAlarmList", emailAlarmList);
		
		return "mypage/manageMyEmailAlarm";
	}
	
	@RequestMapping("mypage/updateMyEmailAlarm")
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
