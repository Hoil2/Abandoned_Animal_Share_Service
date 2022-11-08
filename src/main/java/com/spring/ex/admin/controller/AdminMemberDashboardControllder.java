package com.spring.ex.admin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.admin.service.AdminMemberService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;

@Controller
public class AdminMemberDashboardControllder {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private AdminMemberService adminMemberService;
	
	private PagingService pagingService;
	
	@RequestMapping("admin/member")
	public String memberDashboardPage(HttpServletRequest request, Model model) {
		String searchCategory = request.getParameter("searchCategory");
		String searchKeyword = request.getParameter("searchKeyword");
		final int pageSize = 10;
		int memberPostCount = adminMemberService.getMemberPostCount(searchCategory, searchKeyword);
		pagingService = new PagingService(request, memberPostCount, pageSize);
		List<Map<String, Object>> memberBoard = adminMemberService.getMemberBoard(searchCategory, searchKeyword, pagingService.getNowPage(), pageSize);
		
		model.addAttribute("memberBoard", memberBoard);
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("searchCategory", searchCategory);
		model.addAttribute("searchKeyword", searchKeyword);
		return "admin/member/member_dashboard";
	}
	
	@RequestMapping("admin/memberDetail")
	public String memberViewPage(HttpServletRequest request, Model model) {
		request.getParameter("m_no");
		
		
		return "admin/member/member_detail";
	}
}
