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
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
		
		<section class="blog-list">
			<div class="container">
				<div class="blog-details__image" align="center">
					<c:if test="${scrReadPage.popfile ne null}">
						<img src="${scrReadPage.popfile}" alt="" class="img-fluid" align="center">
					</c:if>
				</div>
				<div class="blog-details__content">
					<ul class="list-unstyled blog-one__meta">
						<li><a href="#"><i class="far fa-user-circle"></i></a></li>
						<li><a href="#"><i class="far fa-eye"></i> ${scrReadPage.hit }</a></li>
						<li><a href="#"><i class="far fa-comments"></i> ${replyCount } Comments</a></li>
						<li><a href="#"><i class="far fa-clock"></i> ${content.redate }</a></li>
					</ul>
					<h3>${content.title}</h3>
					<br>
					<p><c:out escapeXml="false" value="${fn:replace(content.content, crlf, '<br>')}"/></p>
				</div>
				<br>
				
			</div>
		</section>	
			
			
		<br>
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>