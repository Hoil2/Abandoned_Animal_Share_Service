package com.spring.ex.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		pagingService = new PagingService(request, service.getShareCenterBoardViewTotalCount(), 12);
		List<ShareCenterDTO> shareCenterList = service.getShareCenterBoardPage(pagingService.getMap());
		
		String alignment = request.getParameter("alignment");
		System.out.println(alignment);
		
		model.addAttribute("slist", shareCenterList);
		model.addAttribute("Paging", pagingService.getPaging());
		return "shereCenter";
	}
	
	@RequestMapping(value = "/sTestPage",  method = RequestMethod.GET)
	public String shereCenterPageView2( ShareCenterDTO dto) throws Exception {
		service.getShareCenterTest(dto);
		
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
