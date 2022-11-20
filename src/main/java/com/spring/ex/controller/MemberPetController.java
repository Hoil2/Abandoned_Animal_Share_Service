package com.spring.ex.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.MemberPetDTO;
import com.spring.ex.service.MemberPetService;

@Controller
public class MemberPetController {
	
	@Inject
	private MemberPetService memberPetService;
	
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
}
