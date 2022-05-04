<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="apple-touch-icon" sizes="180x180" href='<c:url value="/resources/favicons/apple-touch-icon.png"/>'>
<link rel="icon" type="image/png" sizes="32x32" href='<c:url value="/resources/images/favicons/favicon-32x32.png"/>'>
<link rel="icon" type="image/png" sizes="16x16" href='<c:url value="/resources/images/favicons/favicon-16x16.png"/>'>
<link rel="manifest" href='<c:url value="/resources/images/favicons/site.webmanifest"/>'>
<title>일상 공유 게시판</title>

<style type="text/css">
.preloader {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #301e4e;
}
</style>
</head>
<body link="red">
	<!-- 페이지 로딩 이미지 -->
	<%-- Preloader --%>
	<div class="preloader">
		<img src='<c:url value="/resources/images/loader3.png"/>' class="preloader__image" alt="">
	</div>
	
	<jsp:include page="../layout/header.jsp"/>
	
	
	<!-- 메인 영역 -->
	<section class="page-header" style="background-image: url(<c:url value="/resources/images/banner_main/${BannerRespectivelyView.getS_file_name()}"/>);">
		<div class="container">
			<h2>일상 공유 게시판</h2>
			<ul class="thm-breadcrumb list-unstyled">
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
				<c:forEach var="clist" items="${slist}">
				<div class="col-lg-3 col-md-6">
					<div class="tour-one__single">
						<div class="tour-one__image">
							<c:choose>
								<c:when test="${clist.filename eq null}">
									<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
								</c:when>
								<c:otherwise>
									<img src='<c:url value="${clist.filename}"/>' alt="" width="200" height="200">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="tour-one__content">
							<h3 style="font-size: 19px;">
								<a href="travelphotoView?prid=${TravelPhotoList.prid}">품종 : <c:out value="${fn:substring(clist.kind_cd, 0 ,35)}" /></a>
							</h3>
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
	
	

	<jsp:include page="../layout/footer.jsp"/>

</body>
</html>