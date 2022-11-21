package com.spring.ex.admin.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.ex.admin.service.AdminShareCenterService;
import com.spring.ex.dto.EmailAlarmConditionDTO;
import com.spring.ex.dto.EmailDTO;
import com.spring.ex.dto.LostAnimalDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.service.EmailAlarmConditionService;
import com.spring.ex.service.EmailService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;
import com.spring.ex.service.ShareCenterService;

@Controller 
public class AdminShareCenterController {
	
	@Inject AdminShareCenterService adminService;
	@Inject ShareCenterService service;
	
	@Inject
	private AdminShareCenterService adminShareCenterService;
	
	@Inject
	private EmailAlarmConditionService emailAlarmConditionService;
	
	@Inject
	private EmailService emailService;
	
	@Inject
	private MemberService memberService;
	
	PagingService pagingService;
	//관리자 페이지 분양센터
	@RequestMapping(value = "/admin/shereCenter", method = RequestMethod.GET)
	public String AdminShereCenter(Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("TodayRegistrationCount", adminService.getTodayRegistrationCount());
		model.addAttribute("AnimalDeadlineCount", adminService.getAnimalDeadlineCount());
		model.addAttribute("ShelterCount", adminService.getShelterCount());
		model.addAttribute("ApiRenewalDate", adminService.getApiRenewalDate());
		model.addAttribute("AnimalProtectCount", adminService.getAnimalProtectCount());
		model.addAttribute("AnimalAdoptionCount", adminService.getAnimalAdoptionCount());
		model.addAttribute("AnimalReturnCount", adminService.getAnimalReturnCount());
		model.addAttribute("AnimalDeathCount", adminService.getAnimalDeathCount());
		
		String searchCategory  = request.getParameter("searchCategory");
		String searchKeyword = request.getParameter("searchKeyword");
		
		HttpSession session = request.getSession();
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		if(StringUtils.isEmpty(searchKeyword) || searchKeyword == null) {
		} else if(!StringUtils.isEmpty(searchKeyword)){
			session.setAttribute("searchKeyword", searchKeyword);
		}
		if(StringUtils.isEmpty(searchTheme) || searchTheme == null) {
			searchTheme = "allTheme";
			session.setAttribute("searchTheme", "allTheme");
		} else if(!StringUtils.isEmpty(searchTheme)){
			session.setAttribute("searchTheme", searchTheme);
		}
		
		if(StringUtils.isEmpty(searchArea) || searchArea == null) {
			searchArea = "allArea";
			session.setAttribute("searchArea", "allArea");
		} else if(!StringUtils.isEmpty(searchArea)){
			session.setAttribute("searchArea", searchArea);
		}
		
		if(StringUtils.isEmpty(searchAlignment) || searchAlignment == null) {
			searchAlignment = "alignmentDay";
			session.setAttribute("alignment", "alignmentDay");
		} else if(!StringUtils.isEmpty(searchAlignment)){
			session.setAttribute("alignment", searchAlignment);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchArea", session.getAttribute("searchArea"));
		map.put("searchTheme", session.getAttribute("searchTheme"));
		map.put("alignment", session.getAttribute("alignment"));
		map.put("searchCategory", searchCategory);
		map.put("searchKeyword", searchKeyword);
		
		int totolCount = service.getShareCenterBoardViewTotalCount(map);
		pagingService = new PagingService(request, totolCount, 10, "page");

		map.put("Page", pagingService.getNowPage());
		map.put("PageSize", 10);
		
		
		List<ShareCenterDTO> slist = service.getShareCenterBoardPage(map);
		List<String> seletedBoxList = service.getShareCenterAreaList();
		
		if(StringUtils.isEmpty(searchCategory) || searchCategory == null) {
			model.addAttribute("searchCategory", "no");
		}else {
			model.addAttribute("searchCategory", searchCategory);
			model.addAttribute("searchKeyword", searchKeyword);
		}
		model.addAttribute("sTotolCount", totolCount);
		model.addAttribute("slist", slist);
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("areaList", seletedBoxList);
		System.out.println("검색 지역/테마/정렬 : " + searchArea + ", " + searchTheme + ", " + searchAlignment);
		
		
		return "admin/animalcenter/shareCenterAdmin";
	}
	
	//관리자 유기동물 게시글 상세페이지 출력
	@RequestMapping(value = "/admin/shereCenterAdminRead" , method = RequestMethod.GET)
	public String adminShereCenterReadPage(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String desertion_no = request.getParameter("desertion_no");
		Map<String, Object> sReadPage = service.getShareCenterBoardReadPage(desertion_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("desertion_no", desertion_no);
		
		model.addAttribute("scrReadPage", sReadPage);
		return "admin/animalcenter/shereCenterAdminRead";
	}
	
	
	//실종동물 게시글 수정
	@RequestMapping(value = "/admin/updateAbandonedAnimalInfo", method = RequestMethod.POST)
	@ResponseBody
	public int updateAbandonedAnimalInfo(HttpServletRequest request, ShareCenterDTO dto) throws Exception {
		int ajaxResult = adminShareCenterService.updateAbandonedAnimalInfo(dto);
	
		return ajaxResult;
	}
	
	//홍일작성
	// 유기동물 등록 시 맞춤 이메일 발송 
	@ResponseBody
	@RequestMapping("/admin/sendConditionEmailToMember")
	public void sendConditionEmailToMember() throws Exception {
		// 신규 등록된 유기동물들 조건에 맞춰 알림 설정한 회원들께 보내기
		List<ShareCenterDTO> todayInsertedAbandonedAnimals = adminShareCenterService.getTodayInsertedAbandonedAnimals();
		List<EmailAlarmConditionDTO> emailAlarmConditionList = emailAlarmConditionService.getEmailAlarmConditionList();
		
		for(ShareCenterDTO animal : todayInsertedAbandonedAnimals) {
			String aniKind = animal.getKind_cd().substring(animal.getKind_cd().indexOf("[")+1, animal.getKind_cd().indexOf("]")); 
			String aniBreed = animal.getKind_cd().substring(animal.getKind_cd().indexOf("]")+2);
			String age = animal.getAge().substring(0, 4);
			
			System.out.println(animal);
			
			for(EmailAlarmConditionDTO condition : emailAlarmConditionList) {
				String[] kinds = condition.getKinds().split(",");
				String[] dog_breeds = null;
				String[] cat_breeds = null;
				String[] etc_breeds = null;
				String[] ages = null;
				String[] shelter_ids = null;
				
				if(condition.getDog_breeds() != null) dog_breeds = condition.getDog_breeds().split(",");
				if(condition.getCat_breeds() != null) cat_breeds = condition.getCat_breeds().split(",");
				if(condition.getEtc_breeds() != null) etc_breeds = condition.getEtc_breeds().split(",");
				if(condition.getAges() != null) ages = condition.getAges().split(",");
				String[] sexs = condition.getSexs().split(",");
				String[] neuterings = condition.getNeuterings().split(",");
				if(condition.getShelter_ids() != null) shelter_ids = condition.getShelter_ids().split(",");
				
				// 조건에 안맞는 품종 걸러내기 
				if(Arrays.asList(kinds).contains(aniKind)) {
					if(aniKind.equals("개")) {
						if(dog_breeds != null) {
							if(!Arrays.asList(dog_breeds).contains(aniBreed)) {
								System.out.println("회원 : " + Arrays.asList(dog_breeds));
								System.out.println("공고 : " + aniBreed);
								System.out.println("필터 : 개");
								break;
							}
						}
					}
					else if(aniKind.equals("고양이")) {
						if(cat_breeds != null) {
							if(!Arrays.asList(cat_breeds).contains(aniBreed)) {
								System.out.println("필터 : 고양이");
								break;
							}
						}
					}
					else if(aniKind.equals("기타축종")) {
						if(etc_breeds != null) {
							if(!Arrays.asList(etc_breeds).contains(aniBreed)) {
								System.out.println("필터 : 기타축종");
								break;
							}
						}
					}
					else {
						break;
					}
				}
				else {
					System.out.println("필터 : 품종이 다름");
					break;
				}
				
				// 나이 걸러내기
				if(ages != null) {
					if(!Arrays.asList(ages).contains(age)) {
						System.out.println("필터 : 나이");
						break;
					}
				}
				
				// 성별 걸러내기
				if(!Arrays.asList(sexs).contains(animal.getSex_cd())) {
					System.out.println("필터 : 성별");
					break;
				}
				
				// 중성화 걸러내기
				if(!Arrays.asList(neuterings).contains(animal.getNeuter_yn())) {
					System.out.println("필터 : 중성화");
					break;
				}
				
				// 보호소 걸러내기
				if(shelter_ids != null) {
					if(!Arrays.asList(shelter_ids).contains(Integer.toString(animal.getAas_id()))) {
						System.out.println("필터 : 보호소");
						break;
					}
				}
				
				MemberDTO member = memberService.getMemberByM_id(condition.getM_id());
				EmailDTO emailDTO = new EmailDTO(
						emailService.getAdminEmailAddress(), 					// from
						member.getEmail(), 						 					// to
						"유기동물 분양 센터 - 알림", 				 					// title
						"조건에 맞는 유기동물 " + animal.getDesertion_no() + "이 접수되었습니다." +
						"공고 기간은 " + animal.getNotice_sdt() + "~" + animal.getNotice_edt() + " 입니다."
					);
				emailService.sendEmail(emailDTO);
				
				System.out.println("member email : " + member.getEmail());
				System.out.println(emailDTO.getContents());
			}
		}
	}
	
	
}