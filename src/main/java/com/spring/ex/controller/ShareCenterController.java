package com.spring.ex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.PagingDTO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.dto.ShelterDTO;
import com.spring.ex.service.PagingService;
import com.spring.ex.service.ShareCenterService;
import com.spring.ex.util.AbandonedAnimalApi;
import com.spring.ex.util.DateCalculation;

@Controller
public class ShareCenterController {
	@Inject
	ShareCenterService service;
	
	PagingService pagingService;
	DateCalculation dateCalculation = new DateCalculation();
	AbandonedAnimalApi abandonedAnimalApi = new AbandonedAnimalApi();
	
	//분양센터페이지 유기동물 목록 출력
	@RequestMapping(value = "/shereCenterPage" , method = RequestMethod.GET)
	public String shereCenterPage(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
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
		
		if(StringUtils.isEmpty(searchAlignment) || searchAlignment == null) {
			searchAlignment = "alignmentDay";
			session.setAttribute("alignment", "alignmentDay");
		} else if(!StringUtils.isEmpty(searchAlignment)){
			session.setAttribute("alignment", searchAlignment);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchArea", session.getAttribute("searchArea"));
		map.put("searchTheme", session.getAttribute("searchTheme"));
		map.put("alignment", session.getAttribute("alignment"));
		
		int totolCount = service.getShareCenterBoardViewTotalCount(map);
		pagingService = new PagingService(request, totolCount, 12);
		map.put("Page", pagingService.getNowPage());
		map.put("PageSize", 12);
		
		
		List<ShareCenterDTO> slist = service.getShareCenterBoardPage(map);
		List<String> seletedBoxList = service.getShareCenterAreaList();
		
		
		model.addAttribute("sTotolCount", totolCount);
		model.addAttribute("slist", slist);
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("areaList", seletedBoxList);
		System.out.println("검색 지역/테마/정렬 : " + searchArea + ", " + searchTheme + ", " + searchAlignment);
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
		if(cookies !=null) {
			for (int i = 0; i < cookies.length; i++) {
				System.out.println("쿠키 이름 : "+cookies[i].getName());
				//만들어진 쿠키들을 확인하며, 만약 들어온 적 있다면 생성되었을 쿠키가 있는지 확인
				if(cookies[i].getName().equals("|"+desertion_no+"|")) {
					System.out.println("if문 쿠키 이름 : "+cookies[i].getName());
					
					viewCookie=cookies[i];								//찾은 쿠키를 변수에 저장
				}
			}
		}else {
			System.out.println("cookies 확인 로직 : 쿠키가 없습니다.");
		}
		
		if(viewCookie==null) {												//만들어진 쿠키가 없음을 확인
			System.out.println("viewCookie 확인 로직 : 쿠키 없당");
			Cookie newCookie=new Cookie("|"+desertion_no+"|","readCount");	//이 페이지에 왔다는 증거용(?) 쿠키 생성
			response.addCookie(newCookie);
			service.addShareCenterBoardReadPageHit(desertion_no); 			//쿠키가 없으니 증가 로직 진행
			model.addAttribute("hitReadPage", 1);
		} else {
			model.addAttribute("hitReadPage", 0);
			System.out.println("viewCookie 확인 로직 : 쿠키 있당");			//만들어진 쿠키가 있으면 증가로직 진행하지 않음
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
	public String shereCenterPageView2(ShareCenterDTO dto, ShelterDTO shelterDto) throws Exception {
		
		return "shereCenterTest";
	}
	
	
	// api 데이터 요청
	@RequestMapping(value = "/abandonedAnimalApiRequest", method = RequestMethod.GET)
	@ResponseBody
	public int abandonedAnimalApiRequest(ShareCenterDTO dto, ShelterDTO shelterDto, HttpServletRequest request) throws Exception {
		int resultDb = 0, result = 0;
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String endApiRequest = formatter.format(date);
		
		String startApiRequest = dateCalculation.addDate(endApiRequest, 0, 0, -20);
		int apiTotalCount = Integer.valueOf(abandonedAnimalApi.getTotalCountRequestApiAbandonedAnimal(startApiRequest, endApiRequest));
		System.out.println(apiTotalCount);
		System.out.println(apiTotalCount/1000);
		int pageNum = apiTotalCount/1000;
		int pageCalculation = apiTotalCount % 1000;
		
		if(pageCalculation > 0) {
			System.out.println("마지막페이지 데이터 수 : " + pageCalculation );
			resultDb += service.getShareCenterRequest(shelterDto, pageNum+1, startApiRequest, endApiRequest);
			
		}else {
			resultDb += service.getShareCenterRequest(shelterDto, pageNum, startApiRequest, endApiRequest);
		}
		
		System.out.println(apiTotalCount + " / " + resultDb);
		if (apiTotalCount == resultDb) {
			result = 1;
		}
		
		return result; 
	}
	

}
