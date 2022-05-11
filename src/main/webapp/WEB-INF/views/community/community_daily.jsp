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
	
	<%-- 게시물 영역 --%>
	<div class="container">
		<section class="page-header mb-3" style="background-image: url(<c:url value="/resources/images/banner_main/${BannerRespectivelyView.getS_file_name()}"/>);">
			<div class="container">
				<h2>일상 공유 게시판</h2>
			</div>
		</section>
		<table class="table table-hover">
			<thead>
				<tr class="text-center">
					<th>사진</th> <th>제목</th> <th>작성자</th> <th>날짜</th> <th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${clist}"> 
					<tr>
						<td class="text-center align-middle"><img src='<c:url value="${list.img_path}"/>' style="width:100px"/></td> 
						<td class="text-start align-middle"><a href="/community/daily/${list.cb_id}">${list.title}</a></td> 
						<td class="text-center align-middle">${list.name}</td> 
						<td class="text-center align-middle">${list.reg_date}</td> 
						<td class="text-center align-middle">${list.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="d-flex flex-row-reverse pb-3">
			<a class="btn border border-2" href="/write?classify=2">글쓰기</a>
		</div>		
	
		<%-- Pagination 영역 --%>
		<div class="row post-pagination">
			<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo == Paging.firstPageNo }">
					<a class="disabledLink" href="/community/daily?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="/community/daily?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
				<c:choose>
					<c:when test="${i == Paging.pageNo }">
						<a class="active disabledLink" href="/community/daily?page=${i}"><c:out value="${i}"/></a>
					</c:when>
					
					<c:otherwise>
						<a href="/community/daily?page=${i}"><c:out value="${i}"/></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo == Paging.finalPageNo }">
					<a class="disabledLink" href="/community/daily?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="/community/daily?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		<br/>
		<%-- Pagination 끝 --%>
	</div>
	
	<jsp:include page="../layout/footer.jsp"/>

</body>
</html>