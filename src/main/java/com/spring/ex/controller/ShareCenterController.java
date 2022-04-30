package com.spring.ex.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.service.ShareCenterService;

@Controller
public class ShareCenterController {
	@Inject
	ShareCenterService service;
	
	//분양센터페이지 유기동물 목록 출력
	@RequestMapping("/shereCenterPage")
	public String shereCenterPage() {
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
