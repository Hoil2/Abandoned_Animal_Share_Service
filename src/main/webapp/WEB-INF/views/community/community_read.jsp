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
<jsp:include page="../layout/libraries.jsp"/>
<!-- bootstrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>${pageDetail.title}</title>

<style type="text/css">
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
	
	.collapsing {
		transition: 0s;
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
		<%-- 게시물 제목 부분 --%>
	  	<div class="pt-5 pb-1">
		    <p class="fs-2 fw-bold">${pageDetail.title}</p>
		    <span class="fs-4 pr-3">${memberService.getNameByM_id(pageDetail.m_id)}</span>
		    <span class="fs-4">조회수 ${pageDetail.hit}</span>
		    
		    <%-- 일상 게시판일 때만 좋아요 --%>
		    <c:if test="${pageDetail.classify == 2 && member.m_id != pageDetail.m_id}">
			    <div class="float-right">
			    	<%-- 좋아요 --%>
				    <span class="fs-4">
				    	<c:if test="${member != null}">
				    		<i onclick="clickHeart(this)" class="bi bi-heart" id="like"></i>
				    	</c:if>
				    	<c:if test="${member == null}">
				    		<i class="bi bi-heart"></i>
				    	</c:if>
			    	</span>
				    <span class="fs-4 mr-3" id="likeCnt">${likeCnt}</span>
				    
				    <%-- 알람 --%>
				    <c:if test="${member != null}">
				    	<span class="fs-4">
		    				<i onclick="clickAlarm(this)" class="bi bi-exclamation-circle" id="alarm"></i>
		    			</span>
		    		</c:if>
			    </div>
		    </c:if>
		    
		    <%-- 글 수정 | 삭제 --%>
		    <c:if test="${member.m_id == pageDetail.m_id}">
		    	<div class="float-right">
		    		<span><a href="/updatePost?pageNo=${pageDetail.cb_id}">수정</a> | <a href="javascript:;" onclick="deletePost()">삭제</a></span>
		    	</div>
		    </c:if>
		</div>
		<hr>
		<%-- 게시물 내용 부분 --%>
	    <div class="pt-3 pb-3">
	    	<c:out value="${pageDetail.content}" escapeXml="false"/>
    		<%-- <c:if test="${pageDetail.img_path != null}">
				<img style="max-width:800px;" src="<c:url value='${pageDetail.img_path}'/>"/>	    		
    		</c:if>
    		<div class="row">
		    	<textarea readonly class="fs-5 autoExtend" style="overflow:hidden; resize:none; border-style: none; outline: none;">${pageDetail.content}</textarea>
		    </div> --%>
	    </div>
	    <hr>
	    
	    <%-- 댓글 출력 --%>
	    <div id="commentOutput">
		    <c:forEach var="list" items="${clist}" varStatus="status">
		    	<div class="px-3 pt-3">
		    		<span class="fw-bold">${list.name}</span> <span>(${list.reg_date})</span>
		    		<%-- 수정 | 삭제 --%>
		    		<c:if test="${member.m_id == list.m_id}">
			    		<div class="float-right">
			    			<div class="collapse show" id="edit${list.cbr_id}">
					    		<span><a data-toggle="collapse" href="#edit${list.cbr_id}" role="button" aria-expanded="false" aria-controls="edit${list.cbr_id}">수정</a></span>
					    		<span>| <a href="javascript:;" onclick="deleteComment(${list.cbr_id})">삭제</a></span>
				    		</div>
				    		<span class="collapse" id="edit${list.cbr_id}"><a onclick="cancelEdit()" data-toggle="collapse" href="#edit${list.cbr_id}" role="button" aria-expanded="false" aria-controls="edit${list.cbr_id}">닫기</a></span>
			    		</div>
		    		</c:if>
		    		<%-- 댓글 내용 --%>
		    		<p class="collapse show mt-1" id="edit${list.cbr_id}">${list.cbr_content}</p>
		    		
		    		<%-- 댓글 수정 --%>
		    		<form class="collapse" id="edit${list.cbr_id}">
		    			<div class="form-group">
				    		<textarea class="form-control mt-1" name="content" id="content" rows="3">${list.cbr_content}</textarea>
				    		<div class="d-flex flex-row-reverse">
			    				<input type="button" value="수정" onclick="updateComment(${list.cbr_id})" class="btn btn-dark mt-2 px-2"/>
				    		</div>
			    		</div>
		    		</form>
		    	</div>
		    </c:forEach>
	    </div>
	    
	    <%-- 댓글 달기 --%>
	    <c:if test="${member != null && pageDetail.classify != 1}">
		    <div class="bg-light my-4" id="commentInput">
		    	<form>
			    	<div class="form-group p-3">
			    		<label>댓글 달기</label>
			    		<input type="hidden" name="pageNo" value="${pageNo}" />
			    		<textarea name="content" id="content" class="form-control" rows="3"></textarea>
			    		<div class="d-flex flex-row-reverse">
		    				<input type="button" value="등록" onclick="submitComment()" class="btn btn-dark mt-2 px-2"/>
			    		</div>
			    	</div>
		    	</form>
		    </div>
	    </c:if>
	    
	    <div class="d-flex justify-content-center mb-3">
	    	<button class="btn btn-dark mt-2 px-2" onclick="location.href='./';">목록으로</button>
	    </div>
	</div>
	<%-- main 끝 --%>
	
	<%-- footer 영역 --%>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
		$(function() {
		    $('.autoExtend').each(function() {
		        $(this).height($(this).prop('scrollHeight'));
		        console.log($(this).height());
		    });
		});
		<c:if test="${pageDetail.classify == 2 and member != null}">
		// 좋아요를 이미 클릭했다면 채우기
		$(function() {
			if(${existLike}) {
		 		var x = $('#like')[0]; 
		 		x.classList.toggle("bi-heart");
		        x.classList.toggle("bi-heart-fill");
		        x.classList.toggle("text-danger");
			}
			if(${existAlarm}) {
				var x = $('#alarm')[0]; 
				x.classList.toggle("bi-exclamation-circle");
				x.classList.toggle("bi-exclamation-circle-fill");
				x.classList.toggle("text-warning");
			}
		});
		
		// 좋아요 클릭 이벤트
		
		function clickHeart(x) {
			var heartStatus, alarmStatus;
			var likeCnt = parseInt($('#likeCnt').html());
			if(x.classList.contains("bi-heart-fill")) {
				heartStatus = false;
				likeCnt = likeCnt - 1; 
			}
			else {
				heartStatus = true;
				likeCnt = likeCnt + 1; 
			}
		       
			$('#likeCnt').text(likeCnt);
		       
			x.classList.toggle("bi-heart");
			x.classList.toggle("bi-heart-fill");
			x.classList.toggle("text-danger");
			$.ajax({
				url: '/communityClickedLike',
				type: 'post',
				data: {
					status: heartStatus,
					cb_id: ${pageNo}
				}
			});
		}
		
		function clickAlarm(x) {
			if(x.classList.contains("bi-exclamation-circle-fill")) {
				alarmStatus = false;
			}
			else {
				alarmStatus = true;
			}
		       
			x.classList.toggle("bi-exclamation-circle");
			x.classList.toggle("bi-exclamation-circle-fill");
			x.classList.toggle("text-warning");
			$.ajax({
				url: '/communityClickedAlarm',
				type: 'post',
				data: {
					status: alarmStatus,
					mp_id: ${pageDetail.mp_id}
				}
			});
		}
		</c:if>
		
		// ------------ 게시물 부분 -------------
		function deletePost() {
			if(confirm("정말로 삭제하시겠습니까?")) {
				$.ajax({
					url : "/deletePost",
					type : "post",
					data : {
						pageNo : ${pageDetail.cb_id}
					},
					success : function(url) {
						window.location.href = "/" + url;
					}
				});
			}
		}
		
		
		// ------------ 댓글 부분 --------------
		
		function submitComment() {
			var content = $("#commentInput").find("#content").val();
			console.log(content);
			$.ajax({
				url : "/community/submitComment",
				type : "post",
				data : {
					pageNo : ${pageNo},
					content : content
				},
				success : function() {
					$("#commentOutput").load(location.href+" #commentOutput>*","");
					$("#commentInput").load(location.href+" #commentInput>*","");
				},
				error : function(xhr, status) {
		               alert(xhr + " : " + status);
		           }
			});
		}
		
		function updateComment(cbr_id) {
			var content = $("#commentOutput").find("#content").val();
			console.log(content);
			$.ajax({
				url : "/community/updateComment",
				type : "post",
				data : {
					cbr_id : cbr_id,
					content : content
				},
				success : function() {
					$("#commentOutput").load(location.href+" #commentOutput>*","");
				},
				error : function(xhr, status) {
		               alert(xhr + " : " + status);
		           }
			});
		}
		
		function deleteComment(cbr_id) {
			if (confirm('댓글을 삭제하시겠습니까?')) {
				$.ajax({
					url : "/community/deleteComment",
					type : "POST",
					data : {
						cbr_id : cbr_id
					},
					success : function() {
						$("#commentOutput").load(location.href+" #commentOutput>*","");
					},
					error:function(request,status,error){
				    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} else {
				
			}
		}
		
		function cancelEdit() {
			$("#commentOutput").load(location.href+" #commentOutput>*","");
		}
	</script>
</body>
</html>