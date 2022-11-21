<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<a href="/main" class="main-nav__logo">
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
								<ul>
									<li><a href="/shareCenterPage_searchAniamlInRegion" id="twayFont">지역 검색</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="/communityLostBoard" id="twayFont">실종동물</a>
							</li>
							<li class="dropdown"><a href="/community/dictionary" id="twayFont">지식백과</a>
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
											<!-- <li><a href="/support" id="twayFont">고객센터</a></li> -->
										</ul>
									</c:when>
									<c:when test="${member ne null }">
										<a href="#" class="main-nav__login"><i class="tripo-icon-avatar"></i></a>
										<ul>
											<li><a href="/signOut" id="twayFont">로그아웃</a></li>
											<li><a href="/mypage" id="twayFont">마이페이지</a></li>
											<c:if test="${member.getGrade() eq 'Admin' }">
												<li><a href="/admin/main" id="twayFont">관리자페이지</a></li>
											</c:if>
											<!-- <li><a href="/support" id="twayFont">고객센터</a></li> -->
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
	
	<jsp:include page="signIn.jsp"/>
	<jsp:include page="signUp.jsp"/>