package com.spring.ex.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex.dto.MemberPetEmailAlarmDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.MemberPetDTO;
import com.spring.ex.service.EmailAlarmConditionService;
import com.spring.ex.service.MemberPetEmailAlarmService;
import com.spring.ex.service.LostAnimalService;
import com.spring.ex.service.MemberPetService;

@Controller
public class MyPageController {
	@Inject
	private MemberPetService memberPetService;
	
	@Inject
	private MemberPetEmailAlarmService emailAlarmService;
	
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
		System.out.println(memberPetList);
		model.addAttribute("memberPetList", memberPetList);
		
		return "mypage/manageMyPet";
	}
	
	@RequestMapping("mypage/insertMemberPet")
	public String insertMemberPet(HttpServletRequest request) {
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String kind = request.getParameter("kind");
		String breed = request.getParameter("breed");
		
		MemberPetDTO mp = new MemberPetDTO();
		mp.setM_id(member.getM_id());
		mp.setName(name);
		mp.setSex(sex);
		mp.setAge(age);
		mp.setKind(kind);
		mp.setBreed(breed);
		
		memberPetService.insertMemberPet(mp);
		System.out.println("회원 펫 추가 : " + mp);
		
		return "redirect:/mypage/manageMyPet";
	}
	
	// 나의 반려동물 수정
	@RequestMapping("mypage/updateMemberPet")
	public String updateMyPet(HttpServletRequest request) {
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		int mp_id = Integer.parseInt(request.getParameter("mp_id"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String kind = request.getParameter("kind");
		String breed = request.getParameter("breed");
		
		MemberPetDTO mp = memberPetService.getMemberPet(mp_id);
		mp.setName(name);
		mp.setSex(sex);
		mp.setAge(age);
		mp.setKind(kind);
		mp.setBreed(breed);
		
		memberPetService.updateMemberPet(mp);
		
		return "redirect:/mypage/manageMyPet";
	}
	
	// 수정을 위해 반려동물 정보 불러오기
	@ResponseBody
	@RequestMapping("mypage/updateMemberPet/getMemberPet")
	public MemberPetDTO getMemberPet(HttpServletRequest request) {
		int mp_id = Integer.parseInt(request.getParameter("mp_id"));
		MemberPetDTO memberPet = memberPetService.getMemberPet(mp_id);
		
		return memberPet;
	}
	
	@ResponseBody
	@RequestMapping("mypage/deleteMemberPet")
	public void deleteMemberPet(HttpServletRequest request) {
		int mp_id = Integer.parseInt(request.getParameter("mp_id"));
		
		memberPetService.deleteMemberPet(mp_id);
		System.out.println("반려동물 삭제 : " + mp_id);
	}
	
	// 좋아요 표시한 동물 알람 관리 페이지
	@RequestMapping("mypage/manageMyGoodAnimalEmailAlarm")
	public String manageMyEmailAlarm(HttpServletRequest request, Model model) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		List<MemberPetEmailAlarmDTO> emailAlarmList = emailAlarmService.getEmailAlarmListByM_id(memberDTO.getM_id());
		System.out.println(emailAlarmList);
		
		model.addAttribute("emailAlarmList", emailAlarmList);
		
		return "mypage/manageMyGoodAnimalEmailAlarm";
	}
	
	// 좋아요 표시한 동물 알람 
	@RequestMapping("mypage/updateMyGoodEmailAlarm")
	public String updateMyEmailAlarm(HttpServletRequest request) {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		String[] desertion_noList = request.getParameterValues("desertion_no");
		
		List<MemberPetEmailAlarmDTO> emailAlarmList = new ArrayList<MemberPetEmailAlarmDTO>();
		System.out.println(memberDTO);
		System.out.println(desertion_noList);
		
		if(desertion_noList != null) {
			for(int i = 0; i < desertion_noList.length; i++) {
				MemberPetEmailAlarmDTO emailAlarmDTO = new MemberPetEmailAlarmDTO();
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
