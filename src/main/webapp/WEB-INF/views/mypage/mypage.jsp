<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<!-- bootstrap CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<jsp:include page="../layout/libraries.jsp"/>
	<title>마이페이지</title>
</head>
<body link="red">
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="card" style="width: 18rem;">
					<a class="stretched-link" href="mypage/manageMyPet"></a>
			 	  	<img src="<c:url value='resources/images/profile.svg'/>" class="card-img-top" alt="...">
				  	<div class="card-body">
				    	<p class="card-text text-center"><b>내 반려동물</b></p>
				  	</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<a class="stretched-link" href="mypage/memberPetEmailAlarm"></a>
			 	  	<img src="<c:url value='resources/images/loader2.png'/>" class="card-img-top" alt="...">
				  	<div class="card-body">
				    	<p class="card-text text-center"><b>일상공유 알림 설정</b></p>
				  	</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<a class="stretched-link" href="mypage/manageMyEmailAlarmCondition"></a>
			 	  	<img src="<c:url value='resources/images/loader.png'/>" class="card-img-top" alt="...">
				  	<div class="card-body">
				    	<p class="card-text text-center"><b>맞춤 조건 알림 설정</b></p>
				  	</div>
				</div>
			</div>
		</div>
	</div>
	<%-- main 끝 --%>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
		
	</script>
</body>
</html>