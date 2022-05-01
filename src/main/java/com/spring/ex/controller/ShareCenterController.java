package com.spring.ex.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.dto.PagingDTO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.service.ShareCenterService;

@Controller
public class ShareCenterController {
	@Inject
	ShareCenterService service;
	
	//분양센터페이지 유기동물 목록 출력
	@RequestMapping(value = "/shereCenterPage" , method = RequestMethod.GET)
	public String shereCenterPage(Model model, HttpServletRequest request) throws Exception{
		
		
		int totalCount = service.getShareCenterBoardViewTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		PagingDTO paging = new PagingDTO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		page = (page - 1) * 10;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		
		List<ShareCenterDTO> shareCenterList = service.getShareCenterBoardPage(map);
		model.addAttribute("slist", shareCenterList);
		model.addAttribute("Paging", paging);
		
		return "shereCenter";
	}
	
	@RequestMapping("/sTestPage")
	public String shereCenterPageView2() {
		return "shereCenterTest";
	}
	
	
	//Db연결 확인
	@RequestMapping("/sTest")
	public String DBConTest() throws Exception {
		int res = service.getShareCenterBoardViewTotalCount();
		
		System.out.println("res :" + res);
		
		return "shereCenter"; 
	}
	

}
