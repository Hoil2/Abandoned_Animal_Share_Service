package com.spring.ex.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.service.MemberService;

@Controller
public class AdminMemberDashboardControllder {
	
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping("admin/member")
	public String memberDashboardPage(HttpServletRequest request, Model model) {
		
		return "admin/member/member_dashboard";
	}
	
	@RequestMapping("admin/member/{m_id}")
	public String memberViewPage(@PathVariable("m_id") int m_id, HttpServletRequest request, Model model) {
		
		return "admin/member/member_view";
	}
}
