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
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<jsp:include page="../layout/libraries.jsp"/>
	<%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> --%>
	<%-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> --%>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	  
	<title>게시물 작성</title>
	
	<style type="text/css">
		@font-face {
		    font-family: 'twayfly';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayfly.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		#twayFont{ font-family: 'twayfly'; } 
		#container{
	        max-width: 2000px;
	    	 }
	    	 
		.preloader {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  min-height: 100vh;
		  background: #301e4e;
		}
		a {
			text-decoration: none;
		}
	</style>
</head>
<body link="red">
	<%-- header 영역 --%>
	<jsp:include page="../layout/header.jsp"/>
		
	<%-- main 영역 --%>
	<div class="container">
		<form action="/savePost" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNo" value="${communityDTO.cb_id}"/>
			<input type="hidden" name="classify" value="${communityDTO.classify}"/>
		  	<div class="form-group row">
			    <label for="title" class="col-sm-2 col-form-label">제목 </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" name ="title" value="${communityDTO.title}">
			    </div>
		  	</div>
		  	
		  	
			<c:if test="${communityDTO.classify == 2}">
				<div class="form-group row">
			  		<label class="col-sm-2 col-form-label">반려동물 id</label>
			  		<div class="col-sm-10">
						<select id="desertion_no" name="desertion_no" class="form-select form-select-sm border border-dark" style="height:40px;" name="filter" aria-label=".form-select-sm example" required>
							<c:forEach var="memberPet" items="${memberPetList}">
								<option value="${memberPet.desertion_no}" <c:if test="${memberPet.desertion_no == communityDTO.desertion_no}">selected</c:if>>${memberPet.pet_name} / id : ${memberPet.desertion_no}</option>
							</c:forEach>
						</select>
					</div>
				</div>			  	
			</c:if>
			<textarea class="summernote" id="content" name="content">${communityDTO.content}</textarea>
			<hr>
			<div class="d-flex justify-content-end">
				<input type="submit" class="px-3 btn btn-dark mb-2" value="등록"/>
			</div>
		</form>
	</div>
	<%-- main 끝 --%>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	
	<script>
		var submitted = false;
		
		$(document).ready(function() {
			$('.summernote').summernote({
				placeholder: 'Hello stand alone ui',
				tabsize: 2,
				height: 300,
				toolbar: [
					['style', ['style']],
					['font', ['bold', 'underline', 'clear']],
					['color', ['color']],
					['para', ['ul', 'ol', 'paragraph']],
					['table', ['table']],
					['insert', ['link', 'picture', 'video']],
					['view', ['fullscreen', 'codeview', 'help']]
				],

				callbacks : { 
					onImageUpload : function(files, editor, welEditable) {
						// 파일 업로드(다중업로드를 위해 반복문 사용)
						for (var i = files.length - 1; i >= 0; i--) {
							uploadSummernoteImageFile(files[i], this);
						}
					}
				}
			});
		});
		
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			data.append("cb_id", ${communityDTO.cb_id})
			$.ajax({
				data : data,
				type : "POST",
				url : "/uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
		
		$(window).on("beforeunload", function() {
			console.log("글쓰기 종료");
			if(!submitted) {
				$.ajax({
					type : "POST",
					<c:if test="${update}">url : "/cancelPost",</c:if>
					<c:if test="${!update}">url : "/deletePost",</c:if>
					data : {
						pageNo : ${communityDTO.cb_id}
					}
				});
				
				return "작성중인 글이 존재합니다. 페이지를 나가시겠습니까?";
			}
		});
		
		// 등록 버튼을 눌렀을 때는 경고창 뜨지 않게 설정
		$("form").submit(function() {
			submitted = true;
		});
	</script>
</body>
</html>