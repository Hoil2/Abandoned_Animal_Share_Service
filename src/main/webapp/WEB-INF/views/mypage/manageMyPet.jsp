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
		<c:if test="${list == null}">
		  cnt = 1;
		</c:if>
	
	
		function addSlot(property1, property2) {
			cnt = cnt + 1;
			$('#section').append("<div class='row ps-4 pb-2' id='v_" + cnt + "'><div class='col-5'><input type='text' class='form-control' name='pet_name' value='" + property1 + "' required/></div><div class='col-7'><input type='text' class='form-control' name='desertion_no' value='" + property2+ "' required/></div></div>");
		}
	
		function removeSlot() {
			if(cnt == 1) return;
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
		<form action="/mypage/updateMyPet" method="post">
			<div class="row mb-4" id="section">
				<div class="fs-4 mb-2">반려동물 관리</div>
				<div class="row ps-4 pb-2">
					<div class="col-5 d-flex align-items-center">
						<label>별칭</label>
					</div>
					<div class="col-5 d-flex align-items-center">
						<label>반려동물 ID</label>
					</div>
					<div class="col-1 fs-2">
						<a href="javascript:;" onclick="addSlot('', '')"><i class="bi bi-plus-circle"></i></a>
					</div>
					<div class="col-1 fs-2">
						<a href="javascript:;" onclick="removeSlot()"><i class="bi bi-dash-circle"></i></a>
					</div>
				</div>
				
				<c:if test="${memberPetList == null}">
					<div class="row ps-4 pb-2">
						<div class="col-5">
							<input type="text" class="form-control" name="desertion_no" required/>
						</div>
						<div class="col-7">
						 	<input type="text" class="form-control" name="pet_name" required/>
						 </div>
					</div>
				</c:if>
				
				<c:if test="${memberPetList != null}">
					<script>
						<c:forEach var="memberPet" items="${memberPetList}">
								addSlot('${memberPet.pet_name}', '${memberPet.desertion_no}');
						</c:forEach>
					</script>
				</c:if>
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