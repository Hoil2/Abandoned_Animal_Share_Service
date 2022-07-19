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
<jsp:include page="layout/libraries.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<title>멍멍냥냥</title>
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
		
		<section class="blog-list" style="padding: 0px 0px;">
			<div class="container">
				<div class="d-flex flex-row-reverse" id="heartDiv">
					<ul class="list-unstyled blog-one__meta">
						<li> <a href="javascript:window.history.back();"> 목록</a></li>
						<li><i class="far fa-clock"></i> ${scrReadPage.redate  }</li>
						<li><i class="far fa-eye"></i>
							<c:choose>
								<c:when test="${hitReadPage eq 1}"> 
									${scrReadPage.hit+1}
								</c:when>
								<c:otherwise> 
									${scrReadPage.hit}
								 </c:otherwise>
							</c:choose>
						</li>
						<c:choose>
							<c:when test="${member ne null && boardLikeCheck eq 1}"> 
								<li><i class="fas fa-heart" onclick="subtractGood_click()"></i> ${scrReadPage.good }</li>
							</c:when>
							<c:when test="${member ne null && boardLikeCheck ne 1}">
								<li><i class="far fa-heart" onclick="addGood_click();"></i> ${scrReadPage.good }</li>
							</c:when>
							<c:otherwise> 
								<li><i class="far fa-heart" onclick="buttonNoLogin_click();"></i> ${scrReadPage.good }</li>
							 </c:otherwise>
						</c:choose>
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
										<td><font size="3px;">종</font></td>
										<td>${scrReadPage.kind_cd}</td>
									</tr>
									
									<tr>
										<td><font size="3px;">특징</font></td>
										<td><font size="2px;">${scrReadPage.special_mark}</font></td>
									</tr>
								</tbody> 
							</table><br>
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
						<br>
						<div class="col-md-12">
							<table class="table">
								<tbody>
									<tr class="success">
										<th class="success">보호소 정보</th>
										<th> </th>
									</tr>
									<tr>
										<td><font size="3px;">보호소</font></td>
										<td>${scrReadPage.notice_no}</td>
									</tr>
									<tr>
										<td> <font size="3px;"> 보호장소</font></td>
										<td>${scrReadPage.process_state}</td>
									</tr>
									<tr>
										<td><font size="3px;">전화번호</font></td>
										<td>${scrReadPage.notice_sdt} ~ ${scrReadPage.notice_edt}</td>
									</tr>
									<tr>
										<td><font size="3px;">관할기관</font></td>
										<td>${scrReadPage.happen_place}</td>
									</tr>
									<tr>
										<td><font size="3px;">담당자 / 연락처</font></td>
										<td>${scrReadPage.happen_place}</td>
									</tr>
									<tr>
										<td><font size="3px;">특이사항</font></td>
										<td>${scrReadPage.happen_place}</td>
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
		<jsp:include page="layout/footer.jsp"/>
	</div>
	
<script>
	function addGood_click() {
		$.ajax({
			url: "addGoodShareCenter",
			type: "GET",
			data: {'desertion_no':${scrReadPage.desertion_no}},
			success: function() {
				var shereCenterUrl = "shereCenterReadPage?desertion_no=" + ${scrReadPage.desertion_no};
				$("#heartDiv").load(shereCenterUrl + " #heartDiv");
			}
		});
	}
	
	function subtractGood_click() {
		$.ajax({
			url: "subtractGoodShareCenter",
			type: "GET",
			data: {'desertion_no':${scrReadPage.desertion_no}},
			success: function() {
				var shereCenterUrl = "shereCenterReadPage?desertion_no=" + ${scrReadPage.desertion_no};
				$("#heartDiv").load(shereCenterUrl + " #heartDiv");
			}
		});
	}
	
	function buttonNoLogin_click() {
		swal({
			title: "로그인",
			text: "로그인이 되어야 하트를 누를 수 있습니다.",
			icon: "warning",
		});
	}
</script>
</body>
</html>