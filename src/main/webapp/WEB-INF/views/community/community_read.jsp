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

<title>${pageDetail.title}</title>

<style type="text/css">
.preloader {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #301e4e;
}
</style>
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
	  	<div class="pt-5 pb-1">
		    <p class="fs-2 fw-bold">${pageDetail.title}</p>
		    <span class="fs-4 pr-3">${pageDetail.name}</span>
		    <span class="fs-4">조회수 ${pageDetail.hit}</span>
		    
		</div>
		<hr>
	    <div class="pt-3 pb-3">
    		<c:if test="${pageDetail.img_path != null}">
				<img style="max-width:800px;" src="<c:url value='${pageDetail.img_path}'/>"/>	    		
    		</c:if>
		    <textarea readonly class="fs-5 form-control" style="overflow:hidden; resize:none;">${pageDetail.content}</textarea>
	    </div>
	</div>
	<%-- main 끝 --%>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
		$(function() {
		    $('textarea').each(function() {
		        $(this).height($(this).prop('scrollHeight'));
		    });
		});
	</script>
</body>
</html>