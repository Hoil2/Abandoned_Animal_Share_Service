package com.spring.ex.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.MemberPetEmailAlarmDTO;
import com.spring.ex.service.MemberPetEmailAlarmService;

@Controller
public class DailyAlarmController {

	@Inject
	private MemberPetEmailAlarmService memberPetEmailAlarmService;
	
	// 좋아요 표시한 동물 알람 관리 페이지
	@RequestMapping("mypage/memberPetEmailAlarm")
	public String memberPetEmailAlarm(HttpServletRequest request, Model model) {
		MemberDTO member= (MemberDTO)request.getSession().getAttribute("member");
		
		List<MemberPetEmailAlarmDTO> memberPetEmailAlarmList = memberPetEmailAlarmService.getMemberPetEmailAlarmList(member.getM_id());
		
		model.addAttribute("memberPetEmailAlarmList", memberPetEmailAlarmList);
		
		return "mypage/memberPetEmailAlarm";
	}
	
	// 좋아요 표시한 동물 알람 
	@RequestMapping("mypage/deleteMemberPetEmailAlarm")
	public String deleteMemberPetEmailAlarm(HttpServletRequest request) {
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		int mpea_id = Integer.parseInt(request.getParameter("mpea_id"));
		
		memberPetEmailAlarmService.deleteMemberPetEmailAlarm(mpea_id);
		System.out.println("memberPetEmailAlarm 삭제 : " + mpea_id);
		
		return "redirect:/mypage/memberPetEmailAlarm";
	}
}
