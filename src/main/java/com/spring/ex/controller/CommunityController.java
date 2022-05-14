package com.spring.ex.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.ex.service.CommunityService;
import com.spring.ex.service.FileUploadService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;

@Controller
public class CommunityController {
	private final int dictBoard = 1;
	private final int dailyBoard = 2;
	private final int infoBoard = 3;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Autowired
	ServletContext servletContext;
	
	@Inject
	CommunityService communityService;
	
	@Inject
	MemberService memberService;
	
	PagingService pagingService;
	
	@Inject
	FileUploadService fileUploadService;
	
	// 지식백과 페이지
	/*@RequestMapping(value="/dictionary", method=RequestMethod.POST)
	public String dictionaryPost(Model model, HttpServletRequest request) throws Exception {
		int totalCount = communityService.getCommunityBoardPostTotalCount(dictBoard);
		int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", pagingService.getNowPage());
		map.put("PageSize", pageSize);
		map.put("classify", dictBoard);
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityService.getBoardPage(map));
		
		return "community/dictionary";
	}*/
	
	@RequestMapping("/dictionary")
	public String dictionaryGet(Model model, HttpServletRequest request) throws Exception {
		int totalCount = communityService.getCommunityBoardPostTotalCount(dictBoard);
		int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		List<HashMap<String, Object>> communityList = null;
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Page", pagingService.getNowPage());
		map.put("PageSize", pageSize);
		map.put("classify", dictBoard);
		
		System.out.println("filter : " + filter + ", keyword : " + keyword);
		
		if(keyword == null) {
			System.out.println("노멀 실행");
			communityList = communityService.getBoardPage(map);
		}
		else {
			System.out.println("쿼리 실행");
			map.put("keyword", keyword);
			if(filter.equals("title"))
				communityList = communityService.getBoardPageWithTitle(map);
			else if(filter.equals("content"))
				communityList = communityService.getBoardPageWithContent(map);
			else if(filter.equals("title+content"))
				communityList = communityService.getBoardPageWithTitleOrContent(map);
		}
		
		
		System.out.println(communityList);
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityList);
		
		return "community/dictionary";
	}
	
	
	// 지식백과 상세 페이지
	@RequestMapping("/dictionary/{pageNo}")
	public String dictionaryDetail(Model model, @PathVariable("pageNo") int pageNo) throws Exception {
		HashMap<String, Object> pageDetail = communityService.getPageDetail(pageNo);
		communityService.addHitToBoardPage(pageNo);
		
		model.addAttribute("pageDetail", pageDetail);
		
		return "community/community_read";
	}
	
	// 일상 공유 게시판 페이지
	@RequestMapping("/community/daily")
	public String daily(Model model, HttpServletRequest request) throws Exception {
		int totalCount = communityService.getCommunityBoardPostTotalCount(dictBoard);
		int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Page", pagingService.getNowPage());
		map.put("PageSize", pageSize);
		map.put("classify", dailyBoard);
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityService.getBoardPage(map));
		
		return "community/community_daily";
	}
	
	// 일상 공유 상세 페이지
	@RequestMapping("/community/daily/{pageNo}")
	public String dailyDetail(Model model, @PathVariable("pageNo") int pageNo) throws Exception {
		HashMap<String, Object> pageDetail = communityService.getPageDetail(pageNo);
		communityService.addHitToBoardPage(pageNo);
		
		List<HashMap<String, Object>> commentList = communityService.getComment(pageNo);
		
		model.addAttribute("pageDetail", pageDetail);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("clist", commentList);
		
		return "community/community_read";
	}
	
	// 정보 공유 게시판 페이지
	@RequestMapping("/community/info")
	public String infoDetail(Model model, HttpServletRequest request) throws Exception {
		int totalCount = communityService.getCommunityBoardPostTotalCount(infoBoard);
		int pageSize = 10;
		pagingService = new PagingService(request, totalCount, pageSize);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Page", pagingService.getNowPage());
		map.put("PageSize", pageSize);
		map.put("classify", infoBoard);
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityService.getBoardPage(map));
		
		return "community/community_info";
	}
	
	// 정보 공유 상세 페이지
	@RequestMapping("/community/info/{pageNo}")
	public String read(Model model, @PathVariable("pageNo") int pageNo) throws Exception {
		HashMap<String, Object> pageDetail = communityService.getPageDetail(pageNo);
		communityService.addHitToBoardPage(pageNo);
		
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
	@RequestMapping(value="/submitPost", method=RequestMethod.POST)
	public String submitPost(HttpServletRequest request, @RequestParam(value="file", required = false) MultipartFile file) throws Exception {
		String img_path = null;
		
		if(file != null) { 
			img_path = fileUploadService.uploadFile(file, "/images/uploaded_images");
		}
		
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
		map.put("img_path", img_path);
		map.put("reg_date", reg_date);
		map.put("classify", Integer.parseInt(classify));
		
		communityService.submitPost(map);
		System.out.println("게시물 등록 성공");
		
		// 뒤로가기
		
		switch(Integer.parseInt(classify)) {
			case 1:
				return "redirect:/dictionary";
			case 2:
				return "redirect:/community/daily";
			case 3:
				return "redirect:/community/info";
			default:
				return "redirect:/";
		}
	}
	
	// 댓글 달기
	@RequestMapping("/submitComment")
	public String submitComment(HttpServletRequest request) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cb_id", request.getParameter("pageNo"));
		map.put("m_id", 2);
		map.put("content", request.getParameter("content"));
		map.put("reg_date", new Date(System.currentTimeMillis()));
		
		communityService.submitComment(map);
		
		return "redirect:"+request.getHeader("Referer");
	}
}
