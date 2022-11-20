<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 정보</title>
</head>
<body id="page-top">
    <div id="wrapper">
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- 상단 헤더 부분 -->
				<jsp:include page="../layout/header.jsp"/>
				<!-- 상단 헤더 부분 -->
				
				<!-- 본문 -->
				<div class="container-fluid ">
					<div class="row d-flex justify-content-center">
						<h1 class="h3 text-gray-800">펫 정보</h1>
					</div>
					<div class="row d-flex justify-content-center">
						<table class="table" style="width:400px">
							<thead>
								<tr class="success">
									<th>동물 정보</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><font size="3px;">이름 </font></td>
									<td>${memberPet.name}
										<c:choose>
											<c:when test="${memberPet.sex eq 'M'}"> 
												<font size="3px;" color="Blue">♂</font>
											</c:when>
											<c:when test="${memberPet.sex eq 'F'}"> 
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
									<td> ${memberPet.age}</td>
								</tr>
								<tr>
									<td><font size="3px;">종류</font></td>
									<td>${memberPet.kind}</td>
								</tr>
								<tr>
									<td><font size="3px;">품종</font></td>
									<td>${memberPet.breed}</td>
								</tr>
							</tbody> 
						</table>
					</div>
				</div>
			</div>
			<!-- 본문 -->
		</div>
	</div>
    
    <script>
    
    </script>
</body>
</html>