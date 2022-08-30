// 헷갈릴 까봐 임시로 분할함

package com.spring.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex.dto.PagingDTO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.dto.ShelterDTO;
import com.spring.ex.service.ShareCenterService;
import com.spring.ex.service.ShelterService;

@Controller
public class ShareCenterSearchRegionController {
	
	@Inject
	ShareCenterService shareCenterService;
	
	@Inject
	private ShelterService shelterService;
	
	@RequestMapping(value="/shareCenterPage_searchAniamlInRegion", method=RequestMethod.GET)
	public String getShareCenterPage_searchAniamlInRegion() throws Exception {
		return "shareCenter_searchAnimalInRegion";
	}
	
	// 기존 유기동물 검색에 지역 검색 추가
	// 세션으로 조건 넘기는 것 그냥 넘기는 걸로 바꿈
	@RequestMapping(value="/shareCenterPage_searchAniamlInRegion", method=RequestMethod.POST)
	public String postShareCenterPage_searchAniamlInRegion(HttpServletRequest request, Model model) throws Exception {
		String[] shelterAddressList = request.getParameterValues("resultAddressList");
	
		if(shelterAddressList != null) {
			for(String address : shelterAddressList)
				System.out.println("전송받은 보호소 주소 리스트 : " + address);
		}
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		
		if(StringUtils.isEmpty(searchTheme) || searchTheme == null) {
			searchTheme = "allTheme";
		}
		
		if(StringUtils.isEmpty(searchArea) || searchArea == null) {
			searchArea = "allArea";
		}
		
		if(StringUtils.isEmpty(searchAlignment) || searchAlignment == null) {
			searchAlignment = "alignmentDay";
		}
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchTheme", (String) searchTheme);
		searchMap.put("searchArea", (String) searchArea);
		searchMap.put("alignment", (String) searchAlignment);
		searchMap.put("shelterAddressList", shelterAddressList);
		
		//페이징
		int totalCount = shelterService.getShareCenterBoardViewTotalCountByAddress(searchMap);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		PagingDTO paging = new PagingDTO();
		paging.setPageNo(page);
		paging.setPageSize(12);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 12;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		map.put("searchTheme", searchTheme);
		map.put("searchArea", searchArea);
		map.put("alignment", searchAlignment);
		map.put("shelterAddressList", shelterAddressList);
		
		System.out.println("map : " + map);
		
		//검색 및 결과값 담기
		List<HashMap> slist = shelterService.getShareCenterBoardPageByAddress(map);
		System.out.println("검색 결과 수 : " + totalCount);
		System.out.println("검색 결과 : " + slist);
		model.addAttribute("slist", slist);
		model.addAttribute("Paging", paging);
		model.addAttribute("searchArea", searchArea);
		model.addAttribute("searchTheme", searchTheme);
		model.addAttribute("alignment", searchAlignment);
		System.out.println("검색 지역/테마/정렬 : " + searchArea + ", " + searchTheme + ", " + searchAlignment);
		
		List<String> seletedBoxList = shareCenterService.getShareCenterAreaList();
		model.addAttribute("areaList", seletedBoxList);
		System.out.println(seletedBoxList);
		return "shareCenter_searchAnimalInRegion";
	}
	
	// 모든 보호소 정보 클라이언트로 보내기
		@ResponseBody
		@RequestMapping("/getAllShelterList")
		public List<ShelterDTO> getAllShelterList() {
			return shelterService.selectAllShelterList();
		}
}
