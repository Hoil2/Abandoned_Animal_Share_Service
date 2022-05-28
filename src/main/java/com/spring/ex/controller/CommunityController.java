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

import com.spring.ex.dto.MemberDTO;
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
	
	@RequestMapping("/dictionary")
	public String dictionary(Model model, HttpServletRequest request) throws Exception {
		// null 값으로 mybatis에 들어가면 문자열과 비교하게 되므로 오류남. 따라서 null이면 ""으로 변환
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		filter = filter == null ? "" : filter;
		keyword = keyword == null ? "" : keyword;
		System.out.println("filter : " + filter + ", keyword : " + keyword);
		
		// 게시물 총 개수를 가져오기 위한 조건 맵
		HashMap<String, Object> postCountMap = new HashMap<String, Object>();
		postCountMap.put("classify", dictBoard);
		postCountMap.put("filter", filter);
		postCountMap.put("keyword", keyword);
		
		// 게시물 개수 가져오기
		int totalCount = communityService.getCommunityBoardPostTotalCount(postCountMap);
		System.out.println("게시물 개수 : " + totalCount);
		
		// 게시물 개수를 바탕으로 페이지 설정
		int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		
		// 게시물 가져오기 위한 조건 맵
		HashMap<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("Page", pagingService.getNowPage());
		boardMap.put("PageSize", pageSize);
		boardMap.put("classify", dictBoard);
		boardMap.put("filter", filter);
		boardMap.put("keyword", keyword);
		
		// 게시물 가져오기
		List<HashMap<String, Object>> communityList = communityService.getBoardPage(boardMap);
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityList);
		model.addAttribute("filter", filter);
		model.addAttribute("keyword", keyword);
		model.addAttribute("member", request.getSession().getAttribute("member"));
		
		System.out.println(request.getSession().getAttribute("member"));
		
		return "community/dictionary";
	}
	
	
	// 지식백과 상세 페이지
	@RequestMapping("/dictionary/{pageNo}")
	public String dictionaryDetail(Model model, HttpServletRequest request, @PathVariable("pageNo") int pageNo) throws Exception {
		HashMap<String, Object> pageDetail = communityService.getPageDetail(pageNo);
		communityService.addHitToBoardPage(pageNo);
		
		model.addAttribute("pageDetail", pageDetail);
		model.addAttribute("member", request.getSession().getAttribute("member"));
		
		return "community/community_read";
	}
	
	// 일상 공유 게시판 페이지
	@RequestMapping("/community/daily")
	public String daily(Model model, HttpServletRequest request) throws Exception {
		// null 값으로 mybatis에 들어가면 문자열과 비교하게 되므로 오류남. 따라서 null이면 ""으로 변환
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		filter = filter == null ? "" : filter;
		keyword = keyword == null ? "" : keyword;
		System.out.println("filter : " + filter + ", keyword : " + keyword);
		
		// 게시물 총 개수를 가져오기 위한 조건 맵
		HashMap<String, Object> postCountMap = new HashMap<String, Object>();
		postCountMap.put("classify", dailyBoard);
		postCountMap.put("filter", filter);
		postCountMap.put("keyword", keyword);
		
		// 게시물 개수 가져오기
		int totalCount = communityService.getCommunityBoardPostTotalCount(postCountMap);
		System.out.println("게시물 개수 : " + totalCount);
		
		// 게시물 개수를 바탕으로 페이지 설정
		int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		
		// 게시물 가져오기 위한 조건 맵
		HashMap<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("Page", pagingService.getNowPage());
		postMap.put("PageSize", pageSize);
		postMap.put("classify", dailyBoard);
		postMap.put("filter", filter);
		postMap.put("keyword", keyword);
		
		// 게시물 가져오기
		List<HashMap<String, Object>> communityList = communityService.getBoardPage(postMap);
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityList);
		model.addAttribute("filter", filter);
		model.addAttribute("keyword", keyword);
		model.addAttribute("member", request.getSession().getAttribute("member"));
		
		return "community/community_daily";
	}
	
	// 일상 공유 상세 페이지
	@RequestMapping("/community/daily/{pageNo}")
	public String dailyDetail(Model model, HttpServletRequest request, @PathVariable("pageNo") int pageNo) throws Exception {
		HashMap<String, Object> pageDetail = communityService.getPageDetail(pageNo);
		communityService.addHitToBoardPage(pageNo);
		int likeCnt = communityService.getCommunityLikeCount(pageNo);
		List<HashMap<String, Object>> commentList = communityService.getComment(pageNo);
		
		boolean existLike; 
		if(communityService.existCommunityLike(pageNo, 2) == 1) // m_id 임시
			existLike = true;
		else existLike= false;
		
		model.addAttribute("pageDetail", pageDetail);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("clist", commentList);
		model.addAttribute("member", request.getSession().getAttribute("member"));
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("existLike", existLike);
		
		return "community/community_read";
	}
	
	// 정보 공유 게시판 페이지
	@RequestMapping("/community/info")
	public String infoDetail(Model model, HttpServletRequest request) throws Exception {
		// null 값으로 mybatis에 들어가면 문자열과 비교하게 되므로 오류남. 따라서 null이면 ""으로 변환
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		filter = filter == null ? "" : filter;
		keyword = keyword == null ? "" : keyword;
		System.out.println("filter : " + filter + ", keyword : " + keyword);
		
		// 게시물 총 개수를 가져오기 위한 조건 맵
		HashMap<String, Object> postCountMap = new HashMap<String, Object>();
		postCountMap.put("classify", infoBoard);
		postCountMap.put("filter", filter);
		postCountMap.put("keyword", keyword);
		
		// 게시물 개수 가져오기
		int totalCount = communityService.getCommunityBoardPostTotalCount(postCountMap);
		System.out.println("게시물 개수 : " + totalCount);
		
		// 게시물 개수를 바탕으로 페이지 설정
		int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		
		// 게시물 가져오기 위한 조건 맵
		HashMap<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("Page", pagingService.getNowPage());
		postMap.put("PageSize", pageSize);
		postMap.put("classify", infoBoard);
		postMap.put("filter", filter);
		postMap.put("keyword", keyword);
		
		// 게시물 가져오기
		List<HashMap<String, Object>> communityList = communityService.getBoardPage(postMap);
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityList);
		model.addAttribute("filter", filter);
		model.addAttribute("keyword", keyword);
		model.addAttribute("member", request.getSession().getAttribute("member"));
		
		return "community/community_info";
	}
	
	// 정보 공유 상세 페이지
	@RequestMapping("/community/info/{pageNo}")
	public String read(Model model, HttpServletRequest request, @PathVariable("pageNo") int pageNo) throws Exception {
		HashMap<String, Object> pageDetail = communityService.getPageDetail(pageNo);
		List<HashMap<String, Object>> commentList = communityService.getComment(pageNo);
		
		communityService.addHitToBoardPage(pageNo);
		
		model.addAttribute("pageDetail", pageDetail);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("clist", commentList);
		model.addAttribute("member", request.getSession().getAttribute("member"));
		
		return "community/community_read";
	}
	
	// 게시물 작성 페이지
	@RequestMapping("/write")
	public String write(Model model, HttpServletRequest request) throws Exception {
		// 글쓰기를 누른 게시판의 분류 코드 전달
		model.addAttribute("classify", Integer.parseInt(request.getParameter("classify")));
		model.addAttribute("member", request.getSession().getAttribute("member"));
		
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
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		String title = request.getParameter("title").toString();
		String content = request.getParameter("content").toString();
		String classify = request.getParameter("classify");
		Date reg_date = new Date(System.currentTimeMillis());
		
		// 등록 실패
		if(title.equals("") || content.equals("")) { 
			return "redirect:/error"; 
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", memberDTO.getM_id());
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
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cb_id", request.getParameter("pageNo"));
		map.put("m_id", memberDTO.getM_id());
		map.put("content", request.getParameter("content"));
		map.put("reg_date", new Date(System.currentTimeMillis()));
		
		communityService.submitComment(map);
		
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping("/communityClickedLike")
	public String communityClickedLike(HttpServletRequest request) {
		System.out.println("받음");
		int cb_id = Integer.parseInt(request.getParameter("cb_id"));
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		String status = request.getParameter("status");
		if(status.equals("true")) {
			communityService.insertCommunityLike(cb_id, member.getM_id());
		}
		else {
			communityService.deleteCommunityLike(cb_id, member.getM_id());
		}
		
		return "redirect:" + request.getHeader("referer");
	}
	
}
