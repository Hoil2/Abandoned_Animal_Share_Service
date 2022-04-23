package com.spring.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NotesController {
	@RequestMapping("/notes")
	public String note() {
		return "notes";
	}
}
