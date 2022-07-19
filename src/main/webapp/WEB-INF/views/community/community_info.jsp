<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<jsp:include page="../layout/libraries.jsp"/>
<!-- bootstrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>정보 공유 게시판</title>

<style type="text/css">
	.preloader {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  min-height: 100vh;
	  background: #301e4e;
	}
	a {
			text-decoration: none;
	}
</style>
</head>
<body link="red">
	<%-- Preloader --%>
	<div class="preloader">
		<img src='<c:url value="/resources/images/loader3.png"/>' class="preloader__image" alt="">
	</div>
	
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
	
	<section class="page-header mb-3" style="background-image: url(<c:url value="/resources/images/banner_main/${BannerRespectivelyView.getS_file_name()}"/>);">
		<div class="container">
			<h2>정보 공유 게시판</h2>
		</div>
	</section>
	<%-- main 영역 --%>
	<div class="container">
		<%-- 게시물 영역 --%>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>제목</th> <th>작성자</th> <th>날짜</th> <th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="list" items="${clist}"> 
					<tr>
						<td><a href="/community/info/${list.cb_id}">${list.title}</a></td> <td>${list.name}</td> <td>${list.reg_date}</td> <td>${list.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<c:if test="${member != null}">
			<div class="d-flex flex-row-reverse pb-3">
				<a class="btn border border-2" href="/write?classify=3">글쓰기</a>
			</div>		
		</c:if>
		<%-- Pagination 영역 --%>
		<div class="post-pagination">
			<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo == Paging.firstPageNo }">
					<a class="disabledLink" href="/community/info?filter=${filter}&keyword=${keyword}&page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="/community/info?filter=${filter}&keyword=${keyword}&page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
				<c:choose>
					<c:when test="${i == Paging.pageNo }">
						<a class="active disabledLink" href="/community/info?filter=${filter}&keyword=${keyword}&page=${i}"><c:out value="${i}"/></a>
					</c:when>
					
					<c:otherwise>
						<a href="/community/info?filter=${filter}&keyword=${keyword}&page=${i}"><c:out value="${i}"/></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo == Paging.finalPageNo }">
					<a class="disabledLink" href="/community/info?filter=${filter}&keyword=${keyword}&page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="/community/info?filter=${filter}&keyword=${keyword}&page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		<br/>
		<%-- Pagination 끝 --%>
		
		<%-- 검색창 --%>
		<form action="info">
			<div class="d-flex justify-content-center mb-3">
				<div>
					<select class="form-select form-select-sm border border-dark" style="height:40px;" name="filter" aria-label=".form-select-sm example">
					  <option selected value="total">전체</option>
					  <option value="title">제목</option>
					  <option value="content">내용</option>
					  <option value="title+content">제목+내용</option>
					</select>
				</div>
				<div>
					<div class="form-group">
						<input class="form-contorl" size=35 name="keyword" style="height:40px;"/>
					</div>
				</div>
				
				<div>
					<button class="btn btn-outline-dark" type="submit" style="height:40px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
					</button>
				</div>
			</div>
		</form>
		<%-- 검색창 끝 --%>
	</div>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	
</body>
</html>