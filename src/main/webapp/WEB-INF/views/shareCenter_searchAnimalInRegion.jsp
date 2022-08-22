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
	
	if(sessionStorage.getItem("searchTheme")==null){
		sessionStorage.setItem("searchTheme", "allTheme"); 
		$("#searchTheme").val("allTheme").prop("selected", true);
	}else{
		$("#searchTheme").val(sessionStorage.getItem("searchTheme")).prop("selected", true);
	}
	
	if(sessionStorage.getItem("searchArea")==null){
		sessionStorage.setItem("searchArea", "allArea"); 
		$("#searchArea").val("allArea").prop("selected", true);
	}else{
		$("#searchArea").val(sessionStorage.getItem("searchArea")).prop("selected", true);
	}
	
	if(sessionStorage.getItem("category2")==null){
		$("#category2").val("alignmentDay").prop("selected", true);
	}else{
		$("#category2").val(sessionStorage.getItem("category2")).prop("selected", true);
	}
	
	function pageRefresh() {
		$.ajax({
			url: "shereCenterPage",
			type: "GET",
			data: {'alignment':$("#category2").val(), 'searchTheme': $("#searchTheme").val(), 'searchArea':$("#searchArea").val()},
			success: function(data) {
				//location.href = "shereCenterPage?alignment="+sessionStorage.getItem("category2");
				//location.href  = "shereCenterPage?searchTheme=" +sessionStorage.getItem("searchTheme") + "&searchArea=" + sessionStorage.getItem("searchArea") + "&alignment="+ sessionStorage.getItem("category2");
				var shereCenterUrl = "shereCenterPage?searchTheme=" +sessionStorage.getItem("searchTheme") + "&searchArea=" + sessionStorage.getItem("searchArea") + "&alignment="+ sessionStorage.getItem("category2");
				
				$("#slistDiv").load(shereCenterUrl + " #slistDiv");
				$("#pagination").load(shereCenterUrl + " #pagination");
			}
		});
	}
	
	$("#category2").on("change", function() {
		console.log($("#category2").val());
		sessionStorage.setItem("category2", $(this).val()); 

		pageRefresh();
		console.log("2"+sessionStorage.getItem("category2"));
	});
	
	$("#searchTheme").on("change", function() {
		pageRefresh();
		console.log("2")
		console.log($("#searchTheme").val());
		sessionStorage.setItem("searchTheme", $(this).val()); 
	});
	
	$("#searchArea").on("change", function() {
		pageRefresh();
		sessionStorage.setItem("searchArea", $(this).val()); 
		console.log($("#searchArea").val());
		console.log("3")
	});
	
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
						  		<input type="number" id="radius" class="form-control" value="3">
								<div class="input-group-append">
								    <span class="input-group-text">km</span>
								</div>
							</div>
						</div>
						
						<label class="col-form-label pt-4">주소로 검색 위치 변경</label>
						<div class="row">
							<div class="px-3 input-group">
								<input type="text" class="form-control"/>
								<div class="input-group-append">
							    	<button type="button" class="btn btn-outline-secondary">변경</button>
							    </div>
						    </div>
						</div>
						
						<div class="d-flex flex-row justify-content-end mt-4">
							<input type="button" class="btn btn-secondary btn-lg mr-4" value="현재 위치로 변경">
							<input type="button" class="btn btn-primary btn-lg" value="검색" onclick="drawCircle()">
						</div>
					</div>
					
					<div class="col">
						<%-- 카카오 지도 추가 --%>
						<div id="kakaoMap" style="width:500px;height:400px;"></div>
					</div>
				</div>
				<%-- 검색 필터 --%>
				<div class="d-flex flex-row justify-content-end"  style="margin: 10px 0px;">
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
				<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
					<a class="disabledLink" href="shereCenterPage?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="shereCenterPage?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
				<c:choose>
					<c:when test="${i eq Paging.pageNo }">
						<a class="active disabledLink" href="shereCenterPage?page=${i}"><c:out value="${i }"/></a>
					</c:when>
					<c:otherwise>
						<a href="shereCenterPage?page=${i}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}"><c:out value="${i }"/></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
					<a class="disabledLink" href="shereCenterPage?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="shereCenterPage?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
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
	        
	        $(function() {
	        	setToCurrentPosition();
			});
	        
	        function drawCircle() {
	        	var radius = $('#radius').val() * 1000;
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
        	 	
	        	return nowPosition;
	        }
	        
	        // 주소로 위치값 구하는 함수
	        function getAddressPosition(address) {
	        	// 주소-좌표 변환 객체를 생성합니다
	        	var geocoder = new kakao.maps.services.Geocoder();
	        	
	        	// 주소로 좌표를 검색합니다
	        	geocoder.addressSearch(address, function(result, status) {
	        	    // 정상적으로 검색이 완료됐으면 
	        	     if (status === kakao.maps.services.Status.OK) {
	        	        var targetPosotion = new kakao.maps.LatLng(result[0].y, result[0].x);
	        					return targetPosition;
	        	    } 
	        	});
	        	return null;
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
	            
	            var iwContent = message, // 인포윈도우에 표시할 내용
	                iwRemoveable = true;

	            // 인포윈도우를 생성합니다
	            var infowindow = new kakao.maps.InfoWindow({
	                content : iwContent,
	                removable : iwRemoveable
	            });
	            
	            // 인포윈도우를 마커위에 표시합니다 
	            infowindow.open(map, marker);
	            
	                
	        }    
			
	    </script>
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>