<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍멍냥냥 관리자</title>
<script type="text/javascript">
	function chk_file_type(obj) {
		if(obj.value == '') return false;
		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind+1,obj.length);
		var file_type = file_name.toLowerCase();
	
	 	if(!(file_type=='jpg' || file_type=='gif' || file_type=='jpeg' || file_type=='png' || file_type=='bmp')){
		  	alert('이미지 파일만 선택할 수 있습니다.');
		  	var parent_Obj=obj.parentNode;
		  	var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
	  		return false;
 		}
	}
</script>
<link href='<c:url value="/resources/css/sb-admin-2.min.css"/>' rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<link href='<c:url value="/resources/css/sb-admin-2.min.css"/>' rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<div class="container-fluid">
			<hr>
			<div align="center">
				<h1 class="h3 mb-0 text-gray-800">실종동물 수정페이지</h1>
			</div>
			<section class="blog-list" style="padding: 0px 0px;">
				<div class="container">
					<hr>
					<form id="form" role="form" method="POST" name="add" enctype="multipart/form-data">
						<input type="hidden" name="img_path" id="img_path" value="${lcbReadPage.img_path}">
						<div align="center" >
							현재 게시글 이미지<br>
							<c:if test="${lcbReadPage.img_path ne null}">
								<img src="${lcbReadPage.img_path}" alt="" class="img-fluid" align="center">
							</c:if>
						</div>
						<!-- 사진 -->
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">반려동물 이미지</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" name="file" id="file" onchange="chk_file_type(this)" accept="image/*" required/>
							</div>
						</div>
						
						<input type="hidden" name="alb_id" id="alb_id" value="${lcbReadPage.alb_id}">
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
											<td><font size="3px;">나이</font></td>
											<td> <font size="2px;"><input type="text" id="age" name="age" value="${ lcbReadPage.age}" class="form-control"></font></td>
										</tr>
										<tr>
											<td><font size="3px;">품종</font></td>
											<td><font size="2px;"><input type="text" id="kind_cd" name="kind_cd" value="${ lcbReadPage.kind_cd}" class="form-control"></font></td>
										</tr>
										<tr>
											<td><font size="3px;">색상</font></td>
											<td><font size="2px;"><input type="text" id="color_cd" name="color_cd" value="${ lcbReadPage.color_cd}" class="form-control"></font></td>
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
						</div>
						특징
						<div class="form-group">
							<div class="input-group my-2 mb-1">
								<textarea name="content" id="content" cols="100" style="height:300px; width: 100%;" class="form-control">${lcbReadPage.content}</textarea>
							</div>
						</div>
						<!-- 이전, 수정 버튼 -->
						<div align="right">
							<input class="btn btn-primary" type="button" id="btnAdminModify" value="확인">
							<input class="btn btn-outline-primary" id="list_btn"  onclick="window.close()" value="취소" style="width:60px;">	
						</div>
					</form>
					<br>
					
				</div>
			</section>	
			<hr>
			<jsp:include page="../layout/footer.jsp"/>
		</div>
			
		
	</div>
	
<script type="text/javascript">

$('#btnAdminModify').click(function() {
	var form = $("#form")[0];
	var formData = new FormData(form);
	
	$.ajax({
		cache : false,
		url : "modifyLostAnimalBoard", 
		processData: false,
		contentType: false,
		type : 'POST', 
		data : formData, 
		success : function(data = 1) {
			opener.location.reload();
			window.close();
			
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
	
})
</script>
	
</body>
</html>