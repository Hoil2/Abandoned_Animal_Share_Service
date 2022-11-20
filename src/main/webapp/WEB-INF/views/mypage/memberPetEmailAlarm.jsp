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
	<title>일상공유 알람 설정 관리</title>
	
</head>
<body link="red">
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<div class="row mb-4" id="section">
			<h3 class="mb-2">일상공유 알람 설정 관리</h3>
			
			<table class="table text-center table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>펫No</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${memberPetEmailAlarmList}" var="mpea">
						<tr>
							<td>${mpea.mpea_id}</td>
							<td>${mpea.mp_id}</td>
							<td>
								<button type="button" onclick="deleteMemberPetEmailAlarm(${mpea.mpea_id})" class="btn btn-danger">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${memberPetEmailAlarmList.size() == 0}">
				<h4 class="text-center">알람설정한 펫이 없습니다.</h4>
			</c:if>
		</div>
	</div>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
		// 반려동물 삭제
		function deleteMemberPetEmailAlarm(mpea_id) {
			if(confirm("정말 No." + mpea_id + " 알람설정을 삭제하시겠습니까?")) {
				$.ajax({
					url: '/mypage/deleteMemberPetEmailAlarm',
					type: 'post',
				    data: {
				    	mpea_id: mpea_id
				    },
			  	    success: function() {
		  		  		alert("삭제가 완료되었습니다.");
		  		  		location.reload();
			  	    },
			  	    error: function() {
			  		  	alert("삭제를 실패했습니다.");
			  	    }
				});
			}
		}
	</script>
</body>
</html>