package com.spring.ex.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.EmailAlarmDTO;
import com.spring.ex.dto.EmailDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.MemberPetDTO;
import com.spring.ex.service.CommunityService;
import com.spring.ex.service.EmailAlarmService;
import com.spring.ex.service.EmailService;
import com.spring.ex.service.FileUploadService;
import com.spring.ex.service.MemberPetService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;

@Controller
public class CommunityController {
	private final int dictBoard = 1;
	private final int dailyBoard = 2;
	private final int infoBoard = 3;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Inject
	CommunityService communityService;
	
	@Inject
	MemberService memberService;
	
	PagingService pagingService;
	
	@Inject
	FileUploadService fileUploadService;
	
	@Inject
	private MemberPetService memberPetService;
	
	@Inject
	private EmailAlarmService emailAlarmService;
	
	@Inject
	private EmailService emailService;
	
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
		CommunityDTO pageDetail = communityService.getPageDetail(pageNo);
		communityService.addHitToBoardPage(pageNo);
		
		model.addAttribute("memberService", memberService);
		model.addAttribute("pageDetail", pageDetail);
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
		
		return "community/community_daily";
	}
	
	// 일상 공유 상세 페이지
	@RequestMapping("/community/daily/{pageNo}")
	public String dailyDetail(Model model, HttpServletRequest request, @PathVariable("pageNo") int pageNo) throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		CommunityDTO pageDetail = communityService.getPageDetail(pageNo);
		communityService.addHitToBoardPage(pageNo);
		int likeCnt = communityService.getCommunityLikeCount(pageNo);
		List<HashMap<String, Object>> commentList = communityService.selectCommentList(pageNo);
		
		if(memberDTO != null) {
			EmailAlarmDTO emailAlarmDTO = new EmailAlarmDTO();
			emailAlarmDTO.setM_id(memberDTO.getM_id());
			emailAlarmDTO.setDesertion_no(pageDetail.getDesertion_no());
			
			boolean existLike = (communityService.existCommunityLike(pageNo, memberDTO.getM_id()) == 1) ? true : false;
			boolean existAlarm = (emailAlarmService.existEmailAlarm(emailAlarmDTO) == 1) ? true : false;
			model.addAttribute("existLike", existLike);
			model.addAttribute("existAlarm", existAlarm);
		}
		
		model.addAttribute("memberService", memberService);
		model.addAttribute("pageDetail", pageDetail);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("clist", commentList);
		model.addAttribute("likeCnt", likeCnt);
		
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
		
		return "community/community_info";
	}
	
	// 정보 공유 상세 페이지
	@RequestMapping("/community/info/{pageNo}")
	public String read(Model model, HttpServletRequest request, @PathVariable("pageNo") int pageNo) throws Exception {
		CommunityDTO pageDetail = communityService.getPageDetail(pageNo);
		List<HashMap<String, Object>> commentList = communityService.selectCommentList(pageNo);
		
		communityService.addHitToBoardPage(pageNo);
		
		model.addAttribute("memberService", memberService);
		model.addAttribute("pageDetail", pageDetail);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("clist", commentList);
		
		return "community/community_read";
	}
	
	// 게시물 작성 페이지
	// 글쓰기 버튼으로 들어왔을 때
	@RequestMapping("/write")
	public String write(Model model, HttpServletRequest request) throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		int classify = Integer.parseInt(request.getParameter("classify"));
		
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
			return "error";
		}
		
		if(classify == dailyBoard) {
			List<MemberPetDTO> memberPetList = memberPetService.selectMemberPetList(memberDTO.getM_id());
			model.addAttribute("memberPetList", memberPetList);
		}
		
		// 글쓰기를 누른 게시판의 분류 코드 전달
		model.addAttribute("classify", classify);
		
		return "community/community_write";
	}
	
	// 수정 링크로 들어왔을 때
	@RequestMapping("/update")
	public String update(Model model, HttpServletRequest request) throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
			return "error";
		}
		
		// 게시물 수정으로 들어왔을 때
		String pageNo = request.getParameter("pageNo");
		if(pageNo != null) {
			CommunityDTO communityDTO = communityService.getPageDetail(Integer.parseInt(pageNo));
			if(communityDTO.getM_id() != memberDTO.getM_id()) {
				System.out.println("글을 수정할 권한이 없습니다.");
				return "error";
			}
			model.addAttribute("communityDTO", communityDTO);
			
			if(communityDTO.getClassify() == dailyBoard) {
				List<MemberPetDTO> memberPetList = memberPetService.selectMemberPetList(memberDTO.getM_id());
				model.addAttribute("memberPetList", memberPetList);
			}
			model.addAttribute("classify", communityDTO.getClassify());
		}
		else {
			System.out.println("수정할 게시물을 찾을 수 없습니다.");
			return "error";
		}
		
		return "community/community_write";
	}
	
	// 게시물 등록
	@RequestMapping(value="/submitPost", method=RequestMethod.POST)
	public String submitPost(HttpServletRequest request) throws Exception {
		String img_path = null;
		
		System.out.println("시작");
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
			return "error";
		}
		String pageNo = request.getParameter("pageNo"); // 수정할 게시물은 pageNo를 전송
		String title = request.getParameter("title").toString();
		String content = request.getParameter("content").toString();
		int classify = Integer.parseInt(request.getParameter("classify"));
		Date reg_date = new Date(System.currentTimeMillis());
		String desertion_no = request.getParameter("desertion_no");
		
		System.out.println("content : " + content);
		
		// 등록 실패
		if(title.equals("") || content.equals("")) { 
			return "redirect:/error"; 
		}
		
		CommunityDTO communityDTO = new CommunityDTO();
		communityDTO.setM_id(memberDTO.getM_id());
		communityDTO.setDesertion_no(desertion_no);
		communityDTO.setTitle(title);
		communityDTO.setContent(content);
		communityDTO.setImg_path(img_path);
		communityDTO.setReg_date(reg_date);
		communityDTO.setClassify(classify);
		
		if(pageNo == null) {
			communityService.submitPost(communityDTO);
			System.out.println("게시물 등록 성공");
			
			for(EmailAlarmDTO ead : emailAlarmService.getEmailAlarmList(desertion_no)) {
				MemberDTO md = memberService.getMemberByM_id(ead.getM_id());
				EmailDTO emailDTO = new EmailDTO(
						emailService.getAdminEmailAddress(), 					// from
						md.getEmail(), 						 					// to
						"유기동물 분양 센터 - 알림", 				 					// title
						"알림 설정하신 " + desertion_no + "의 새로운 소식이 등록되었습니다." // contents
					);
				emailService.sendEmail(emailDTO);
			}
		}
		else { 
			communityService.updatePost(communityDTO);
			System.out.println("게시물 수정 성공");
		}
		
		// 뒤로가기
		switch(classify) {
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
	
	@RequestMapping("/communityClickedLike")
	public String communityClickedLike(HttpServletRequest request) {
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
	
	@RequestMapping("/communityClickedAlarm")
	public String communityClickedAlarm(HttpServletRequest request) {
		String desertion_no = request.getParameter("desertion_no");
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		String status = request.getParameter("status");
		
		EmailAlarmDTO emailAlarmDTO = new EmailAlarmDTO();
		emailAlarmDTO.setM_id(member.getM_id());
		emailAlarmDTO.setDesertion_no(desertion_no);
		emailAlarmDTO.setEa_classify(2);
		
		System.out.println(status);
		
		if(status.equals("true")) {
			System.out.println("알람 추가");
			emailAlarmService.insertEmailAlarm(emailAlarmDTO);
		}
		else {
			System.out.println("알람 삭제");
			emailAlarmService.deleteEmailAlarm(emailAlarmDTO);
		}
	
		return "redirect:" + request.getHeader("referer");
	}
	
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/images/uploaded_images/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/images/uploaded_images/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}
