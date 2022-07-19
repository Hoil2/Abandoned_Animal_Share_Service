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
<jsp:include page="../layout/libraries.jsp"/>
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
		<jsp:include page="../layout/header.jsp"/>
		<section class="page-header" style="background-image: url(<c:url value="/resources/images/banner_main/${BannerRespectivelyView.getS_file_name()}"/>);">
			<div class="container">
				<h2>실종동물 ${sessionScope.member.getM_id()}</h2>
				<ul class="thm-breadcrumb list-unstyled">
				</ul>
			</div>
		</section><br>
		
		<section class="blog-list" style="padding: 0px 0px;">
			<div class="container">
				<div class="d-flex flex-row-reverse" id="heartDiv">
					<ul class="list-unstyled blog-one__meta">
						<c:if test="${sessionScope.member.getM_id() eq lcbReadPage.m_id}"> 
							<li> <a href="deleteLostAnimalBoard?alb_id=${lcbReadPage.alb_id}">삭제</a></li>
							<li> <a href="">수정</a></li>
						</c:if>
						<li> <a href="javascript:window.history.back();"> 목록</a></li>
						<li><i class="far fa-clock"></i> ${lcbReadPage.reg_date}</li>
					</ul>
				</div><hr>
				<div align="center" >
					<c:if test="${lcbReadPage.img_path ne null}">
						<img src="${lcbReadPage.img_path}" alt="" class="img-fluid" align="center">
					</c:if>
				</div>
				<div class="blog-details__content" style="border: 0px;">
					<div class="row">
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
										<td><font size="3px;">이름 </font></td>
										<td>${lcbReadPage.pet_name}
											<c:choose>
												<c:when test="${lcbReadPage.sex_cd eq 'M'}"> 
													<font size="3px;" color="Blue">♂</font>
												</c:when>
												<c:when test="${lcbReadPage.sex_cd eq 'F'}"> 
													<font size="3px;" color="#FF7171;">♀</font>
												</c:when>
												<c:otherwise> 
													<font size="1px;">(미상)</font>
												 </c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td><font size="3px;">나이 </font></td>
										<td> ${lcbReadPage.age}</td>
									</tr>
									<tr>
										<td><font size="3px;">품종</font></td>
										<td>${lcbReadPage.kind_cd}</td>
									</tr>
									<tr>
										<td><font size="3px;">색상</font></td>
										<td>${lcbReadPage.color_cd}</td>
									</tr>
									<tr>
										<td><font size="3px;">특징</font></td>
										<td><font size="2px;">${lcbReadPage.content}</font></td>
									</tr>
								</tbody> 
							</table><br>
						</div>
						<div class="col-md-6">
							<table class="table">
								<thead>
									<tr class="success">
										<th>기타정보</th>
										<th></th>
									</tr>
								</thead>
								<tbody >
									<tr >
										<td><font size="3px;">작성자 </font></td>
										<td>${lcbReadPage.name}</td>
									</tr>
									<tr>
										<td> <font size="3px;"> 이메일</font></td>
										<td>${lcbReadPage.email}</td>
									</tr>
									<tr>
										<td><font size="3px;">연락처</font></td>
										<td>${lcbReadPage.phone}</td>
									</tr>
									<tr>
										<td><font size="3px;">분실일</font></td>
										<td><font size="2px;">${lcbReadPage.lost_date}</font></td>
									</tr>
									<tr>
										<td><font size="3px;">분실장소</font></td>
										<td><font size="2px;">${lcbReadPage.lost_place}</font></td>
									</tr>
								</tbody> 
							</table><br>
						</div>
						
						<br>
					</div>
				</div>
				<br>
				
			</div>
		</section>	
		<br>
		<jsp:include page="../layout/footer.jsp"/>
</body>
</html>