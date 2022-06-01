package com.spring.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.PagingDTO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.service.PagingService;
import com.spring.ex.service.ShareCenterService;

@Controller
public class ShareCenterController {
	@Inject
	ShareCenterService service;
	
	PagingService pagingService;
	
	//분양센터페이지 유기동물 목록 출력
	@RequestMapping(value = "/shereCenterPage" , method = RequestMethod.GET)
	public String shereCenterPage(Model model, HttpServletRequest request) throws Exception{
		/*
		pagingService.put("searchArea", "");
		map.put("searchTheme", "");
		map.put("alignment", "");
		List<ShareCenterDTO> shareCenterList = service.getShareCenterBoardPage(pagingService.getMap());
		
		pagingService.PagingService(request, service.getShareCenterBoardViewTotalCount(map), 12, searchTheme, searchArea, searchAlignment);
		
		model.addAttribute("slist", shareCenterList);
		model.addAttribute("Paging", pagingService.getPaging());*/
		HttpSession session = request.getSession();
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		//String searchTheme  = request.getParameter("searchTheme");
		//String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		
		if(StringUtils.isEmpty(searchTheme) || searchTheme == null) {
			searchTheme = "allTheme";
			session.setAttribute("searchTheme", "allTheme");
		} else if(!StringUtils.isEmpty(searchTheme)){
			session.setAttribute("searchTheme", searchTheme);
		}
		
		if(StringUtils.isEmpty(searchArea) || searchArea == null) {
			searchArea = "allArea";
			session.setAttribute("searchArea", "allArea");
		} else if(!StringUtils.isEmpty(searchArea)){
			session.setAttribute("searchArea", searchArea);
		}
		
		if(StringUtils.isEmpty(searchAlignment)) {
			searchAlignment = "alignmentDay";
			session.setAttribute("alignment", "alignmentDay");
		} else if(!StringUtils.isEmpty(searchAlignment)){
			session.setAttribute("alignment", searchAlignment);
		}
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchArea", (String) session.getAttribute("searchArea"));
		searchMap.put("searchTheme", (String) session.getAttribute("searchTheme"));
		searchMap.put("alignment", (String) session.getAttribute("alignment"));
		
		//페이징
		int totalCount = service.getShareCenterBoardViewTotalCount(searchMap);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		PagingDTO paging = new PagingDTO();
		paging.setPageNo(page);
		paging.setPageSize(12);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 12;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		map.put("searchArea", session.getAttribute("searchArea"));
		map.put("searchTheme", session.getAttribute("searchTheme"));
		map.put("alignment", session.getAttribute("alignment"));
		
		//검색 및 결과값 담기
		List<ShareCenterDTO> slist = service.getShareCenterBoardPage(map);
		
		model.addAttribute("slist", slist);
		model.addAttribute("Paging", paging);
		model.addAttribute("searchArea", searchArea);
		model.addAttribute("searchTheme", searchTheme);
		model.addAttribute("alignment", searchAlignment);
		System.out.println("검색 지역/테마/정렬 : " + searchArea + ", " + searchTheme + ", " + searchAlignment);
		
		List<String> seletedBoxList = service.getShareCenterAreaList();
		model.addAttribute("areaList", seletedBoxList);
		System.out.println(seletedBoxList);
		return "shereCenter";
	}
	//유기동물 게시글 상세페이지 출력
	@RequestMapping(value = "/shereCenterReadPage" , method = RequestMethod.GET)
	public String shereCenterReadPage(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String desertion_no = request.getParameter("desertion_no");
		Map<String, Object> sReadPage = service.getShareCenterBoardReadPage(desertion_no);
		
		if(request.getSession().getAttribute("member") != null) {
			MemberDTO memberDto = (MemberDTO) request.getSession().getAttribute("member");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("m_id", memberDto.getM_id());
			map.put("desertion_no", desertion_no);
			System.out.println("좋아요 회원/게시글" + map);
			
			int boardLikeCheck = service.getGoodCheckShareCenterBoardReadPage(map);
			model.addAttribute("boardLikeCheck", boardLikeCheck);
			System.out.println("회원 번호 : " + memberDto.getM_id());
		}
		System.out.println("상세페이지 데이터 : " + sReadPage);
		
		Cookie viewCookie = null;
		Cookie[] cookies = request.getCookies();
		System.out.println("cookie : "+cookies);
		if(cookies !=null) {
			for (int i = 0; i < cookies.length; i++) {
				//System.out.println("쿠키 이름 : "+cookies[i].getName());
				//만들어진 쿠키들을 확인하며, 만약 들어온 적 있다면 생성되었을 쿠키가 있는지 확인
				if(cookies[i].getName().equals("|"+desertion_no+"|")) {
					System.out.println("if문 쿠키 이름 : "+cookies[i].getName());
					//찾은 쿠키를 변수에 저장
					viewCookie=cookies[i];
				}
			}
		}else {
			System.out.println("cookies 확인 로직 : 쿠키가 없습니다.");
		}
		//만들어진 쿠키가 없음을 확인
		if(viewCookie==null) {
			System.out.println("viewCookie 확인 로직 : 쿠키 없당");
			Cookie newCookie=new Cookie("|"+desertion_no+"|","readCount");	//이 페이지에 왔다는 증거용(?) 쿠키 생성
			response.addCookie(newCookie);
			service.addShareCenterBoardReadPageHit(desertion_no); 			//쿠키가 없으니 증가 로직 진행
		//만들어진 쿠키가 있으면 증가로직 진행하지 않음
		} else {
			System.out.println("viewCookie 확인 로직 : 쿠키 있당");
			String value=viewCookie.getValue();
			System.out.println("viewCookie 확인 로직 : 쿠키 value : "+value);
		}
		
		model.addAttribute("scrReadPage", sReadPage);
		return "shereCenterRead";
	}
	
	//유기동물 게시글 좋아요 삭제
	@RequestMapping(value = "/subtractGoodShareCenter" , method = RequestMethod.GET)
	public String subtractGoodShareCenter(Model model, HttpServletRequest request) throws Exception{
		MemberDTO memberDto = (MemberDTO) request.getSession().getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", memberDto.getM_id());
		map.put("desertion_no", request.getParameter("desertion_no"));
		service.subtractGoodShareCenterReadPage(map);
		
		return "shereCenterRead";
	}
	
	//유기동물 게시글 좋아요 추가
	@RequestMapping(value = "/addGoodShareCenter" , method = RequestMethod.GET)
	public String addGoodShareCenter(Model model, HttpServletRequest request) throws Exception{
		MemberDTO memberDto = (MemberDTO) request.getSession().getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", memberDto.getM_id());
		map.put("desertion_no", request.getParameter("desertion_no"));
		service.addGoodShareCenterReadPage(map);
		
		return "shereCenterRead";
	}
	
	
	@RequestMapping(value = "/sTestPage",  method = RequestMethod.GET)
	public String shereCenterPageView2( ShareCenterDTO dto) throws Exception {
		service.getShareCenterTest(dto);
		
		return "shereCenterTest";
	}
	
	
	//Db연결 확인
	@RequestMapping("/sTest")
	public String DBConTest(HttpServletRequest request) throws Exception {
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchArea", "allArea");
		searchMap.put("searchTheme", "allTheme");
		searchMap.put("searchKeyword", "alignmentDay");
		
		int res = service.getShareCenterBoardViewTotalCount(searchMap);
		
		System.out.println("res :" + res);
		return "shereCenter"; 
	}
	

}
