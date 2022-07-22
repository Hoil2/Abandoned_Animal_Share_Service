package com.spring.ex.controller;

import java.sql.Date;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex.dto.CommentDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.service.CommunityService;

@Controller
public class CommunityCommentController {
	
	@Inject
	CommunityService communityService;
	
	// 댓글 달기
	@ResponseBody
	@RequestMapping("/community/submitComment")
	public void submitComment(HttpServletRequest request) throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setCb_id(Integer.parseInt(request.getParameter("pageNo")));
		commentDTO.setM_id(memberDTO.getM_id());
		commentDTO.setCbr_content(request.getParameter("content"));
		commentDTO.setReg_date(new Date(System.currentTimeMillis()));
		communityService.insertComment(commentDTO);
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping("/community/updateComment")
	public void updateComment(HttpServletRequest request) throws Exception {
		int cbr_id = Integer.parseInt(request.getParameter("cbr_id"));
		String content = request.getParameter("content");
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setCbr_id(cbr_id);
		commentDTO.setCbr_content(content);
		System.out.println("commentDTO : " + commentDTO);
		communityService.updateComment(commentDTO);
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("/community/deleteComment")
	public void deleteComment(HttpServletRequest request) throws Exception {
		int cbr_id = Integer.parseInt(request.getParameter("cbr_id"));
		System.out.println("cbr_id : " + cbr_id);
		communityService.deleteComment(cbr_id);
	}
}
