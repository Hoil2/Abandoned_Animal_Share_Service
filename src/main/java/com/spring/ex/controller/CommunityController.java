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
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
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
import com.spring.ex.dto.FileUploadDTO;
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
	
	// 지식백과 게시판 페이지
	@RequestMapping("/community/dictionary")
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
		pagingService = new PagingService(request, totalCount, pageSize, "page");
		
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
	@RequestMapping("/community/dictionary/{pageNo}")
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
		pagingService = new PagingService(request, totalCount, pageSize, "page");
		
		// 게시물 가져오기 위한 조건 맵
		HashMap<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("Page", pagingService.getNowPage());
		postMap.put("PageSize", pageSize);
		postMap.put("classify", dailyBoard);
		postMap.put("filter", filter);
		postMap.put("keyword", keyword);
		
		// 게시물 가져오기
		List<HashMap<String, Object>> communityList = communityService.getBoardPage(postMap);
		for(int i = 0; i < communityList.size(); i++) 
		{
			Document doc = Jsoup.parseBodyFragment(communityList.get(i).get("content").toString());
			Elements imgs = doc.getElementsByTag("img");
			if(imgs.size() > 0) {
				communityList.get(i).put("img_path", imgs.get(0).attr("src"));
			}
		}
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
			/*EmailAlarmDTO emailAlarmDTO = new EmailAlarmDTO();
			emailAlarmDTO.setM_id(memberDTO.getM_id());
			emailAlarmDTO.setDesertion_no(pageDetail.getMp_id());*/
			
			boolean existLike = (communityService.existCommunityLike(pageNo, memberDTO.getM_id()) == 1) ? true : false;
			//boolean existAlarm = (emailAlarmService.existEmailAlarm(emailAlarmDTO) == 1) ? true : false;
			model.addAttribute("existLike", existLike);
			//model.addAttribute("existAlarm", existAlarm);
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
	public String info(Model model, HttpServletRequest request) throws Exception {
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
		pagingService = new PagingService(request, totalCount, pageSize, "page");
		
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
	public String infoDetail(Model model, HttpServletRequest request, @PathVariable("pageNo") int pageNo) throws Exception {
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
	@RequestMapping("/writePost")
	public String writePost(Model model, HttpServletRequest request) throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		Date reg_date = new Date(System.currentTimeMillis());
		int classify = Integer.parseInt(request.getParameter("classify"));
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
			return "error";
		}
		
		if(classify == dailyBoard) {
			List<MemberPetDTO> memberPetList = memberPetService.selectMemberPetList(memberDTO.getM_id());
			model.addAttribute("memberPetList", memberPetList);
		}
		
		CommunityDTO communityDTO = new CommunityDTO();
		communityDTO.setM_id(memberDTO.getM_id());
		communityDTO.setReg_date(reg_date);
		communityDTO.setClassify(classify);
		communityDTO.setEnable(0);
		
		communityService.insertPost(communityDTO);
		
		model.addAttribute("communityDTO", communityDTO);
		model.addAttribute("update", false);
		
		return "community/community_write";
	}
	
	// 수정 링크로 들어왔을 때
	@RequestMapping("/updatePost")
	public String updatePost(Model model, HttpServletRequest request) throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
			return "error";
		}
		
		String pageNo = request.getParameter("pageNo");
		if(pageNo != null) {
			CommunityDTO communityDTO = communityService.getPageDetail(Integer.parseInt(pageNo));
			if(communityDTO.getM_id() == memberDTO.getM_id()) {
				model.addAttribute("communityDTO", communityDTO);
				model.addAttribute("classify", communityDTO.getClassify());
				model.addAttribute("update", true);
				if(communityDTO.getClassify() == dailyBoard) {
					List<MemberPetDTO> memberPetList = memberPetService.selectMemberPetList(memberDTO.getM_id());
					model.addAttribute("memberPetList", memberPetList);
				}
			}
			else {
				System.out.println("글을 수정할 권한이 없습니다.");
				return "error";
			}
		}
		else {
			System.out.println("수정할 게시물을 찾을 수 없습니다.");
			return "error";
		}
		
		return "community/community_write";
	}
	
	// 게시물 등록
	@RequestMapping(value="/savePost", method=RequestMethod.POST)
	public String savePost(HttpServletRequest request) throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO == null) {
			System.out.println("로그인이 필요합니다.");
			return "redirect:error";
		}
		String pageNo = request.getParameter("pageNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int classify = Integer.parseInt(request.getParameter("classify"));
		String mp_id = request.getParameter("mp_id");
		
		// 등록 실패
		if(title.equals("") || content.equals("")) { 
			return "redirect:error";
		}
		
		CommunityDTO communityDTO = new CommunityDTO();
		communityDTO.setCb_id(Integer.parseInt(pageNo));
		communityDTO.setM_id(memberDTO.getM_id());
		if(mp_id != null) communityDTO.setMp_id(Integer.parseInt(mp_id));
		communityDTO.setTitle(title);
		communityDTO.setContent(content);
		communityDTO.setClassify(classify);
		communityDTO.setEnable(1);
		System.out.println(communityDTO);
		communityService.updatePost(communityDTO);
		
		System.out.println("게시물 등록 성공");
			
		/*for(EmailAlarmDTO ead : emailAlarmService.getEmailAlarmList(desertion_no)) {
			MemberDTO md = memberService.getMemberByM_id(ead.getM_id());
			EmailDTO emailDTO = new EmailDTO(
					emailService.getAdminEmailAddress(), 					// from
					md.getEmail(), 						 					// to
					"유기동물 분양 센터 - 알림", 				 					// title
					"알림 설정하신 " + desertion_no + "의 새로운 소식이 등록되었습니다." // contents
				);
			emailService.sendEmail(emailDTO);
		}*/
		
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		
		// html의 src값을 추출
		List<String> srcList = communityService.convertHtmlToSrcList(content); 
		
		// 서버에 저장된 이미지를 로컬에 복사
		communityService.copySrcListToLocal(srcList, contextRoot);
		
		// 해당 게시물의 임시 + 모든 파일의 url 가져오기
		List<String> uploadedUrlList = communityService.selectUrlListByCb_id(communityDTO.getCb_id());
		
		communityService.deleteFileNotInMain(srcList, uploadedUrlList, contextRoot);
		
		return "redirect:" + communityService.convertClassifyToUrl(classify) + "/" + communityDTO.getCb_id();
	}
	
	@ResponseBody
	@RequestMapping("/cancelPost")
	public void cancelPost(HttpServletRequest request) throws Exception {
		System.out.println("게시물 수정 취소");
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		
		CommunityDTO communityDTO = communityService.getPageDetail(pageNo);
		// html의 src값을 추출
		List<String> srcList = communityService.convertHtmlToSrcList(communityDTO.getContent()); 
		
		// 해당 게시물의 모든 파일의 url 가져오기
		List<String> uploadedUrlList = communityService.selectUrlListByCb_id(pageNo);
		
		// 임시로 저장된 파일 삭제
		communityService.deleteFileNotInMain(srcList, uploadedUrlList, contextRoot);
	}
	
	// 게시물 삭제
	@ResponseBody
	@RequestMapping("/deletePost")
	public String deletePost(HttpServletRequest request) throws Exception {
		System.out.println("게시물 삭제");
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		CommunityDTO communityDTO = communityService.getPageDetail(pageNo);
		if(member == null) {
			System.out.println("삭제할 권한이 없습니다.");
			return "error";
		}
		
		if(member.getM_id() == communityDTO.getM_id() || member.getGrade().equals("admin")) {
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			// 데이터베이스에서 게시물의 모든 파일 정보 불러오고 삭제하기
			List<FileUploadDTO> fileUploadDTOList = communityService.selectFileListByCb_id(pageNo);
			for(int i = 0; i < fileUploadDTOList.size(); i++) {
				communityService.deleteFileEveryWhere(fileUploadDTOList.get(i).getUrl(), contextRoot);
			}
			communityService.deletePost(pageNo);
			System.out.println("게시물 삭제 성공");
	 	}
		else {
			System.out.println("삭제할 권한이 없습니다.");
			return "error";
		}
		
		return communityService.convertClassifyToUrl(communityDTO.getClassify());
	}
	
	// 서버에만 이미지 임시로 저장
	@ResponseBody
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request ) throws Exception {
		int cb_id = Integer.parseInt(request.getParameter("cb_id"));
		JsonObject jsonObject = new JsonObject();
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"/resources/images/uploaded_images/";
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		File serverFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, serverFile);	// 서버에 파일 저장
			jsonObject.addProperty("url", "/resources/images/uploaded_images/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			
			// 데이터베이스에 게시판 id와 경로 저장
			FileUploadDTO fileUploadDTO = new FileUploadDTO();
			fileUploadDTO.setCb_id(cb_id);
			fileUploadDTO.setUrl("/resources/images/uploaded_images/"+savedFileName);
			communityService.insertFile(fileUploadDTO);
		} catch (IOException e) {
			FileUtils.deleteQuietly(serverFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			communityService.deleteFileByUrl("/resources/images/uploaded_images/"+savedFileName);
			e.printStackTrace();
		} 
		String a = jsonObject.toString();
		return a;
	}

	// 게시물의 좋아요 클릭했을 때
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
	
	// 게시물의 알림버튼 클릭했을 때	
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
}
