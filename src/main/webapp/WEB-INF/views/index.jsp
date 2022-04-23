<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<%
	//현재시간 구해서 String으로 formating
	LocalDateTime nowTime = LocalDateTime.now();
	
	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	DateTimeFormatter dateTimeFormatter2 = DateTimeFormatter.ofPattern("yyyy-MM");
	String now = nowTime.format(dateTimeFormatter);
	String beginMonth = nowTime.format(dateTimeFormatter2);
%>
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
		<jsp:include page="layout/header.jsp"/>
		
		<!-- 유튜브 영상 -->
		<div class="container-flue">
			<iframe width="100%" height="700px" src="https://www.youtube.com/embed/pvjr0h2-HnE?autoplay=1&mute=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		
		<!-- 분양홍보 문구 -->
		<section class="features-one__title">
			<div class="container">
				<div class="block-title text-center">
					<p>가족이 되어주세요!</p>
					<h3>
						반려동물 사지마세요, <br> 입양 하세요!
					</h3>
				</div>
			</div>
		</section>
	
		<!-- 분양홍보 문구 이유 -->
		<section class="features-one__content">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="000ms">
						<div class="features-one__single">
							<i class=" tripo-icon-tour-guide"></i>
							<h6>
								한 해 버려지는 <br>유기동물 서울만 8900마리
							</h6>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="100ms">
						<div class="features-one__single">
							<i class=" tripo-icon-reliability"></i>
							<h6>
								구매를 한다면 자신도 모르는 사이 <br>번식농장을 지지하게 됩니다
							</h6>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="200ms">
						<div class="features-one__single">
							<i class=" tripo-icon-user-experience"></i>
							<h6>
								주변 지역이나 <br>관심 지역에서 찾아보세요!
							</h6>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-duration="1500ms" data-wow-delay="300ms">
						<div class="features-one__single">
							<i class=" tripo-icon-feedback"></i>
							<h6>
								친구들에 대한<br>작은 관심으로 시작해보세요!
							</h6>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<!-- 관심 많이 받은 유기동물-->
		<section class="tour-one">
			<div class="container">
				<div class="block-title text-center">
					<p>이번 달 가장 많은 </p>
					<h3>관심을 받은 친구</h3>
				</div>
				<!-- /.block-title -->
				<div class="row">
				</div>
			</div>
			
		</section>
	
		<!-- 분양후기 -->
		<section class="testimonials-one">
			<div class="container">
				<div class="block-title text-center">
					<p>함께 해요</p>
					<h3>소중한 분양 후기</h3>
				</div>
			</div>
		</section>
	
		<!-- 실종 동물 -->
		<section class="blog-one">
			<div class="container">
				<div class="block-title text-center">
					<p>하나 밖에 없는</p>
					<h3>실종동물을 찾고 있어요</h3>
				</div>
				<div class="row">
				</div>
			</div>
		</section>
		
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>