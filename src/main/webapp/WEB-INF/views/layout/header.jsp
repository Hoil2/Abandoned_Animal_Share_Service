<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Plugin Script -->
	<link href="https://fonts.googleapis.com/css?family=Barlow+Condensed:200,300,400,400i,500,600,700,800,900%7CSatisfy&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href='<c:url value="/resources/css/animate.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/owl.carousel.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/owl.theme.default.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/magnific-popup.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/fontawesome-all.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/swiper.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/tripo-icons.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/jquery.mCustomScrollbar.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-datepicker.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/vegas.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/nouislider.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/nouislider.pips.css"/>'>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- End of Tocplus -->
	
	<!-- Template Styles -->
	<link rel="stylesheet" href='<c:url value="/resources/css/style.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/responsive.css"/>'><link rel="stylesheet">
	
	<!-- TwayAir Font -->
	<style>
		@font-face {
		    font-family: 'twayfly';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayfly.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		#twayFont{ font-family: 'twayfly'; } 
		#container{
         max-width: 2000px;
     	 }
	</style>
	
	<!-- 상단 헤더 -->
	<div class="site-header__header-one-wrap">
		<div class="topbar-one">
			<div class="container-fluid">
				<div class="topbar-one__left"></div>
				<div class="topbar-one__right">
					<div class="topbar-one__social"></div>
					<a class="topbar-one__guide-btn"></a>
				</div>
			</div>
		</div>
		<header class="main-nav__header-one ">
			<nav class="header-navigation stricky">
				<div class="container" id="container">
					<div class="main-nav__logo-box">
						<a href="main" class="main-nav__logo">
							<img src='<c:url value="/resources/images/logo6.png"/>' class="main-logo" width="100" height="auto" alt="Awesome Image" />
						</a>
						<a href="#" class="side-menu__toggler"><i class="fa fa-bars"></i></a>
					</div>
					<div class="main-nav__main-navigation">
						<ul class=" main-nav__navigation-box">
							<li class="dropdown">
								<a href="/main" id="twayFont">홈</a>
							</li>
							<li class="dropdown"><a href="/shereCenterPage" id="twayFont">분양센터</a>
							</li>
							<li class="dropdown"><a href="/fishing" id="twayFont">실종동물</a>
							</li>
							<li class="dropdown"><a href="/hotelreservation" id="twayFont">지식백과</a>
							</li>
							<li class="dropdown"><a href="/community/daily" id="twayFont">소통해요</a>
								<ul>
									<li><a href="/community/daily" id="twayFont">일상공유</a></li>
									<li><a href="/community/info" id="twayFont">정보공유</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="main-nav__right">
						<a href="#" class="main-nav__search search-popup__toggler"><i class="tripo-icon-magnifying-glass"></i></a>
						<div class="main-nav__main-navigation">
							<ul class=" main-nav__navigation-box">
								<li class="dropdown">
								<c:choose>
									<c:when test="${member eq null }">
										<a href="#" class="main-nav__login" data-toggle="modal" data-target="#loginModal"><i class="tripo-icon-avatar"></i></a>
										<ul>
											<li><a href="#" id="twayFont" data-toggle="modal" data-target="#loginModal">로그인</a></li>
											<li><a href="#" id="twayFont" data-toggle="modal" data-target="#registerModal">회원가입</a></li>
											<li><a href="support" id="twayFont">고객센터</a></li>
										</ul>
									</c:when>
									<c:when test="${member ne null }">
										<a href="#" class="main-nav__login"><i class="tripo-icon-avatar"></i></a>
										<ul>
											<li><a href="logout" id="twayFont">로그아웃</a></li>
											<li><a href="mypage" id="twayFont">마이페이지</a></li>
											<c:if test="${member.getGrade() eq 'Admin' }">
												<li><a href="admin/main" id="twayFont">관리자페이지</a></li>
											</c:if>
											<li><a href="support" id="twayFont">고객센터</a></li>
										</ul>
									</c:when>
								</c:choose>
								</li>
							</ul>
						</div>
						<img src='<c:url value="/resources/images/dogdog.png"/>' alt="" class="banner-four__sun" width="100px">
					</div>
				</div>
			</nav>
		</header>
	</div>
	<!-- 상단 헤더 -->