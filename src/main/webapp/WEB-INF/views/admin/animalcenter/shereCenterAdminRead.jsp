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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href='<c:url value="/resources/css/fontawesome-all.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/resources/css/style.css"/>'>
<link rel="stylesheet" href='<c:url value="/resources/css/responsive.css"/>'><link rel="stylesheet">
<title>멍멍냥냥</title>
</head>
<body link="red">
	<!-- 페이지 로딩 이미지 -->
	
	<!-- 메인 영역 -->
	<div class="page-wrapper">
		<br>
		
		<section class="blog-list" style="padding: 0px 0px;">
			<div class="container">
				<div class="d-flex flex-row-reverse" id="heartDiv">
					
					<ul class="list-unstyled blog-one__meta">
						<li><i class="far fa-clock"></i> <fmt:formatDate value="${scrReadPage.redate }" pattern="yyyy-MM-dd a h:mm"/></li>
						<li><i class="far fa-eye"></i>${scrReadPage.hit}</li>
						<li><i class="far fa-heart" ></i> ${scrReadPage.good }</li>
					</ul>
				</div><hr>
				<div align="center" >
					<c:if test="${scrReadPage.popfile ne null}">
						<img src="${scrReadPage.popfile}" alt="" class="img-fluid" align="center">
					</c:if>
				</div>
				<div class="blog-details__content" style="border: 0px;">
					<div class="row">
						<div class="col-md-12">No. ${scrReadPage.desertion_no}</div>
						<div class="col-md-6">
							<table class="table">
								<thead>
									<tr class="success">
										<th>동물 정보</th>
										<th></th>
									</tr>
								</thead>
								<tbody >
									<tr >
										<td><font size="3px;">나이 / 몸무게</font></td>
										<td>${scrReadPage.age} / ${scrReadPage.weight}</td>
									</tr>
									<tr>
										<td><font size="3px;">성별 / 중성화여부</font></td>
										<td>
											<c:if test="${scrReadPage.sex_cd eq 'M'}">
												수컷 /
											</c:if>
											<c:if test="${scrReadPage.sex_cd eq 'F'}">
												암컷 /
											</c:if>
											<c:if test="${scrReadPage.sex_cd eq 'Q'}">
												미상 /
											</c:if>
											<c:if test="${scrReadPage.neuter_yn eq 'Y'}">
												O 
											</c:if>
											<c:if test="${scrReadPage.neuter_yn eq 'N'}">
												X 
											</c:if>
											<c:if test="${scrReadPage.neuter_yn eq 'U'}">
												미상
											</c:if>
										</td>
									</tr>
									<tr>
										<td><font size="3px;">종 </font></td>
										<td><input type="text" class="form contol" value="${scrReadPage.kind_cd}" id="kind_cd" name="kind_cd"></td>
									</tr>
									<tr>
										<td><font size="3px;">색상 </font></td>
										<td><input type="text" class="form contol" value="${scrReadPage.color_cd}" id="color_cd" name="color_cd"></td>
									</tr>
									<tr>
										<td><font size="3px;">특징</font></td>
										<td><font size="2px;">${scrReadPage.special_mark}</font></td>
									</tr>
								</tbody> 
							</table>
						</div>
						
						<div class="col-md-6">
							<table class="table">
								<tbody>
									<tr class="success">
										<th>공고 정보</th>
										<th> </th>
									</tr>
									<tr>
										<td><font size="3px;">공고번호</font></td>
										<td>${scrReadPage.notice_no}</td>
									</tr>
									<tr>
										<td> <font size="3px;"> 상태</font></td>
										<td>${scrReadPage.process_state}</td>
									</tr>
									<tr>
										<td><font size="3px;">공고시작일 ~ 종료일</font></td>
										<td>${scrReadPage.notice_sdt} ~ ${scrReadPage.notice_edt}</td>
									</tr>
									<tr>
										<td><font size="3px;">발견장소</font></td>
										<td>${scrReadPage.happen_place}</td>
									</tr>
								</tbody> 
							</table>
						</div>
						
						<div class="col-md-12" align="right">
							<button class="btn btn-primary" id="btnModtifyAnimalInfo">수정</button>
						</div>
						<div class="col-md-12" style="margin-top: 15px;">
							<table class="table">
								<tbody>
									<tr class="success">
										<th class="success">보호소 정보</th>
										<th> </th>
									</tr>
									<tr>
										<td colspan="2">
											<div id="map" style="width:100%;height:350px;"></div>
										</td>
									</tr>
									
									<tr>
										<td><font size="3px;">보호소</font></td>
										<td>${scrReadPage.care_nm}</td>
									</tr>
									<tr>
										<td> <font size="3px;"> 보호장소</font></td>
										<td>${scrReadPage.care_addr}</td>
									</tr>
									<tr>
										<td><font size="3px;">전화번호</font></td>
										<td>${scrReadPage.care_tel}</td>
									</tr>
									<tr>
										<td><font size="3px;">관할기관</font></td>
										<td>${scrReadPage.org_nm}</td>
									</tr>
									<tr>
										<td><font size="3px;">담당자 / 연락처</font></td>
										<td>${scrReadPage.charge_nm} / ${scrReadPage.officetel}</td>
									</tr>
								</tbody> 
							</table>
						</div>
					</div>
				</div>
				<br>
				
			</div>
		</section>	
		<br>
	</div>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51b48d7e64099981156514cbd0f41107&libraries=services,clusterer,drawing"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var care_addr = "${scrReadPage.care_addr}";
	var care_nm =  "${scrReadPage.care_nm}";
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(care_addr, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:200px;text-align:center;padding:6px 0;">' + care_nm  + '</div>'
	        });
	        infowindow.open(map, marker);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
	$('#btnModtifyAnimalInfo').click(function() {
		var url = "/admin/updateAbandonedAnimalInfo";
		var desertion_no = ${scrReadPage.desertion_no}
		var kind_cd = $("#kind_cd").val();
		var color_cd = $("#color_cd").val();
		
		if (!kind_cd){
    		Swal.fire({
	  			title: '유기동물 정보 수정.',
		  		text: "유기동물 종 정보를 입력해주세요.",
		  		icon: 'warning',
				timer: 3000,
		  		confirmButtonColor: '#3085d6',
		  		confirmButtonText: '확인'
		  	})
	    }else if (!color_cd){
    		Swal.fire({
	  			title: '유기동물 정보 수정.',
		  		text: "유기동물 색상 정보를 입력해주세요.",
		  		icon: 'warning',
		  		timer: 3000,
		  		confirmButtonColor: '#3085d6',
		  		confirmButtonText: '확인'
		  	})
	    }
		else{
	    	Swal.fire({
	  		  	title: '유기동물 정보 수정',
  		  		text: "유기동물 정보를 수정하시겠습니까?.",
  		    	icon: 'warning',
  		   		showCancelButton: true,
  		   		confirmButtonColor: '#3085d6',
  		   		cancelButtonColor: '#d33',
  		  	 	confirmButtonText: '수정',
  		  	 	cancelButtonText: '취소'
	  		}).then((result) => {
	  		  if (result.value) {
	  			$.ajax({
				    url : url,
				    type : 'POST',
				    traditional : true,
				    data:  {'desertion_no': desertion_no, 'kind_cd':kind_cd, 'color_cd':color_cd},
	                success: function(jdata){
	                    if(jdata != 1) {
	                    	alert("삭제 실패(문의전화 : 010-9748-5575 or 010-3266-5702)");
	                    } else{
	                    	location.reload();
	                    }
	                }
				});
	  		  }
	  		})
		}
	})
	
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>