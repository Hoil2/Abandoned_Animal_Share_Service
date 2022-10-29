<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍멍냥냥 일상 게시판 대시보드</title>
</head>
<body id="page-top">
    <div id="wrapper">
    	<!-- 좌측 배너 부분 -->
		<jsp:include page="../layout/banner.jsp"/>
		<!-- 좌측 배너 부분 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- 상단 헤더 부분 -->
				<jsp:include page="../layout/header.jsp"/>
				<!-- 상단 헤더 부분 -->
				
				<!-- 본문 -->
				<div class="container-fluid">
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
					</div>
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-success text-uppercase mb-1">오늘의 게시글 작성 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">개</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<form action="/admin/memberSearchList" role="form" method="GET" class="form-inline">
								<select class="form-control" id="searchCategory" name="searchCategory">
									<option value="course_title">강의명</option>
									<option value="teacher_name">강사명</option>
									<option value="teacher_email">이메일</option>
								</select>
								<div class="ml-3">
									<input type="text" id="searchKeyword " name="searchKeyword" placeholder="검색어를 입력하세요." class="form-control" required="required">
									<button type="submit" class="btn px-3 btn-primary">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</form>
						</div>
							
						<div class="col">
							<div class="d-flex">
								<div class="ml-auto">
									<button class="btn btn-primary mr-2" data-toggle="modal" data-target="#AdminSignUp">강의 등록</button>
									
								</div>
							</div>
						</div>
					</div>
					<div>
						<table class="table table-hover table-white text-center">
							<thead>
								<tr>
									<th>
										<input id="allCheck" type="checkbox" name="allCheck">
									</th>
									<th>강의NO</th>
									<th>ori No</th>
									<th>강의명</th>
									<th>강사명</th>
									<th>요청날짜</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cr" items="${courseRequestList}">
									<tr>
										<td>
											<input name="rowCheck" type="checkbox" value="${cr.olr_no}">			
										</td>
										<td>${cr.oli_no}</td>
										<td>${cr.origin_oli_no}</td>
										<td><a href="">${cr.course_title}</a></td>
										<td>${cr.teacher_name}</td>
										<td>${cr.request_datetime}</td>
										<td>
											<input type="button" class="btn btn-info" value="승인" onclick="approvalCourseRequest(${cr.olr_no});">
											<button type="button" class="btn btn-secondary" onclick="rejectCourseRequest(${cr.olr_no});">거절</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
						
					<!-- 게시글 페이징 처리(기준 10개) -->
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
					
							<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
							<c:choose>
								<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
									<li class="page-item disabled">
										<a class="page-link" href="memberList?page=${Paging.prevPageNo}">Previus</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="memberList?page=${Paging.prevPageNo}">Previus</a>
									</li>
								</c:otherwise>
							</c:choose>
							<!-- 페이지 갯수만큼 버튼 생성 -->
							<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
								<c:choose>
									<c:when test="${i eq Paging.pageNo }">
										<li class="page-item disabled">
											<a class="page-link" href="memberList?page=${i}"><c:out value="${i }"/></a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="memberList?page=${i}"><c:out value="${i }"/></a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
							<c:choose>
								<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
									<li class="page-item disabled">
										<a class="page-link" href="memberList?page=${Paging.nextPageNo}">Next</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="memberList?page=${Paging.nextPageNo}">Next</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
				<!-- 본문 -->
			</div>
			<!-- 하단 푸터 부분 -->
			<jsp:include page="../layout/footer.jsp"/>
    		<!-- 하단 푸터 부분 -->
		</div>
	</div>
    
    <script>
    
    </script>
</body>
</html>