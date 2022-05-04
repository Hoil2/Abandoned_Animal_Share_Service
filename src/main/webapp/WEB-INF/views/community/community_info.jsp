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
</style>
</head>
<body link="red">
	<!-- 페이지 로딩 이미지 -->
	<%-- Preloader --%>
	<div class="preloader">
		<img src='<c:url value="/resources/images/loader3.png"/>' class="preloader__image" alt="">
	</div>
	
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<a class="btn border border-2 float-right">글쓰기</a>
		
		<%-- 게시물 영역 --%>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>번호</th> <th>제목</th> <th>작성자</th> <th>날짜</th> <th>조회수</th> <th>댓글수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="list" items="${clist}"> 
					<tr>
						<td>${list.cb_id}</td> <td><a href="#">${list.title}</a></td> <td>${list.m_id}</td> <td>${list.reg_date}</td> <td>${list.hit}</td> <td>0</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<!-- Pagination 영역 -->
		<div class="post-pagination">
			<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo == Paging.firstPageNo }">
					<a class="disabledLink" href="/community/info?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="/community/info?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
				<c:choose>
					<c:when test="${i == Paging.pageNo }">
						<a class="active disabledLink" href="/community/info?page=${i}"><c:out value="${i}"/></a>
					</c:when>
					
					<c:otherwise>
						<a href="/community/info?page=${i}"><c:out value="${i}"/></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo == Paging.finalPageNo }">
					<a class="disabledLink" href="/community/info?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="/community/info?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		<br/>
		<%-- Pagination 끝 --%>
	</div>
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	
</body>
</html>