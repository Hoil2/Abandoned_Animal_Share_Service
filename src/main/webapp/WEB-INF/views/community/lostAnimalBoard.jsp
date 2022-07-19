<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d6c0ae7305fb9210dc71640a373972b"></script>
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
	
	<!-- 메인 영역 -->
	<div class="page-wrapper">
		<jsp:include page="../layout/header.jsp"/>
		
		<section class="page-header" style="background-image: url(<c:url value="/resources/images/banner_main/${BannerRespectivelyView.getS_file_name()}"/>);">
			<div class="container">
				<h2>실종동물</h2>
				<ul class="thm-breadcrumb list-unstyled">
				</ul>
			</div>
		</section><br>

		<section class="tour-one tour-grid" style="padding: 0px;">
			<div class="container">
				<div align="right">
					<c:if test="${sessionScope.member.getM_id() eq null}"> 
						<button class="btn btn-outline-warning" id="buttonNoLogin">글작성</button>
					</c:if>
					<c:if test="${sessionScope.member.getM_id() ne null}">
						<button class="btn btn-outline-warning" id="buttonWrite">글작성</button>
					</c:if>
				</div>
				<hr>
				<div id="slistDiv">
					<div class="row" >
						<c:forEach var="slist" items="${slist}">
						<div class="col-lg-3 col-md-6">
							<div class="tour-one__single" >
								<div class="tour-one__image">
									<c:choose>
										<c:when test="${slist.img_path eq null}">
											<a href="#">
												<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
											</a>
										</c:when>
										<c:otherwise>
											<img src='<c:url value="${slist.img_path}"/>' alt="" width="200" height="200" onclick="location.href='readLostCommunityBoard?alb_id=${slist.alb_id}'" >
										</c:otherwise>
									</c:choose>
								</div>
								<div class="tour-one__content" style="padding: 10px; ">
									<div class="row">
										<div class="col-lg-12" style="letter-spacing: 0px;">
												<font size="2px;" style="letter-spacing: 0px;">이름 : ${slist.pet_name}</font>
												<c:choose>
													<c:when test="${slist.sex_cd eq 'M'}"> 
														<font size="3px;" color="Blue">♂</font>
													</c:when>
													<c:when test="${slist.sex_cd eq 'F'}"> 
														<font size="3px;" color="#FF7171;">♀</font>
													</c:when>
													<c:otherwise> 
														<font size="1px;">(미상)</font>
													 </c:otherwise>
												</c:choose>
												<br>
												<font size="2px;" style="letter-spacing: 0px;">신고자 : ${slist.name}</font> <br>
												<font size="2px;"style="letter-spacing: 0px;">품종 : ${slist.kind_cd}</font> <br>
												<font size="2px;"style="letter-spacing: 0px;">실종일 : ${slist.lost_date}</font> <br>
												<font size="2px;"style="letter-spacing: 0px;">실종장소 : ${fn:substring(slist.lost_place, 0, 10)}</font> <br>
												<font size="2px;"style="letter-spacing: 0px;">특징 : ${fn:substring(slist.content, 0, 15)}</font>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 게시글 페이징 처리(기준 10개) -->
		<div class="post-pagination" id="pagination">
			<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
					<a class="disabledLink" href="communityLostBoard?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="communityLostBoard?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
				<c:choose>
					<c:when test="${i eq Paging.pageNo }">
						<a class="active disabledLink" href="communityLostBoard?page=${i}"><c:out value="${i }"/></a>
					</c:when>
					<c:otherwise>
						<a href="communityLostBoard?page=${i}"><c:out value="${i }"/></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
					<a class="disabledLink" href="communityLostBoard?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="communityLostBoard?page=${Paging.nextPageNo}"><i class="fa fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<jsp:include page="../layout/footer.jsp"/>
	</div>
<script type="text/javascript">
	
	$('#buttonNoLogin').click(function(){
		swal({
			title: "로그인",
			text: "로그인이 되어야 게시글 작성이 가능합니다.",
			icon: "warning",
		});
	});
	
	$('#buttonWrite').click(function(){
		location.href =  "/writeLostAnimalBoard";
		
	});
</script>
</body>
</html>