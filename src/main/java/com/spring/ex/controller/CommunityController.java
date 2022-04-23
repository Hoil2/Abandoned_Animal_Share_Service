package com.spring.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@RequestMapping("/chats")
	public String chats() {
		return "community_chats";
	}
	
	@RequestMapping("/questions")
	public String questions() {
		return "community_questions";
	}
	
	@RequestMapping("/reviews")
	public String reviews() {
		return "community_reviews";
	}
	
	@RequestMapping("/studies")
	public String studies() {
		return "community_studies";
	}
}
