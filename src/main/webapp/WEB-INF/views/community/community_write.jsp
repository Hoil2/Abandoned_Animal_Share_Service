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

<title>정보 공유 게시판</title>

<style type="text/css">
.preloader {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #301e4e;
}
</style>
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
</head>
<body link="red">
	

	<%-- Preloader --%>
	<div class="preloader">
		<img src='<c:url value="/resources/images/loader3.png"/>' class="preloader__image" alt="">
	</div>
	
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<form action="/submitPost" method="post" enctype="multipart/form-data">
		  	<div class="form-group row">
			    <label for="title" class="col-sm-2 col-form-label">제목 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" name ="title">
			    </div>
		  	</div>
		  	
		  	
		  	<c:if test="${classify == 2}">
			  	<div class="form-group row">
			  		<label class="col-sm-2 col-form-label">반려동물 이미지 업로드 </label>
			  		<div class="col-sm-10">
			        	<input class="form-control" type="file" name="file" onchange="chk_file_type(this)" accept="image/*"/>
			  		</div>
			  	</div>
		  	</c:if>
		  	<textarea class="form-control" name="content" rows="20"></textarea>
		  	
		  	<input type="hidden" name="classify" value="${classify}">
		  	
		  	<hr>
		  	
		  	<div class="d-flex justify-content-end">
		  		<button type="submit" class="px-3 btn btn-dark mb-2">작성완료</button>
		  	</div>
		</form>
	</div>
	<%-- main 끝 --%>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	
	
</body>
</html>