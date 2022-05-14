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

		<section class="tour-one tour-grid" style="padding: 0px;">
			
			<div class="container">
				<div class="d-flex flex-row justify-content-end" style="margin: 10px;">
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 0px;"> 분류</div>
					<div class="col-lg-3 col-md-3">
						분류
						<select class="form-control">
							<option>전체</option>
							<option>개</option>
							<option>고양이</option>
							<option>기타</option>
						</select>
						지역
						<select class="form-control">
							<option>서울</option>
						</select>
					</div>
					
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 0px;">지역 </div>
					<div class="col-lg-3 col-md-3" align="left">
						<select class="form-control">
							<option>서울</option>
						</select>
					</div>
					
					<div  class="col-lg-2 col-md-2" align="center">
						<button class="thm-btn-psd" onclick="location.href='travelphotoWrite'" >검색</button>
					</div>
				</div>
				<hr style="margin: 0px;">
				<div class="d-flex flex-row justify-content-end"  style="margin: 10px 0px;">
					<div class="col-lg-2 col-md-2" align="right" style="padding: 0px 0px;">
						<select class="form-control">
							<option>최신순</option>
							<option>조회순</option>
							<option>좋아요순</option>
						</select>
					</div>
				</div>
				<div class="row">
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
										<img src='<c:url value="${slist.popfile}"/>' alt="" width="200" height="200" onclick="location.href='main'" >
									</c:otherwise>
								</c:choose>
							</div>
							<div class="tour-one__content" style="padding: 10px; ">
									<div class="row" >
										<div class="col-lg-12" align="center"><font size="2px;"><c:out value="${slist.kind_cd}" /></font></div>
									</div>
									<div class="row">
										<div class="col-lg-5">
											<font size="1px;" >
												💕 <c:out value="${slist.good}" />&nbsp;
												👁‍🗨 <c:out value="${slist.hit}"/>
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
		</section>
		
		<!-- 게시글 페이징 처리(기준 10개) -->
		<div class="post-pagination">
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
						<a href="shereCenterPage?page=${i}"><c:out value="${i }"/></a>
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
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>