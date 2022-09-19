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
	<title>반려동물 관리</title>
	
	<script>
		var cnt = 0;	
	
		function addSlot(desertion_no) {
			cnt = cnt + 1;
			$('#section').append("<div class='row ps-4 pb-2' id='v_" + cnt + "'><div class='col-4'><input type='text' class='form-control' name='desertion_no' value='" + desertion_no+ "' required/></div></div>");
		}
	
		function removeSlot() {
			if(cnt == 0) return;
			$('#v_'+cnt).remove();
			cnt = cnt - 1;
		}
	</script>
</head>
<body link="red">
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<form action="/mypage/updateMyConditionAlarm" method="post">
			<p class="fs-5">동물 종류</p>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				<label class="form-check-label" for="flexCheckDefault">
					강아지
				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				<label class="form-check-label" for="flexCheckDefault">
					고양이
				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				<label class="form-check-label" for="flexCheckDefault">
					기타
				</label>
			</div>
			
			
			<div class="row mb-3 d-flex flex-row-reverse" style="padding-right:2.5rem">
    			<button type="submit" class="col-sm-2 btn btn-dark">저장</button>
    		</div>
		</form>
	</div>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
		
	</script>
</body>
</html>