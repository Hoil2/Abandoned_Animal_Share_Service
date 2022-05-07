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
<link rel="apple-touch-icon" sizes="180x180" href='<c:url value="/resources/favicons/apple-touch-icon.png"/>'>
<link rel="icon" type="image/png" sizes="32x32" href='<c:url value="/resources/images/favicons/favicon-32x32.png"/>'>
<link rel="icon" type="image/png" sizes="16x16" href='<c:url value="/resources/images/favicons/favicon-16x16.png"/>'>
<link rel="manifest" href='<c:url value="/resources/images/favicons/site.webmanifest"/>'>
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
		
		
		<section class="tour-one tour-grid">
			<div class="container">
		test
				<c:forEach var="data" items="${data}">
					<div class="col-lg-3 col-md-6">
						<div class="tour-one__single">
							<div class="tour-one__image">
								<c:choose>
									<c:when test="${data.filename eq null}">
										<a href="#">
											<img src='<c:url value="/resources/images/noImage.png"/>' width="200" height="200">
										</a>
									</c:when>
									<c:otherwise>
										<img src='<c:url value="${data.filename}"/>' alt="" width="200" height="200" onclick="location.href='main'" >
									</c:otherwise>
								</c:choose>
							</div>
							<div class="tour-one__content">
								<h3 style="font-size: 19px;">
									<c:out value="${data.desertionNo}" />
								</h3>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
		
		
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>