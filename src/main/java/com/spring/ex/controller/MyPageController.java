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
	
	@RequestMapping("mypage/manageMyGoodAnimalEmailAlarm")
	public String manageMyEmailAlarm(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		List<EmailAlarmDTO> emailAlarmList = emailAlarmService.getEmailAlarmListByM_id(memberDTO.getM_id());
		System.out.println(emailAlarmList);
		
		model.addAttribute("emailAlarmList", emailAlarmList);
		
		return "mypage/manageMyGoodAnimalAlarm";
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
		
		return "mypage/manageMyEmailAlarmCondition";
	}
	
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
		model.addAttribute("kindList", lostAnimalService.getKindListWithDistinct());
		
		return "mypage/manageMyEmailAlarmCondition";
	}
}
