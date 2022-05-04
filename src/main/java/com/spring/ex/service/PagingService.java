package com.spring.ex.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.spring.ex.dto.PagingDTO;

public class PagingService {
	private PagingDTO paging;
	private HashMap<String, Integer> map;
	
	public PagingService(HttpServletRequest request, int totalCount, int pageSize) {
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		paging = new PagingDTO();
		paging.setPageNo(page);
		paging.setPageSize(pageSize);
		paging.setTotalCount(totalCount);
		int endPage = (page - 1) * pageSize;
		
		map = new HashMap<String, Integer>();
		map.put("Page", endPage);
		map.put("PageSize", pageSize);
	}
	
	public PagingDTO getPaging() {
		return paging;
	}
	
	// 게시물을 불러오기 위한 조건 map
	public HashMap<String, Integer> getMap() {
		return map;
	}
}
