<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<jsp:include page="../layout/libraries.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<title>멍멍냥냥</title>
</head>
<body link="red">
	<!-- 페이지 로딩 이미지 -->
	<%-- Preloader --%>
	<div class="preloader">
		<img src='<c:url value="/resources/images/loader3.png"/>' class="preloader__image" alt="">
	</div>
	
	<!-- 메인 영역 -->
	<div class="page-wrapper">
		<jsp:include page="../layout/header.jsp"/>
		<section class="page-header" style="background-image: url(<c:url value="/resources/images/banner_main/${BannerRespectivelyView.getS_file_name()}"/>);">
			<div class="container">
				<h2>실종동물</h2>
				<ul class="thm-breadcrumb list-unstyled">
				</ul>
			</div>
		</section><br>
		
		<section class="blog-list" style="padding: 0px 0px;">
			<div class="container">
				<div class="d-flex flex-row-reverse" id="heartDiv">
					<ul class="list-unstyled blog-one__meta">
						<li> <a href="javascript:window.history.back();"> 목록</a></li>
					</ul>
				</div><hr>
				<form role="form" method="POST" id="myform" name="myform" enctype="multipart/form-data">
					<!-- 사진 -->
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">반려동물 이미지</label>
						<div class="col-sm-10">
							<input class="form-control" type="file" name="file" id="file" onchange="chk_file_type(this)" accept="image/*" required/>
						</div>
					</div>
					
					<input type="hidden" name="m_id" id="m_id" value="${sessionScope.member.getM_id()}">
					신고자 정보
					<div class="form-group row">
						<div class="col-xs-4 col-md-4">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>작성자</b></span>
								</div>
								<input type="text" class="form-control" value="${sessionScope.member.getName()}">
							</div>
						</div>
						<div class="col-xs-4 col-md-4">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>이메일</b></span>
								</div>
								<input type="text" class="form-control" value="${sessionScope.member.getEmail()}">
							</div>
						</div>
						<div class="col-xs-4 col-md-4">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>연락처</b></span>
								</div>
								<input type="text" class="form-control" value="${sessionScope.member.getPhone()}">
							</div>
						</div>
					</div>
					<!--기간, 등록일  -->
					실종동물 정보
					<div class="form-group row">
						<div class="col-xs-4 col-md-4">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>이름</b></span>
								</div>
								<input type="text" class="form-control" id="pet_name" name="pet_name" required>
							</div>
						</div>
						<div class="col-xs-4 col-md-4">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>나이</b></span>
								</div>
								<input type="text" class="form-control" id="age" name="age" required>
							</div>
						</div>
						<div class="col-xs-4 col-md-4">
								<div class="input-group my-2 mb-1">
									<div class="input-group-prepend">
										<span class="input-group-text"><b>성별</b></span>
									</div>
									<select class="form-control" id="sex_cd" name="sex_cd">
										<option selected="selected" value="">선택해주세요</option>
										<option value="M">수컷</option>
										<option value="F">암컷</option>
									</select>
								</div>
							</div>	
					</div>
					<div class="form-group row">
						<div class="col-xs-6 col-md-6">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>품종</b></span>
								</div>
								<input type="text" class="form-control" id="kind_cd" name="kind_cd" required>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>색상</b></span>
								</div>
								<input type="text" class="form-control" id="color_cd" name="color_cd" required>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-xs-6 col-md-6">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>분실일</b></span>
								</div>
								<input type="date" class="form-control" id="lost_date" name="lost_date" required>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text"><b>분실장소</b></span>
								</div>
								<input type="text" class="form-control" id="lost_place" name="lost_place" required>
							</div>
						</div>
					</div>
					<hr >
					특징
					<div class="form-group">
						<div class="input-group my-2 mb-1">
							<textarea name="content" id="content" cols="100" style="height:300px; width: 100%;"></textarea>
						</div>
					</div>
					<hr >
					<!-- 이전, 수정 버튼 -->
					<div align="right">
						<input class="btn btn-outline-warning" type="button" id="dowriteLostAnimalBoard" value="등록">
						<input class="btn btn-outline-warning" id="list_btn"  onclick="history.back()" value="취소" style="width:60px;">		
					</div>
				</form>
				<br>
				
			</div>
		</section>	
		
	</div>
	<br>
	<jsp:include page="../layout/footer.jsp"/>
<script type="text/javascript">

function chk_file_type(obj) {
	if(obj.value == '') return false;
	var file_kind = obj.value.lastIndexOf('.');
	var file_name = obj.value.substring(file_kind+1,obj.length);
	var file_type = file_name.toLowerCase();

	if(!(file_type=='jpg' || file_type=='gif' || file_type=='jpeg' || file_type=='png' || file_type=='bmp')){
		alert('이미지 파일만 선택할 수 있습니다.');
		document.getElementById("file").value ='';
		//var parent_Obj=obj.parentNode;
		//var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
		return false;
	}
}
$('#dowriteLostAnimalBoard').click(function() {
	var pet_name = $("#pet_name").val();
	var age = $("#age").val();
	var sex_cd = $("#sex_cd").val();
	var kind_cd = $("#kind_cd").val();
	var color_cd = $("#color_cd").val();
	var lost_date = $("#lost_date").val();
	var lost_place = $("#lost_place").val();
	var content = $("#content").val();
	var file = $("#file").val();
	
	if (file =='') {
		swal({
			title: "실종동물",
			text: "파일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!pet_name) {
		swal({
			title: "실종동물",
			text: "실종동물 이름이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!age) {
		swal({
			title: "실종동물",
			text: "나이가 입력 되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(sex_cd =='') {
		swal({
			title: "실종동물",
			text: "성별이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!kind_cd) {
		swal({
			title: "실종동물",
			text: "품종이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!color_cd) {
		swal({
			title: "실종동물",
			text: "색상이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!lost_date) {
		swal({
			title: "실종동물",
			text: "분실일 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!lost_place) {
		swal({
			title: "실종동물",
			text: "분실장소 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!content) {
		swal({
			title: "실종동물",
			text: "특징이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		var form = $("#myform")[0];
		var formData = new FormData(form);
		
		$.ajax({
			cache : false,
			url : "dowriteLostAnimalBoard", 
			processData: false,
			contentType: false,
			type : 'POST', 
			data : formData, 
			success : function(data = 1) {
				//location.reload();
				window.location.href = 'communityLostBoard';
			},
			error : function(xhr, status) {
				alert(xhr + " : " + status);
			}
		});
	}
})
</script>
</body>
</html>