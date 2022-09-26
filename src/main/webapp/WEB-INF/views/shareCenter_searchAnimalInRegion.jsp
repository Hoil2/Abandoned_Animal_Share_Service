<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<jsp:include page="layout/libraries.jsp"/>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<%-- 카카오 지도 --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fa765d237b5684d617d012e915c53a3&libraries=services,clusterer,drawing"></script>
<title>유기동물 지역 검색</title>
<script>
$(document).ready(function() {
	
});
</script>
</head>
<body link="red">
	<!-- 페이지 로딩 이미지 -->
	<%-- Preloader --%>
	<div class="preloader">
		<img src='<c:url value="/resources/images/loader3.png"/>' class="preloader__image" alt="">
	</div>
	
	<!-- 메인 영역 -->
	<div class="page-wrapper">
		<jsp:include page="layout/header.jsp"/>
		
		<section class="page-header" style="background-image: url(<c:url value="/resources/images/banner_main/${BannerRespectivelyView.getS_file_name()}"/>);">
			<div class="container">
				<h2>분양센터</h2>
				<ul class="thm-breadcrumb list-unstyled">
				</ul>
			</div>
		</section><br>

		<section class="tour-one tour-grid" style="padding: 0px;">
			<div class="container">
				<div class="row">
					<%-- 지도 필터 --%>
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
				<%-- 검색 필터 --%>
				<div id="classify" class="d-flex flex-row justify-content-end"  style="margin: 10px 0px;">
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 10px 0px 0px;">
						분류
					</div>
					<div class="col-lg-1 col-md-1" style="padding: 0px 0px;">
						<select class="form-control" id="searchTheme">
							<option value="allTheme" >전체</option>
							<option value="개">개</option>
							<option value="고양이">고양이</option>
							<option value="기타축종">기타</option>
						</select>
					</div>
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 10px 0px 0px;">
						지역
					</div>
					<div class="col-lg-1 col-md-1" style="padding: 0px 0px;">
						<select class="form-control" id="searchArea" name="searchArea">
							<option value="allArea" >전체</option>
							<c:forEach var="areaList" items="${areaList}">
								<c:choose>
									<c:when test="${areaList.notice_no ne null}">
										<option value="<c:out value='${areaList.notice_no}' />"><c:out value="${areaList.notice_no}" /></option>
									</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 10px 0px 0px;">
						보기
					</div>
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 0px;">
						<select class="form-control" id="category2">
							<option value="alignmentDay" <c:if test="${alignment eq 'alignmentDay'}"> selected </c:if>>최신순</option>
							<option value="alignmentHit" <c:if test="${alignment eq 'alignmentHit'}"> selected </c:if>>조회순</option>
							<option value="alignmentGood" <c:if test="${alignment eq 'alignmentGood'}"> selected </c:if>>좋아요순</option>
						</select>
					</div>
				</div>
				<div id="slistDiv">
					<div class="row" >
						<c:forEach var="slist" items="${slist}">
						<div class="col-lg-3 col-md-6">
							<div class="tour-one__single" >
								<div class="tour-one__image">
									<c:choose>
										<c:when test="${slist.popfile eq null}">
											<a href="#">
												<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
											</a>
										</c:when>
										<c:otherwise>
											<img src='<c:url value="${slist.popfile}"/>' alt="" width="200" height="200" onclick="location.href='shereCenterReadPage?desertion_no=${slist.desertion_no}'" >
										</c:otherwise>
									</c:choose>
								</div>
								<div class="tour-one__content" style="padding: 10px; ">
										<div class="row" >
											<div class="col-lg-12" align="center">
												<font size="2px;"><c:out value="${slist.kind_cd}" /></font>
												<c:choose>
													<c:when test="${slist.sex_cd eq 'M'}"> 
														<font size="3px;" color="Blue">♂</font>
													</c:when>
													<c:when test="${slist.sex_cd eq 'F'}"> 
														<font size="3px;" color="#FF7171;">♀</font>
													</c:when>
													<c:otherwise> 
														<font size="1px;">(미상)</font>
													 </c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-5">
												<font size="1px;" >
													💕 <c:out value="${slist.good}" />&nbsp;
													<i class="far fa-eye"></i> <c:out value="${slist.hit}"/>
												</font>
											
											</div>
											<div class="col-lg-7" align="right">
												<font size="1px;">발견일 : <c:out value="${slist.happen_dt}"/></font>
											</div>
										</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 게시글 페이징 처리(기준 10개) -->
		<div class="post-pagination" id="pagination">
			<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.firstPageNo}">
					<a class="disabledLink" href=""><i class="fa fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a class="page-link" onclick="setPage(${Paging.prevPageNo})"><i class="fa fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo}" end="${Paging.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i eq Paging.pageNo}">
						<a class="active disabledLink" href=""><c:out value="${i}"/></a>
					</c:when>
					<c:otherwise>
						<a onclick="setPage(${i})"><c:out value="${i}"/></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.finalPageNo}">
					<a class="disabledLink" href=""><i class="fa fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a onclick="setPage(${Paging.nextPageNo})"><i class="fa fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		
		<script>
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
	        
	        var resultAddressList = [];
	        
	        var markers = [];
	        var infowindows = [];
	        
	        var allShelterCount;
	        var nowShelterCount;
	        
	        $(function() {
	        	setToCurrentPosition();
			});
	        
	        function pageRefresh() {
	    		console.log("페이지 리프레쉬");
	    		$.ajax({
	    			url: "/shareCenterPage_searchAniamlInRegion",
	    			type: "post",
	    			traditional: true,
	    			data: {
	    				resultAddressList: resultAddressList,
	    				alignment: $("#category2").val(), 
	    				searchTheme: $("#searchTheme").val(),
	    				searchArea: $("#searchArea").val()
	    			},
	    			dataType: 'html',
	    			success: function(data) {
	    				var content = $(data).find("#slistDiv>*");
	    				var pagination = $(data).find("#pagination>*");
	    				$("#slistDiv").html(content);
	    				$("#pagination").html(pagination);
	    			}
	    		});
	    	}
	    	
	    	$(document).on("change", "#category2, #searchTheme, #searchArea", function() {
	    		pageRefresh();
	    	});
	        
	    	function setPage(pageNo) {	        	
	        	$.ajax({
    				url : '/shareCenterPage_searchAniamlInRegion',
    				type : 'post',
    				traditional : true,
    				data : {
    					resultAddressList : resultAddressList,
    					alignment: $("#category2").val(), 
    					searchTheme: $("#searchTheme").val(),
    					searchArea: $("#searchArea").val(),
    					page : pageNo
    				},
    				dataType : 'html', // 반환값
    				success : function(data) {
    					var content = $(data).find("#slistDiv>*");
    					var pagination = $(data).find("#pagination>*");
    					$("#slistDiv").html(content);
    					$("#pagination").html(pagination);
    				}
    			});
	        }
	    	
	        function startSearch() {
	        	resultAddressList = [];
	        	
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
	        				//console.log("주소 검색 시작 : "+this.care_addr);
	        				getAddressPositionAndDisplayMarker(this.care_addr, this.care_nm);
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
	        function getAddressPositionAndDisplayMarker(address, name) {
	        	// 주소-좌표 변환 객체를 생성합니다
	        	var geocoder = new kakao.maps.services.Geocoder();
	        	
	        	// 주소로 좌표를 검색합니다
	        	geocoder.addressSearch(address, function(result, status) {
	        		nowShelterCount = nowShelterCount + 1;
        	    	// 정상적으로 검색이 완료됐으면 
        	     	if (status === kakao.maps.services.Status.OK) {
	        	        var targetPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
	        	        
	        	        if(getDistance(nowPosition, targetPosition) <= radius) {
	        	        	console.log(address + "저장");
    						resultAddressList.push(address);

        					// 마커 생성
        					displayMarker(targetPosition, name);
   						}
	        	    }
	        		
        	    	// 결과값 전송
	        		if(nowShelterCount == allShelterCount) {
	        			$.ajax({
	        				url : '/shareCenterPage_searchAniamlInRegion',
	        				type : 'post',
	        				traditional : true,
	        				data : {
	        					resultAddressList : resultAddressList
	        				},
	        				dataType : 'html', // 반환값
	        				success : function(data) {
	        					console.log(data);
	        					var content = $(data).find("#slistDiv>*");
	        					var pagination = $(data).find("#pagination>*");
	        					var classify = $(data).find("#classify>*");
	        					$("#slistDiv").html(content);
	        					$("#pagination").html(pagination);
	        					$("#classify").html(classify);
	        				}
	        			});
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
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>