<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍멍냥냥 관리자</title>
</head>
<body id="page-top">
    <div id="wrapper">
		<div class="container-fluid">
		<jsp:include page="../layout/header.jsp"/>
			<div align="center">
				<h1 class="h3 mb-0 text-gray-800">실종동물 상세페이지</h1>
			</div>
			<section class="blog-list" style="padding: 0px 0px;">
				<div align="right"><i class="far fa-clock"></i> ${lcbReadPage.reg_date}</div><hr>
				<div align="center" >
					<c:if test="${lcbReadPage.img_path ne null}">
						<img src="${lcbReadPage.img_path}" alt="" class="img-fluid" align="center">
					</c:if>
				</div>
				<div class="blog-details__content" style="border: 0px;">
					<div class="row">
						<div class="col-md-6">
							<table class="table">
							
								<thead>
									<tr class="success">
										<th>동물 정보</th>
										<th></th>
									</tr>
								</thead>
								<tbody >
									<tr >
										<td><font size="3px;">이름 </font></td>
										<td> ${lcbReadPage.pet_name}
											<c:choose>
												<c:when test="${lcbReadPage.sex_cd eq 'M'}"> 
													<font size="3px;" color="Blue">♂</font>
												</c:when>
												<c:when test="${lcbReadPage.sex_cd eq 'F'}"> 
													<font size="3px;" color="#FF7171;">♀</font>
												</c:when>
												<c:otherwise> 
													<font size="1px;">(미상)</font>
												 </c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td><font size="3px;">나이 </font></td>
										<td> ${lcbReadPage.age}</td>
									</tr>
									<tr>
										<td><font size="3px;">품종</font></td>
										<td>${lcbReadPage.kind_cd}</td>
									</tr>
									<tr>
										<td><font size="3px;">색상</font></td>
										<td>${lcbReadPage.color_cd}</td>
									</tr>
									<tr>
										<td><font size="3px;">특징</font></td>
										<td><font size="2px;">${lcbReadPage.content}</font></td>
									</tr>
								</tbody> 
							</table><br>
						</div>
						<div class="col-md-6">
							<table class="table">
								<thead>
									<tr class="success">
										<th>기타정보</th>
										<th></th>
									</tr>
								</thead>
								<tbody >
									<tr >
										<td><font size="3px;">작성자 </font></td>
										<td>${lcbReadPage.name}</td>
									</tr>
									<tr>
										<td> <font size="3px;"> 이메일</font></td>
										<td>${lcbReadPage.email}</td>
									</tr>
									<tr>
										<td><font size="3px;">연락처</font></td>
										<td>${lcbReadPage.phone}</td>
									</tr>
									<tr>
										<td><font size="3px;">분실일</font></td>
										<td><font size="2px;">${lcbReadPage.lost_date}</font></td>
									</tr>
									<tr>
										<td><font size="3px;">분실장소</font></td>
										<td><font size="2px;">${lcbReadPage.lost_place}</font></td>
									</tr>
								</tbody> 
							</table><br>
						</div>
						<div class="col-md-12" align="right">
							<button class="btn btn-primary"   onClick="location.href='modifyLostAnimalBoardPage?alb_id=${lcbReadPage.alb_id}'">수정</button>
						</div>
						<br>
					</div>
				</div>
				<br>
					
			</section>	
			<hr>
			<jsp:include page="../layout/footer.jsp"/>
		</div>
			
		
	</div>
	
	
</body>
</html>