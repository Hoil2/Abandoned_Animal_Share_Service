package com.spring.ex.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.spring.ex.dao.ShareCenterDAO;
import com.spring.ex.dto.ShareCenterDTO;

@Service
public class ShareCenterServiceImpl implements ShareCenterService{
	
	@Inject
	private ShareCenterDAO dao;
	
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
	public void getShareCenterTest(ShareCenterDTO dto) throws Exception {
		// 1. URL을 만들기 위한 StringBuilder.
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
		Object testCasting = 7;
		String testCastingResult =String.valueOf(testCasting);
		
		
		// 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Q84iTs0OivxYSzXgMqJWORyolBgT87Mu5lXE6sSWgEFI%2BhLRrMmdyfML5z3g6HYBCfWqS0YiGkrXpzfT07XhJg%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode("20220425", "UTF-8")); /*유기날짜(검색 시작일) (YYYYMMDD)*/
		urlBuilder.append("&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode("20220510", "UTF-8")); /*유기날짜(검색 종료일) (YYYYMMDD)*/
		urlBuilder.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*축종코드 (개 : 417000, 고양이 : 422400, 기타 : 429900)*/
		urlBuilder.append("&" + URLEncoder.encode("kind","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품종코드 (품종 조회 OPEN API 참조)*/
		urlBuilder.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시도코드 (시도 조회 OPEN API 참조)*/
		urlBuilder.append("&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드 (시군구 조회 OPEN API 참조)*/
		urlBuilder.append("&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보호소번호 (보호소 조회 OPEN API 참조)*/
		urlBuilder.append("&" + URLEncoder.encode("state","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*상태(전체 : null(빈값), 공고중 : notice, 보호중 : protect)*/
		urlBuilder.append("&" + URLEncoder.encode("neuter_yn","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*상태 (전체 : null(빈값), 예 : Y, 아니오 : N, 미상 : U)*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호 (기본값 : 1)*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(testCastingResult , "UTF-8")); /*페이지당 보여줄 개수 (1,000 이하), 기본값 : 10*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(기본값) 또는 json*/
		
		// 3. URL 객체 생성.
		URL url = new URL(urlBuilder.toString());
		// 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		// 5. 통신을 위한 메소드 SET.
		conn.setRequestMethod("GET");
		// 6. 통신을 위한 Content-type SET. 
		conn.setRequestProperty("Content-type", "application/json");
		// 7. 통신 응답 코드 확인.
		System.out.println("Response code: " + conn.getResponseCode());
		// 8. 전달받은 데이터를 BufferedReader 객체로 저장
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		// 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line + "\n");
		}
		
		// 10. 객체 해제.
		rd.close();
		conn.disconnect();
		
		// json data parsing 
		String responseBody = sb.toString(); // < 에러나서 여기에 넣고 다시 넣었습니다.
		JSONParser parser	= new JSONParser(); 
		JSONObject obj 		= (JSONObject)parser.parse(responseBody);
		JSONObject response = (JSONObject)obj.get("response");
		JSONObject body 	= (JSONObject)response.get("body");
		JSONObject items 	= (JSONObject)body.get("items");
		JSONArray  item 	= (JSONArray) items.get("item");
		
		System.out.println( "카운트 수" +(String) body.get("totalCount").toString());
		
		System.out.println("JSON(obj) : " + obj);
		System.out.println("JSON(response) : " + response);
		System.out.println("JSON(body) : " + body);
		System.out.println("JSON(items) : " + items);
		System.out.println("JSON(item[]) : " + item);
		

		// 조회 데이터 크기만큼 for문 + 테이블저장 
		for (int i=0;i< item.size();i++) {
			
			JSONObject eqData = (JSONObject) item.get(i);
			
			dto.setDesertion_no((String) eqData.get("desertionNo").toString());
			dto.setFilename((String) eqData.get("filename").toString());
			dto.setHappen_dt((Object) eqData.get("happenDt"));
			dto.setHappen_place((String) eqData.get("happenPlace").toString());
			dto.setKind_cd((String) eqData.get("kindCd").toString());
			dto.setColor_cd((String) eqData.get("colorCd").toString());
			dto.setAge((String) eqData.get("age").toString());
			dto.setWeight((String) eqData.get("weight").toString());
			dto.setNotice_no((String) eqData.get("noticeNo").toString());
			dto.setNotice_sdt((Object) eqData.get("noticeSdt"));
			dto.setNotice_edt((Object) eqData.get("noticeEdt"));
			dto.setPopfile((String) eqData.get("popfile").toString());
			dto.setProcess_state((String) eqData.get("processState").toString());
			dto.setSex_cd((String) eqData.get("sexCd").toString());
			dto.setNeuter_yn((String) eqData.get("neuterYn").toString());
			dto.setSpecial_mark((String) eqData.get("specialMark").toString());
			
			//System.out.println("서비스 for : " +dto.toString());
			//System.out.println(dto.getDesertion_no());
			//System.out.println(dto.getHappen_place());
			dao.setDbShareCenterApiResponse(dto);
			// EarthquakeDAO dao = sqlSession.getMapper(EarthquakeDAO.class);
			// cd = dao.saveEarthquake(eqSeq,eqPoint,noticeType,img,noticeTime,refSeq,eqTime,miSeq,lat,lng,addr,scale,intensity,deep,remarks,flagYN,issueID);
			//System.out.println("cd : "+ cd);
		}
		
		
		
	}
	
	@Override
	public void getTest() throws Exception {
		
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
	
}