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
	
</head>
<body link="red">
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<div class="row mb-4" id="section">
			<h3 class="mb-2">반려동물 관리</h3>
			<div class="d-flex justify-content-end mb-2">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertMemberPet">반려동물 추가</button>
			</div>
			
			<table class="table text-center table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>이름</th>
						<th>성별</th>
						<th>나이</th>
						<th>종</th>
						<th>품종</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${memberPetList}" var="memberPet">
						<tr>
							<td>${memberPet.mp_id}</td>
							<td>${memberPet.name}</td>
							<td>${memberPet.sex}</td>
							<td>${memberPet.age}</td>
							<td>${memberPet.kind}</td>
							<td>${memberPet.breed}</td>
							<td>
								<button type="button" class="btn btn-primary me-2" data-toggle="modal" data-target="#updateMemberPet" data-whatever="${memberPet.mp_id}">수정</button>
								<button type="button" onclick="deleteMemberPet(${memberPet.mp_id})" class="btn btn-danger">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<%-- 반려동물 추가 모달 --%>
	<div class="modal fade" id="insertMemberPet" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">반려동물 추가</h5>
	        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="/mypage/insertMemberPet">
	      <div class="modal-body">
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">이름</span>
				  </div>
				  <input type="text" name="name" class="form-control" placeholder="반려동물 이름" required>
	          </div>
	          <div class="input-group mb-3">
	          	<div class="input-group-prepend">
	            	<span class="input-group-text">성별</span>
	            </div>
	            <select name="sex" class="form-select" required>
	            	<option value="F">암컷</option>
	            	<option value="M">수컷</option>
	            	<option value="Q">미상</option>
	            </select>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">생년</span>
				  </div>
				  <input type="number" name="age" class="form-control" placeholder="ex) 2022" required>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">종</span>
				  </div>
				  <input type="text" name="kind" class="form-control" placeholder="ex) 개 or 고양이 or ..." required>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">품종</span>
				  </div>
				  <input type="text" name="breed" class="form-control" placeholder="ex) 포메라니안" required>
	          </div>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="submit" class="btn btn-primary">추가하기</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<%-- 반려동물 수정 모달 --%>
	<div class="modal fade" id="updateMemberPet" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">반려동물 수정</h5>
	        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="/mypage/updateMemberPet">
	      <div class="modal-body">
	      	  <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">No</span>
				  </div>
				  <input type="text" name="mp_id" class="form-control" readOnly>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">이름</span>
				  </div>
				  <input type="text" name="name" class="form-control" placeholder="반려동물 이름" required>
	          </div>
	          <div class="input-group mb-3">
	          	<div class="input-group-prepend">
	            	<span class="input-group-text">성별</span>
	            </div>
	            <select name="sex" class="form-select" required>
	            	<option value="F">암컷</option>
	            	<option value="M">수컷</option>
	            	<option value="Q">미상</option>
	            </select>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">생년</span>
				  </div>
				  <input type="number" name="age" class="form-control" placeholder="ex) 2022" required>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">종</span>
				  </div>
				  <input type="text" name="kind" class="form-control" placeholder="ex) 개 or 고양이 or ..." required>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">품종</span>
				  </div>
				  <input type="text" name="breed" class="form-control" placeholder="ex) 포메라니안" required>
	          </div>
	          <div class="input-group mb-3">
	          	 <div class="input-group-prepend">
	          		<span class="input-group-text">등록일</span>
				  </div>
				  <input type="text" name="reg_date" class="form-control" readOnly>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="submit" class="btn btn-primary">수정하기</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
		// 수정 모달이 열릴 때 반려동물 정보 불어와서 넣기
		$('#updateMemberPet').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget);
		  var mp_id = button.data('whatever'); 
		  var modal = $(this);
		  
		  $.ajax({
			  url: '/mypage/updateMemberPet/getMemberPet',
			  type: 'post',
			  data: {
				  mp_id: mp_id
			  },
		  	  success: function(memberPet) {
		  		  modal.find('[name="mp_id"]').val(memberPet.mp_id);
		  		  modal.find('[name="name"]').val(memberPet.name);
		  		  modal.find('[name="sex"]').val(memberPet.sex);
	  			  modal.find('[name="age"]').val(memberPet.age);
			  	  modal.find('[name="kind"]').val(memberPet.kind);
		  		  modal.find('[name="breed"]').val(memberPet.breed);
		  		  modal.find('[name="reg_date"]').val(memberPet.reg_date);
		  	  },
		  	  error: function() {
		  		  alert("반려동물의 정보 로드를 실패했습니다.");
		  	  }
		  });
		});
		
		// 반려동물 삭제
		function deleteMemberPet(mp_id) {
			if(confirm("정말 No." + mp_id + " 반려동물 정보를 삭제하시겠습니까?")) {
				$.ajax({
					url: '/mypage/deleteMemberPet',
					type: 'post',
				    data: {
				  		mp_id: mp_id
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