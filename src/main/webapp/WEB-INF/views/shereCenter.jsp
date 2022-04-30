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
				<h2>여행 포토</h2>
				<ul class="thm-breadcrumb list-unstyled">
					<li><a>CarefinTour</a></li>
				</ul>
			</div>
		</section>

		<section class="tour-one tour-grid">
			<div class="container">
				<div class="d-flex">
					<div class="ml-auto">
						<c:if test="${sessionScope.member ne null && sessionScope.member.getGrade() ne 'User'}">
							<button class="thm-btn-psd" onclick="location.href='travelphotoWrite'">등록</button>
						</c:if>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="tour-one__single">
							<div class="tour-one__image">
								<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
							</div>
						</div>
						
											<div>
						<p align="right"><font size="1px"> 조회수 : ${photoBoardList.b_hit}</font></p>
						<h3 style="font-size: 19px;">
						 	<c:if test="${member == null}">
						 		<a href="PhotoBoardDetailView?b_no=${photoBoardList.b_no}"><c:out value="${fn:substring(photoBoardList.b_title, 0 ,20)}" /></a>
							</c:if>
						 	<c:if test="${member != null}">
						 		<a href="PhotoBoardDetailView?b_no=${photoBoardList.b_no}&m_userId=${member.getM_userId()}"><c:out value="${fn:substring(photoBoardList.b_title, 0 ,20)}" /></a>
							</c:if>
						</h3>
						<p><c:out value="${fn:substring(photoBoardList.b_content,0,20)}" /></p>
						<ul class="tour-one__meta list-unstyled">
							<li><font size="1px">작성자 : ${photoBoardList.b_userId}&emsp;&emsp; 작성일 : ${photoBoardList.b_writing_date} </font> </li>
						</ul>
					</div>
					</div>
										<div class="col-lg-3 col-md-6">
						<div class="tour-one__single">
							<div class="tour-one__image">
								<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
							</div>
						</div>
					</div>
										<div class="col-lg-3 col-md-6">
						<div class="tour-one__single">
							<div class="tour-one__image">
								<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
							</div>
						</div>
					</div>
										<div class="col-lg-3 col-md-6">
						<div class="tour-one__single">
							<div class="tour-one__image">
								<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 게시글 페이징 처리(기준 10개) -->
		<div class="post-pagination">
			<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
					<a class="disabledLink" href="travelphoto?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="travelphoto?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
				<c:choose>
					<c:when test="${i eq Paging.pageNo }">
						<a class="active disabledLink" href="travelphoto?page=${i}"><c:out value="${i }"/></a>
					</c:when>
					<c:otherwise>
						<a href="travelphoto?page=${i}"><c:out value="${i }"/></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
					<a class="disabledLink" href="travelphoto?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="travelphoto?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		
		
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>