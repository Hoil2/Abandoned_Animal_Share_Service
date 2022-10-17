package com.spring.ex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.spring.ex.dao.ShareCenterDAO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.dto.ShelterDTO;
import com.spring.ex.util.AbandonedAnimalApi;

@Service
public class ShareCenterServiceImpl implements ShareCenterService{
	
	@Inject
	private ShareCenterDAO dao;
	
	AbandonedAnimalApi abandonedAnimalApi = new AbandonedAnimalApi();
	
	//분양센터페이지 유기동물 목록 출력
	@Override
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Object> map) throws Exception {
		return dao.getShareCenterBoardPage(map);
	}
	
	//분양센터페이지 유기동물 목록 총 갯수 - 페이징
	@Override
	public int getShareCenterBoardViewTotalCount(HashMap<String, String> map) throws Exception {
		return dao.getShareCenterBoardViewTotalCount(map);
	}
	@Override
	public void getShareCenterRequest(ShelterDTO shelterDto, int pageLastNum, String startApiRequest, String endApiRequest) throws Exception {
		List<ShareCenterDTO> shareCenterDtoList = new ArrayList<ShareCenterDTO>();
		//List<Map<String, Object>> shareCenterDtoList = new ArrayList<Map<String, Object>>();
		for(int j = 1; j <= pageLastNum; j++) {
			
			JSONArray item = abandonedAnimalApi.getRequestApiAbandonedAnimal(startApiRequest, endApiRequest, j);
			
			//System.out.println( "카운트 수" +(String) body.get("totalCount").toString());
			
			//주의 : 다수 데이터 요청시 여기 부분 주석처리 안하면 이클립스 멈춤 
			/*
			System.out.println("JSON(obj) : " + obj);
			System.out.println("JSON(response) : " + response);
			System.out.println("JSON(body) : " + body);
			System.out.println("JSON(items) : " + items);
			System.out.println("JSON(item[]) : " + item);
			*/
			// 조회 데이터 크기만큼 for문 + 테이블저장
			// dto에 담고 -> 등록된 보호소인지 확인 -> 기등록은 aas_id 값으로, 미등록은 보호소 등록후 값으로
			for (int i=0;i< item.size();i++) {
				
				JSONObject eqData = (JSONObject) item.get(i);
				
				String desertionNo = (String) eqData.get("desertionNo").toString();
				String filename = (String) eqData.get("filename").toString();
				Object happenDt= (Object) eqData.get("happenDt");
				String happenPlace = (String) eqData.get("happenPlace").toString();
				String kindCd = (String) eqData.get("kindCd").toString();
				String colorCd = (String) eqData.get("colorCd").toString();
				String age = (String) eqData.get("age").toString();
				String weight = (String) eqData.get("weight").toString();
				String noticeNo = (String) eqData.get("noticeNo").toString();
				Object noticeSdt = (Object) eqData.get("noticeSdt");
				Object noticeEdt= (Object) eqData.get("noticeEdt");
				String popfile = (String) eqData.get("popfile").toString();
				String processState = (String) eqData.get("processState").toString();
				String sexCd = (String) eqData.get("sexCd").toString();
				String neuterYn = (String) eqData.get("neuterYn").toString();
				String specialMark = (String) eqData.get("specialMark").toString();
				
				String care_nm =  (String)eqData.get("careNm").toString();
				String care_addr = (String)eqData.get("careAddr").toString();
				String careTel = (String)eqData.get("careTel") == null ? "x" : (String)eqData.get("careTel").toString();
				
				
				String chargeNm = (String)eqData.get("chargeNm") == null ? "x" : (String)eqData.get("chargeNm").toString();
				String officetel = (String)eqData.get("officetel") == null ? "x" : (String)eqData.get("officetel").toString();
				String orgNm = (String)eqData.get("orgNm") == null ? "x" : (String)eqData.get("orgNm").toString();
				
				
				ShareCenterDTO dto = new ShareCenterDTO();
				dto.setDesertion_no(desertionNo);
				dto.setFilename(filename);
				dto.setHappen_dt(happenDt);
				dto.setHappen_place(happenPlace);
				dto.setKind_cd(kindCd);
				dto.setColor_cd(colorCd);
				dto.setAge(age);
				dto.setWeight(weight);
				dto.setNotice_no(noticeNo);
				dto.setNotice_sdt(noticeSdt);
				dto.setNotice_edt(noticeEdt);
				dto.setPopfile(popfile);
				dto.setProcess_state(processState);
				dto.setSex_cd(sexCd);
				dto.setNeuter_yn(neuterYn);
				dto.setSpecial_mark(specialMark);
				
				
				
				HashMap<String, Object> shelterMap = new HashMap<String, Object>();
				shelterMap.put("care_nm", care_nm);
				shelterMap.put("care_addr", care_addr);
				int checkCareShelter = dao.isCheckCareShelter(shelterMap);
				//System.out.println("기 등록 보호소 확인1"+checkCareShelter);
				
				//Map<String, Object> insertMap = new HashMap<String, Object>();
				
				if(checkCareShelter != 0) {
					dto.setAas_id(checkCareShelter);
					//dao.setDbShareCenterApiResponse(shareCenterDtoList);
					shareCenterDtoList.add(dto);
				} else {
					shelterDto.setCare_nm(care_nm);
					shelterDto.setCare_addr(care_addr);
					shelterDto.setCare_tel(careTel);
					shelterDto.setCharge_nm(chargeNm);
					shelterDto.setOfficetel(officetel);
					shelterDto.setOrg_nm(orgNm);
					
					dao.setCareShelter(shelterDto);
					dto.setAas_id(shelterDto.getAas_id());
					shareCenterDtoList.add(dto);
					//dao.setDbShareCenterApiResponse(shareCenterDtoList);
					//System.out.println("자동 증가된 값 오는지 test" + shelterDto.getAas_id());
				}
				
				
				//System.out.println(care_nm + "  "+ care_addr);
				//System.out.println("서비스 for : " +dto.toString());
				//System.out.println(dto.getDesertion_no());
				//System.out.println(dto.getHappen_place());
				
				// EarthquakeDAO dao = sqlSession.getMapper(EarthquakeDAO.class);
				// cd = dao.saveEarthquake(eqSeq,eqPoint,noticeType,img,noticeTime,refSeq,eqTime,miSeq,lat,lng,addr,scale,intensity,deep,remarks,flagYN,issueID);
				//System.out.println("cd : "+ cd);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", shareCenterDtoList);
			dao.setDbShareCenterApiResponse(map);
		}
	}
	
	
	//유기동물 DB에서 존재하는 목록만 셀렉트 박스에 출력
	@Override
	public List<String> getShareCenterAreaList() throws Exception {
		return dao.getShareCenterAreaList();
	}
	
	//유기동물 게시글 상세페이지 출력 
	@Override
	public Map<String, Object> getShareCenterBoardReadPage(String desertion_no) throws Exception {
		return dao.getShareCenterBoardReadPage(desertion_no);
	}
	
	//유기동물 센터 게시물 조회수 증가
	@Override
	public void addShareCenterBoardReadPageHit(String desertion_no) throws Exception {
		dao.addShareCenterBoardReadPageHit(desertion_no);
	}
	
	//유기동물 센터 해당 게시물 좋아요 유무 체크
	@Override
	public int getGoodCheckShareCenterBoardReadPage(HashMap<String, Object> map) throws Exception {
		return dao.getGoodCheckShareCenterBoardReadPage(map);
	}
	
	//유기동물 센터 해당 게시물 좋아요 추가
	@Override
	public int addGoodShareCenterReadPage(HashMap<String, Object> map) throws Exception {
		return dao.addGoodShareCenterReadPage(map);
	}
	
	//유기동물 센터 해당 게시물 좋아요 삭제
	@Override
	public int subtractGoodShareCenterReadPage(HashMap<String, Object> map) throws Exception {
		return dao.subtractGoodShareCenterReadPage(map);
	}

	//2022-10-17 김홍일 / 현재 db에 저장된 동물의 품종 리스트 가져오기
	@Override
	public List<String> getAnimalBreedList(String kind) {
		return dao.getAnimalBreedList(kind);
	}
	
}