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
<jsp:include page="layout/libraries.jsp"/>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>멍멍냥냥</title>
<script>
$(document).ready(function() {
	
	$("#category2").on("change", function() {
		//location.href = "shereCenterPage?page=1&searchTheme=" + $("#searchTheme").val() + "&searchArea=" + $("#searchArea").val()  + "&alignment=" + $("#category2").val();
		shereCenterUrl = "shereCenterPage?page=1&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
		$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		//$("#pagination").load(shereCenterUrl + " #pagination");
	});
	
	$("#searchTheme").on("change", function() {
		//pageRefresh();
		//location.href = "shereCenterPage?page=1&searchTheme=" + $("#searchTheme").val() + "&searchArea=" + $("#searchArea").val()  + "&alignment=" + $("#category2").val();
		shereCenterUrl = "shereCenterPage?page=1&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
		$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		//$("#pagination").load(shereCenterUrl + " #pagination");
	});
	
	$("#searchArea").on("change", function() {
		//pageRefresh();
		shereCenterUrl = "shereCenterPage?page=1&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
		$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		//$("#pagination").load(shereCenterUrl + " #pagination");
	});
	
});
</script>


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
				<div class="d-flex flex-row" style="margin: 10px;">
					
				</div>
				<hr style="margin: 0px;">
				<div class="d-flex flex-row justify-content-end"  style="margin: 10px 0px;">
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 10px 0px 0px;">
						분류
					</div>
					<div class="col-lg-1 col-md-1" style="padding: 0px 0px;">
						<select class="form-control" id="searchTheme">
							<option value="allTheme" <c:if test="${searchTheme eq 'allTheme'}"> selected </c:if>>전체</option>
							<option value="개" <c:if test="${searchTheme eq '개'}"> selected </c:if>>개</option>
							<option value="고양이" <c:if test="${searchTheme eq '고양이'}"> selected </c:if>>고양이</option>
							<option value="기타축종" <c:if test="${searchTheme eq '기타축종'}"> selected </c:if>>기타</option>
						</select>
					</div>
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 10px 0px 0px;">
						지역
					</div>
					<div class="col-lg-1 col-md-1" style="padding: 0px 0px;">
						<select class="form-control" id="searchArea" name="searchArea">
							<option value="allArea" <c:if test="${searchArea eq 'allArea'}"> selected </c:if>>전체</option>
							<c:forEach var="areaList" items="${areaList}">
								<c:choose>
									<c:when test="${areaList.notice_no ne null}">
										<option value="${areaList.notice_no}" <c:if test="${searchArea eq areaList.notice_no}"> selected </c:if>>${areaList.notice_no}</option>
									</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 10px 0px 0px;">
						보기
					</div>
					<div class="col-lg-1 col-md-1" align="right" style="padding: 0px 0px;">
						<select class="form-control" id="category2">
							<option value="alignmentDay" <c:if test="${alignment eq 'alignmentDay'}"> selected </c:if>>최신순</option>
							<option value="alignmentHit" <c:if test="${alignment eq 'alignmentHit'}"> selected </c:if>>조회순</option>
							<option value="alignmentGood" <c:if test="${alignment eq 'alignmentGood'}"> selected </c:if>>좋아요순</option>
						</select>
					</div>
				</div>
				<div id="slistDiv">
					<div class="row" >
						<c:if test="${sTotolCount ne 0}">
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
													<img src='<c:url value="${slist.popfile}"/>' alt="" width="200" height="200" onclick="location.href='shereCenterReadPage?desertion_no=${slist.desertion_no}'" >
												</c:otherwise>
											</c:choose>
										</div>
										<div class="tour-one__content" style="padding: 10px; ">
												<div class="row" >
													<div class="col-lg-12" align="center">
														<font size="2px;"><c:out value="${slist.kind_cd}" /></font>
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
													</div>
												</div>
												<div class="row">
													<div class="col-lg-5">
														<font size="1px;" >
															💕 <c:out value="${slist.good}" />&nbsp;
															<i class="far fa-eye"></i> <c:out value="${slist.hit}"/>
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
						</c:if>
						<c:if test="${sTotolCount eq 0}">
							<div align="center" class="col-lg-12" style="margin:  25% 0;">등록된 유기동물 정보가 없습니다</div>
						</c:if>
					</div>
					<c:if test="${Paging.totalCount > 12}">
						<div class="post-pagination" id="pagination">
							<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
							<c:choose>
								<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
									<a class="disabledLink" href="shereCenterPage?page=${Paging.prevPageNo}"><i class="fa fa-angle-left"></i></a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="shereCenterPage?page=${Paging.prevPageNo}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}"><i class="fa fa-angle-left"></i></a>
								</c:otherwise>
							</c:choose>
							<!-- 페이지 갯수만큼 버튼 생성 -->
							<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
								<c:choose>
									<c:when test="${i eq Paging.pageNo }">
										<a class="active disabledLink" href="shereCenterPage?page=${i}"><c:out value="${i }"/></a>
									</c:when>
									<c:otherwise>
										<a href="shereCenterPage?page=${i}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}"><c:out value="${i }"/></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
							<c:choose>
								<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
									<a class="disabledLink" href="#"><i class="fa fa-angle-right"></i></a>
								</c:when>
								<c:otherwise>
									<a href="shereCenterPage?page=${Paging.nextPageNo}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}"><i class="fa fa-angle-right"></i></a>
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
				</div>
			</div>
		</section>
		

		<br>
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>