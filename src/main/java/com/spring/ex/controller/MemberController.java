package com.spring.ex.controller;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.dto.MemberDTO;
import com.spring.ex.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	// 회원가입
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public String signUp(HttpServletRequest request) throws Exception {
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		String name = request.getParameter("Name");
		String region = request.getParameter("Region");
		String phone = request.getParameter("Phone");
		String grade = request.getParameter("Grade");
		Date signup_date = new Date(System.currentTimeMillis());
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);
		memberDTO.setM_pw(password);
		memberDTO.setName(name);
		memberDTO.setRegion(region);
		memberDTO.setPhone(phone);
		memberDTO.setGrade(grade);
		memberDTO.setSignup_date(signup_date);
		
		memberService.signUp(memberDTO);
		return "redirect:" + request.getHeader("Referer");
	}	
	
	// 로그인
	@RequestMapping(value="/signIn", method = RequestMethod.POST)
	public String signIn(HttpServletRequest request) throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		MemberDTO memberDTO = memberService.signIn(email, password);
		
		if(memberDTO != null) {
			System.out.println("로그인 성공");
		}
		else {
			System.out.println("로그인 실패");
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("member", memberDTO);
		
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value="/signOut", method = RequestMethod.GET)
	public String signOut(HttpServletRequest request) throws Exception {
		request.getSession().invalidate();
		return "redirect:" + request.getHeader("Referer");
	}
}
