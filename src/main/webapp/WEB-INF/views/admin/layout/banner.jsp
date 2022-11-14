<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<li>
		<hr class="sidebar-divider my-0">
	</li>
	<li class="nav-item active">
		<a class="nav-link" href="/admin/main">
			<i class="fas fa-fw fa-tachometer-alt"></i>
			<span>Home</span>
		</a>
	</li>
	<li>
		<hr class="sidebar-divider">
		<div class="sidebar-heading">동물관련 관리</div>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="/admin/shereCenter">
			<i class="fas fa-fw fa-table"></i>
			<span>분양센터</span>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="packageproduct">
			<i class="fas fa-fw fa-table"></i>
			<span>실종동물</span>
		</a>
	</li>
	<li>
		<hr class="sidebar-divider">
		<div class="sidebar-heading">회원 관리</div>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="/admin/member">
			<i class="fas fa-fw fa-table"></i>
			<span>회원 목록</span>
		</a>
		<a class="nav-link" href="/admin/member_pet">
			<i class="fas fa-fw fa-table"></i>
			<span>회원 펫 목록</span>
		</a>
	</li>
	<li>
		<hr class="sidebar-divider">
		<div class="sidebar-heading">커뮤니티 관리</div>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="/admin/community/dictionary">
			<i class="fas fa-fw fa-table"></i>
			<span>지식백과</span>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="/admin/community/daily">
			<i class="fas fa-fw fa-table"></i>
			<span>일상 공유</span>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="/admin/community/info">
			<i class="fas fa-fw fa-table"></i>
			<span>정보 공유</span>
		</a>
	</li>
	<li>
		<hr class="sidebar-divider">
		<div class="sidebar-heading">고객센터</div>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="inquiry">
			<i class="fas fa-fw fa-table"></i>
			<span>1:1 문의</span>
		</a>
	</li>
</ul>