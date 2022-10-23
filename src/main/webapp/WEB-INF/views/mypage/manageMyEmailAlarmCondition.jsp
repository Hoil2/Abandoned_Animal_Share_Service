<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="apple-touch-icon" sizes="180x180" href='<c:url value="/resources/favicons/apple-touch-icon.png"/>'>
	<link rel="icon" type="image/png" sizes="32x32" href='<c:url value="/resources/images/favicons/favicon-32x32.png"/>'>
	<link rel="icon" type="image/png" sizes="16x16" href='<c:url value="/resources/images/favicons/favicon-16x16.png"/>'>
	
	<!-- Template Styles -->
	<link rel="stylesheet" href='<c:url value="/resources/css/style.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/responsive.css"/>'><link rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<jsp:include page="../layout/libraries.jsp"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	<!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fa765d237b5684d617d012e915c53a3&libraries=services,clusterer,drawing"></script>
	
	<title>유기동물 등록 알림 설정</title>
	<c:if test="${fn:contains(eac.kinds, '개')}">
		<c:set var="kind_dog" value="true"></c:set>
	</c:if>
	
	<c:if test="${fn:contains(eac.kinds, '고양이')}">
		<c:set var="kind_cat" value="true"></c:set>
	</c:if>
	
	<c:if test="${fn:contains(eac.kinds, '기타축종')}">
		<c:set var="kind_etc" value="true"></c:set>
	</c:if>
</head>
<body link="red">
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<form action="/mypage/updateMyEmailAlarmCondition" method="post">
			
			<%-- 동물 종류 --%>
			<div class="mb-5">
				<%-- 강아지 품종 선택 --%>	
				<div class="mb-3">
					<p class="fs-5 fw-bold d-inline">동물 종류</p><span class="text-danger d-inline ml-1">*</span>
					<p><small>품종을 고르지 않을 경우 모든 품종을 포함하게 됩니다.</small></p>
				</div>
				<div class="row d-flex align-items-center mb-1 pl-3">
					<div class="col-2">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="kind[]" value="개" <c:if test="${kind_dog}">checked</c:if>>
							<label class="form-check-label" for="flexCheckDefault">
								강아지
							</label>
						</div>
					</div>
					
					<%-- 체크박스 체크했을 때 ajax로 select option 태그 불러오기 --%>
					<%-- ajax로 불러올 태그는 mypage/module/breedSelectList.jsp에 있음 --%>
					<div class="col-3" id="dog_breed_list" style="height:50px;">
						<c:if test="${kind_dog}">
							<select name="dog_breed[]" class="selectpicker" data-size="6" multiple>
								<c:forEach var="breed" items="${shareCenterService.getAnimalBreedList('개')}">
									<option value="${breed}" <c:if test="${fn:contains(eac.dog_breeds, breed)}">selected</c:if>>${breed}</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
				</div>
				
				<%-- 고양이 품종 선택 --%>
				<div class="row d-flex align-items-center mb-1 pl-3">
					<div class="col-2">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="kind[]" value="고양이" <c:if test="${kind_cat}">checked</c:if>>
							<label class="form-check-label" for="flexCheckDefault">
								고양이
							</label>
						</div>
					</div>
										
					<div class="col-3" id="cat_breed_list" style="height:50px;">
						<c:if test="${kind_cat}">
							<select name="cat_breed[]" class="selectpicker" data-size="6" multiple>
								<c:forEach var="breed" items="${shareCenterService.getAnimalBreedList('고양이')}">
									<option value="${breed}" <c:if test="${fn:contains(eac.cat_breeds, breed)}">selected</c:if>>${breed}</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
				</div>
				<%-- 기타 품종 선택 --%>
				<div class="row d-flex align-items-center  pl-3">
					<div class="col-2">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="kind[]" value="기타축종" <c:if test="${kind_etc}">checked</c:if>>
							<label class="form-check-label" for="flexCheckDefault">
								기타
							</label>
						</div>
					</div>
					
					<div class="col-3" id="etc_breed_list" style="height:50px;">
						<c:if test="${kind_etc}">
							<select name="etc_breed[]" class="selectpicker" data-size="6" multiple>
								<c:forEach var="breed" items="${shareCenterService.getAnimalBreedList('기타축종')}">
									<option value="${breed}" <c:if test="${fn:contains(eac.etc_breeds, breed)}">selected</c:if>>${breed}</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
				</div>
			</div>
			
			<%-- 성별 --%>
			<div class="mb-5">
				<div class="mb-3">
					<p class="fs-5 fw-bold d-inline">성별</p><span class="text-danger d-inline ml-1">*</span>
				</div>
				<div class="pl-3">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="F" name="sex[]" <c:if test="${fn:contains(eac.sexs, 'F')}">checked</c:if>>
					<label class="form-check-label" for="flexCheckDefault">
						암컷
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="M" name="sex[]" <c:if test="${fn:contains(eac.sexs, 'M')}">checked</c:if>>
					<label class="form-check-label" for="flexCheckDefault">
						수컷
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="Q" name="sex[]" <c:if test="${fn:contains(eac.sexs, 'Q')}">checked</c:if>>
					<label class="form-check-label" for="flexCheckDefault">
						미상
					</label>
				</div>
				</div>
			</div>
			
			<%-- 나이 --%>
			<div class="mb-5">
				<p class="fs-5 fw-bold m-0">나이</p>
				<p><small>고르지 않을 경우 모든 나이를 포함하게 됩니다.</small></p>
				<select name="age[]" class="selectpicker" data-size="6" multiple>
					<c:forEach var="year" begin="${nowYear-15}" end="${nowYear}">
						<option value="${nowYear - year + nowYear-15}" <c:if test="${fn:contains(eac.ages, nowYear - year + nowYear-15)}">selected</c:if>>${nowYear - year + nowYear-15}년생</option>
					</c:forEach>
				</select>
			</div>
			
			<%-- 중성화 여부 --%>
			<div class="mb-5">
				<div class="mb-3">
					<p class="fs-5 fw-bold  d-inline">중성화 여부</p><span class="text-danger d-inline ml-1">*</span>
				</div>
				<div class="pl-3">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="Y" name="neutering[]" <c:if test="${fn:contains(eac.neuterings, 'Y')}">checked</c:if>>
						<label class="form-check-label" for="flexCheckDefault">
							중성화 함
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="N" name="neutering[]" <c:if test="${fn:contains(eac.neuterings, 'N')}">checked</c:if>>
						<label class="form-check-label" for="flexCheckDefault">
							중성화 안함
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="U" name="neutering[]" <c:if test="${fn:contains(eac.neuterings, 'U')}">checked</c:if>>
						<label class="form-check-label" for="flexCheckDefault">
							미상
						</label>
					</div>
				</div>
			</div>
			
			<div class="mb-5">
				
			</div>
			
			<div class="mb-5">
				<p class="fs-5 fw-bold m-0">알림받을 보호소 선택</p>
				<p><small>고르지 않을 경우 모든 보호소를 포함하게 됩니다.</small></p>
				<%-- 지도 필터 --%>
				<div class="row">
					<div class="col">
						<div class="row">
					    	<label class="col-form-label col-3">검색 반경</label>
							<div class="col-9 input-group">
						  		<input type="number" id="radius" class="form-control" value="15">
								<div class="input-group-append">
								    <span class="input-group-text">km</span>
								</div>
							</div>
						</div>
						
						<label class="col-form-label pt-4">주소로 검색 위치 변경</label>
						<div class="row">
							<div class="px-3 input-group">
								<input type="text" id="changedAddress" class="form-control"/>
								<div class="input-group-append">
							    	<button type="button" class="btn btn-outline-secondary" onclick="changeAddressToSearch()">변경</button>
							    </div>
						    </div>
						</div>
						
						<%-- 보호소 검색 --%>
						<div class="d-flex flex-row justify-content-end mt-4">
							<input type="button" class="btn btn-secondary btn-lg mr-4" value="현재 위치로 변경" onclick="changeAddressToNow()">
							<input type="button" class="btn btn-primary btn-lg" value="검색" onclick="startSearch()">
						</div>
					</div>
					
					<div class="col">
						<%-- 카카오 지도 추가 --%>
						<div id="kakaoMap" style="width:500px;height:400px;"></div>
					</div>
				</div>
			</div>
			
			<div class="row mb-3 d-flex flex-row-reverse" style="padding-right:2.5rem">
    			<button type="submit" class="col-sm-2 btn btn-dark">저장</button>
    		</div>
		</form>
	</div>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
	
		// 품종 리스트 태그 추가
		function getSelectAnimalBreedList(kind) {
			$.ajax({
				url: '/getSelectAnimalBreedList',
				type: 'post',
				dataType: 'html',
				data: {
					kind: kind
				},
				success: function(data) {
			 		var breedList = $(data).children("#breed_list>*");
				 	$('#'+kind+'_breed_list').html(breedList);
				 	$('[name="'+kind+'_breed[]"]').selectpicker();
				}
			});
		} 
		
		
		
		$('button[type="submit"]').on('click', function() {
			
			<%-- 보호소 주소 list form에 동적으로 추가해서 서버로 보내기--%>
			resultShelterId.forEach(function(shelterId) {
				$('form').append('<input type="hidden" name="shelter_id[]" value="' + shelterId + '">')
			});
			
			<%-- 그룹 체크박스 required --%>
			<%-- 동물 종류 --%>
			var kind_cbx_group = $("input:checkbox[name='kind[]']");
			kind_cbx_group.prop('required', true);
			if(kind_cbx_group.is(":checked")){
				kind_cbx_group.prop('required', false);
			}
			
			<%-- 성별 --%>
			var sex_cbx_group = $("input:checkbox[name='sex[]']");
			sex_cbx_group.prop('required', true);
			if(sex_cbx_group.is(":checked")){
				sex_cbx_group.prop('required', false);
			}
			
			<%-- 중성화 여부 --%>
			var neutering_cbx_group = $("input:checkbox[name='neutering[]']");
			neutering_cbx_group.prop('required', true);
			if(neutering_cbx_group.is(":checked")){
				neutering_cbx_group.prop('required', false);
			}
			
			//$('input[name="shelterAddressList"]').val(resultAddressList.join(", "));
		});
		
		<%-- 강아지 체크 이벤트 --%>
		$('input[name="kind[]"]input[value="개"]').change(function() {
			var chx_kind_dog = $('input[name="kind[]"]input[value="개"]');
			if(chx_kind_dog.is(":checked")) {
				<%-- 강아지 품종 select 우측에 표시 --%>
				getSelectAnimalBreedList('dog');
				console.log("dog check");
			}
			else {
				<%-- 강아지 품종 없애기 --%>
				$('#dog_breed_list').empty();
				console.log("dog uncheck");
			}
		});
		
		<%-- 고양이 체크 이벤트 --%>
		$('input[name="kind[]"]input[value="고양이"]').change(function() {
			var chx_kind_cat = $('input[name="kind[]"]input[value="고양이"]');
			if(chx_kind_cat.is(":checked")) {
				<%-- 고양이 품종 select 우측에 표시 --%>
				getSelectAnimalBreedList('cat');
				console.log("cat check");
			}
			else {
				<%-- 고양이 품종 없애기 --%>
				$('#cat_breed_list').empty();
				console.log("cat uncheck");
			}
		});
		
		<%-- 기타 체크 이벤트 --%>
		$('input[name="kind[]"]input[value="기타축종"]').change(function() {
			var chx_kind_etc = $('input[name="kind[]"]input[value="기타축종"]');
			if(chx_kind_etc.is(":checked")) {
				<%-- 기타 품종 select 우측에 표시 --%>
				getSelectAnimalBreedList('etc');
				console.log("etc check");
			}
			else {
				<%-- 기타 품종 없애기 --%>
				$('#etc_breed_list').empty();
				console.log("etc uncheck");
			}
		});
		
		
		$(function() {
	    	setToCurrentPosition();
		});
	
		<%-- kakao map script section --%>
		var container = document.getElementById('kakaoMap'); //지도를 담을 영역의 DOM 레퍼런스
	    var options = { //지도를 생성할 때 필요한 기본 옵션
	        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	        level: 3 //지도의 레벨(확대, 축소 정도)
	    };
	
	    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	    
	    var nowPosition;
	    var circle = new kakao.maps.Circle({
		    strokeWeight: 5, // 선의 두께입니다 
		    strokeColor: '#75B8FA', // 선의 색깔입니다
		    strokeOpacity: 0.9, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'dashed', // 선의 스타일 입니다
		    fillColor: '#CFE7FF', // 채우기 색깔입니다
		    fillOpacity: 0.6  // 채우기 불투명도 입니다   
		}); 
	    
	    var radius;
	    
	    var resultShelterId = [];
	    
	    // 보호소 주소가 있다면 설정
	    <c:if test="${eac.shelter_ids != null}">
	    	<c:forEach var="shelter_id" items="${fn:split(eac.shelter_ids, ',')}">
	    		resultShelterId.push(${shelter_id});
	    	</c:forEach>
	    </c:if>
	    
	    var markers = [];
	    var infowindows = [];
	    
	    var allShelterCount;
	    var nowShelterCount;
	    
	    
	    
	    function startSearch() {
	    	resultShelterId = [];
        	
        	for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }
        	
        	for(var i = 0; i < infowindows.length; i++) {
        		infowindows[i].close();
        	}
        	
        	markers = [];
        	infowindows = [];
        	
        	// 맵에 검색 범위 그리기
        	drawCircle();
        	
        	// 범위 안의 보호소를 표시. 표시한 보호소는 resultAddressList에 저장
        	displayShelterInRegion();
        }
        
        function changeAddressToNow() {
        	setToCurrentPosition();
        }
        
        function changeAddressToSearch() {
        	var changedAddress = $('#changedAddress').val();
        	
			var geocoder = new kakao.maps.services.Geocoder();
        	
        	// 주소로 좌표를 검색합니다
        	geocoder.addressSearch(changedAddress, function(result, status) {
        	    // 정상적으로 검색이 완료됐으면 
        	     if (status === kakao.maps.services.Status.OK) {
        	        var targetPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
        	        nowPosition = targetPosition;
        	        
        	        message = '변경된 위치';
        	        map.setCenter(nowPosition);
    	            displayMarker(nowPosition, message);
        	     }
        	     else {
     	     		console.log("x");
     	     		var iwContent = '<div style="padding:5px;padding-right:30px;white-space:nowrap;">can not found address</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	        	     	    iwPosition = nowPosition, //인포윈도우 표시 위치입니다
	        	     	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
	        	     	// 인포윈도우를 생성하고 지도에 표시합니다
	        	     	var infowindow = new kakao.maps.InfoWindow({
	        	     	    map: map, // 인포윈도우가 표시될 지도
	        	     	    position : iwPosition, 
	        	     	    content : iwContent,
	        	     	    removable : iwRemoveable
	        	     	});
	        	     	
	        	     	infowindows.push(infowindow);
	        	     	    
	    	         	// 지도 중심좌표를 접속위치로 변경합니다
	    	            map.setCenter(nowPosition);  
        	     }
        	});
        }
        
        function displayShelterInRegion() {
        	$.ajax({
        		url : '/getAllShelterList',
        		type : 'post',
        		success : function(data) {
        			allShelterCount = data.length;
        			nowShelterCount = 0;
        			console.log("모든 쉘터 개수" + data.length);
        			$(data).each(function() {
        				console.log("주소 검색 시작 : "+this.care_addr);
        				getAddressPositionAndDisplayMarker(this);
   					});
        		}
        	});
        }
        // 검색 범위 그리기
        function drawCircle() {
        	// km를 m로 변환합니다
        	radius = $('#radius').val() * 1000;
        	
        	// 기존에 그려져 있던 원을 제거합니다
    		circle.setMap(null);
    		circle.setPosition(nowPosition);
        	circle.setRadius(radius);
        	
        	// 지도에 원을 표시합니다 
        	circle.setMap(map); 
        	map.setBounds(circle.getBounds());
        }
        
        // 현재 위치 구하는 함수
        function setToCurrentPosition() {
        	var message;
        	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        	if (navigator.geolocation) {
        	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        	    navigator.geolocation.getCurrentPosition(function(position) {
        	        var lat = position.coords.latitude, // 위도
        	            lon = position.coords.longitude; // 경도
        	        
    	            nowPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
    	            message = '현재 위치';
    	            displayMarker(nowPosition, message);
    	         	// 지도 중심좌표를 접속위치로 변경합니다
    	            map.setCenter(nowPosition);  
    	    	});
        	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        	    nowPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        	        message = 'geolocation을 사용할수 없어요..';
        	    displayMarker(nowPosition, message);
	         	// 지도 중심좌표를 접속위치로 변경합니다
	            map.setCenter(nowPosition);  
        	}
        }
        
        // 주소로 위치값 구하는 함수
        function getAddressPositionAndDisplayMarker(shelter) {
        	// 주소-좌표 변환 객체를 생성합니다
        	var geocoder = new kakao.maps.services.Geocoder();
        	
        	// 주소로 좌표를 검색합니다
        	geocoder.addressSearch(shelter.care_addr, function(result, status) {
        		nowShelterCount = nowShelterCount + 1;
    	    	// 정상적으로 검색이 완료됐으면 
    	     	if (status === kakao.maps.services.Status.OK) {
        	        var targetPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
        	        
        	        if(getDistance(nowPosition, targetPosition) <= radius) {
						resultShelterId.push(shelter.aas_id);

    					// 마커 생성
    					displayMarker(targetPosition, shelter.care_nm);
					}
        	    }
        	});
        }
        
        // 두 위치의 거리 구하는 함수
        function getDistance(a, b) {
        	line = new kakao.maps.Polyline({
        		path: [a, b] // 선을 구성하는 좌표 배열입니다
        	});

        	return Math.round(line.getLength()); // m단위
        }
        
     	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(locPosition, message) {

            // 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    map: map,
			    position: locPosition
			});	
            
			markers.push(marker);
			
			marker.setMap(map);
			
			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">' + message + '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    content : iwContent,
			    removable : true
			});
			
			infowindows.push(infowindow);
			
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
		    	infowindow.open(map, marker);  
			});
        }     
	</script>
</body>
</html>