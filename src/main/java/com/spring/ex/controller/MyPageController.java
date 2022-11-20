package com.spring.ex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("mypage")
	public String myPage(HttpServletRequest request) {
		return "mypage/mypage";
	}
}
