package com.spring.ex.admin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex.admin.service.AdminCommunityService;
import com.spring.ex.admin.service.AdminMemberPetService;
import com.spring.ex.admin.service.AdminMemberService;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.MemberPetDTO;
import com.spring.ex.service.LostAnimalService;
import com.spring.ex.service.MemberPetService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;

@Controller
public class AdminMemberDashboardControllder {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private AdminMemberService adminMemberService;
	
	@Inject
	LostAnimalService lostAnimalService;
	
	@Inject
	private MemberPetService memberPetService;
	
	@Inject
	private AdminMemberPetService adminMemberPetService;
	
	@Inject
	private AdminCommunityService adminCommunityService;
	
	
	@RequestMapping("admin/member")
	public String memberDashboardPage(HttpServletRequest request, Model model) {
		String searchCategory = request.getParameter("searchCategory");
		String searchKeyword = request.getParameter("searchKeyword");
		final int pageSize = 10;
		int memberPostCount = adminMemberService.getMemberPostCount(searchCategory, searchKeyword);
		PagingService pagingService = new PagingService(request, memberPostCount, pageSize, "page");
		List<Map<String, Object>> memberBoard = adminMemberService.getMemberBoard(searchCategory, searchKeyword, pagingService.getNowPage(), pageSize);
		
		model.addAttribute("memberBoard", memberBoard);
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("searchCategory", searchCategory);
		model.addAttribute("searchKeyword", searchKeyword);
		return "admin/member/member_dashboard";
	}
	
	@RequestMapping("admin/memberDetail")
	public String memberDetailPage(HttpServletRequest request, Model model) throws Exception {
		int m_id = Integer.parseInt(request.getParameter("m_id"));
		MemberDTO member = memberService.getMemberByM_id(m_id);
		final int pageSize = 5;
		int memberPetPostTotalCount = adminMemberPetService.getAdminMemberPetPostTotalCount(m_id);
		PagingService petPagingService = new PagingService(request, memberPetPostTotalCount, pageSize, "petPage");
		List<MemberPetDTO> memberPetList = adminMemberPetService.getAdminMemberPetBoard(m_id, petPagingService.getNowPage(), pageSize);
		
		int memberPostTotalCount = adminCommunityService.getAdminMemberPostTotalCount(m_id);
		PagingService communityPagingService = new PagingService(request, memberPostTotalCount, pageSize, "communityPage");
		List<Map<String, Object>> memberPostList = adminCommunityService.getAdminMemberBoard(m_id, communityPagingService.getNowPage(), pageSize);
		System.out.println("communityPagingService.getPaging() : " + communityPagingService.getPaging());
		model.addAttribute("mDetail", member);
		model.addAttribute("memberPetList", memberPetList);
		model.addAttribute("memberPostList", memberPostList);
		model.addAttribute("petPaging", petPagingService.getPaging());
		model.addAttribute("communityPaging", communityPagingService.getPaging());
		
		return "admin/member/member_detail";
	}
	
	@RequestMapping("admin/memberPetDetail")
	public String memberPetDetailPage(HttpServletRequest request, Model model) throws Exception {
		int mp_id = Integer.parseInt(request.getParameter("mp_id"));
		MemberPetDTO memberPet = memberPetService.getMemberPet(mp_id);
		
		model.addAttribute("memberPet", memberPet);
		
		return "admin/member/member_pet_detail";
	}
	
	
	@ResponseBody
	@RequestMapping("admin/insertMember")
	public void insertMember(HttpServletRequest request) {
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String region = request.getParameter("region");
		String tel = request.getParameter("tel");
		String grade = request.getParameter("grade");
		String comment = request.getParameter("comment");
		
		if(email == null || pw == null || name == null || region == null || tel == null || grade == null) {
			System.err.println("insertMember null 값이 있습니다.");
			System.err.println("email : " + email + ", pw : " + pw + ", name : " + name + ", region : " + region + ", tel : " + tel + ", grade : " + grade);
			return;
		}
		
		MemberDTO m = new MemberDTO();
		m.setEmail(email);
		m.setM_pw(pw);
		m.setName(name);
		m.setRegion(region);
		m.setPhone(tel);
		m.setGrade(grade);
		m.setComment(comment);
		adminMemberService.insertMember(m);
		System.out.println("회원 추가 : " + m);
	}
	
	@ResponseBody
	@RequestMapping("admin/updateMember")
	public void updateMember(HttpServletRequest request) throws Exception {
		int m_id = Integer.parseInt(request.getParameter("m_id"));
		String region = request.getParameter("region");
		String tel = request.getParameter("tel");
		String grade = request.getParameter("grade");
		String comment = request.getParameter("comment");
		
		MemberDTO m = memberService.getMemberByM_id(m_id);
		m.setRegion(region);
		m.setPhone(tel);
		m.setGrade(grade);
		m.setComment(comment);
		adminMemberService.updateMember(m);
		System.out.println("회원 수정 : " + m);
	}
	
	@ResponseBody
	@RequestMapping("admin/deleteMembers")
	public int deleteMember(HttpServletRequest request) {
		try {
			String[] m_idList = request.getParameterValues("valueArr");
			for(String m_id : m_idList) {
				adminMemberService.deleteMember(Integer.parseInt(m_id));
				System.out.println("회원 삭제 : " + m_id);
			}
			return 1;
		}
		catch(Exception e) {
			return 0;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("admin/member/emailCheck") 
	public int memberEmailCheck(HttpServletRequest request) throws Exception {
		String email = request.getParameter("email");
		MemberDTO member = memberService.getMemberByEmail(email);
		System.out.println("member : " + member);
		if(member == null) {
			return 1;
		}
		else {
			return 0;
		}
	}
}
