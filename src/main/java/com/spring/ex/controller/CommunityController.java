package com.spring.ex.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.service.CommunityService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Inject
	CommunityService communityService;
	
	@Inject
	MemberService memberService;
	
	PagingService pagingService;
	
	// 일상 공유 게시판 페이지
	@RequestMapping("/daily")
	public String daily(Model model, HttpServletRequest request) {
		return "community/community_daily";
	}
	
	
	// 정보 공유 게시판 페이지
	@RequestMapping("/info")
	public String info(Model model, HttpServletRequest request) throws Exception {
		int totalCount = communityService.getCommunityInfoBoardPostTotalCount();
		int pageSize = 10;
		
		pagingService = new PagingService(request, totalCount, pageSize);
		
		List<HashMap<String, Object>> communityList = communityService.getCommunityInfoBoardPage(pagingService.getMap());
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityList);
		
		return "community/community_info";
	}
	
	@RequestMapping("/info/{pageNo}")
	public String read(Model model, @PathVariable("pageNo") int pageNo) throws Exception {
		HashMap<String, Object> pageDetail = communityService.getPageDetail(pageNo);
		
		model.addAttribute("pageDetail", pageDetail);
		
		return "community/community_read";
	}
	
	// 게시물 작성 페이지
	@RequestMapping("/write")
	public String write(Model model, HttpServletRequest request) throws Exception {
		// 글쓰기를 누른 게시판의 분류 코드 전달
		model.addAttribute("classify", Integer.parseInt(request.getParameter("classify")));
		
		return "community/community_write";
	}
	
	// 게시물 등록
	@RequestMapping("/submitPost")
	public String submitPost(HttpServletRequest request) throws Exception {
		
		System.out.println("시작");
		String email = request.getParameter("email").toString();
		System.out.println(email);
		String password = request.getParameter("password").toString();
		System.out.println(password);
		String title = request.getParameter("title").toString();
		System.out.println(title);
		String content = request.getParameter("content").toString();
		System.out.println(content);
		String classify = request.getParameter("classify");
		System.out.println(classify);
		Date reg_date = new Date(System.currentTimeMillis());
		System.out.println(reg_date);
		
		// 등록 실패
		if(email.equals("") || password.equals("") || title.equals("") || content.equals("")) { 
			return "redirect:/error"; 
		}
		int id = 0;
		try {
			id = memberService.findUserId(email, password);
		} catch(Exception e) {
			System.out.println("id 찾기 실패");
			return "redirect:/error";
		}
		
		System.out.println("id 찾기 성공 : " + id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", id);
		map.put("title", title);
		map.put("content", content);
		map.put("classify", Integer.parseInt(classify));
		map.put("reg_date", reg_date);
		
		communityService.submitInfoPost(map);
		System.out.println("게시물 등록 성공");
		
		return "redirect:/community/info";
	}
}
