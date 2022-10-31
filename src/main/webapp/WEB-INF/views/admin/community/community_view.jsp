<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${community.title}</title>
</head>
<body id="page-top">
    <div id="wrapper">
    	<!-- 좌측 배너 부분 -->
		<jsp:include page="../layout/banner.jsp"/>
		<!-- 좌측 배너 부분 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- 상단 헤더 부분 -->
				<jsp:include page="../layout/header.jsp"/>
				<!-- 상단 헤더 부분 -->
				
				<!-- 본문 -->
				<div class="container-fluid">
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">커뮤니티</h1>
					</div>
					
					<%-- 게시물 제목 부분 --%>
				  	<div class="pt-5 pb-1">
					    <h2 class="h2">${community.title}</h2>
					    <span class="fs-4 pr-3">${writer.name}</span>
					    <span class="fs-4">조회수 ${community.hit}</span>
					    <%-- 글 삭제 --%>
					    <span class="float-right"><a href="javascript:;" onclick="deletePost()">삭제</a></span>
				    </div>
				    
				    <hr>
					
					<%-- 게시물 내용 부분 --%>
				    <div class="pt-3 pb-3">
				    	<c:out value="${community.content}" escapeXml="false"/>
				    </div>
				    <hr>
				    
				    <%-- 댓글 출력 --%>
				    <div id="commentOutput">
					    <c:forEach var="list" items="${clist}" varStatus="status">
					    	<div class="px-3 pt-3">
					    		<span class="fw-bold">${list.name}</span> <span>(${list.reg_date})</span>
					    		<%-- 삭제 --%>
					    		<c:if test="${writer.m_id == list.m_id}">
						    		<div class="float-right">
						    			<div class="collapse show" id="edit${list.cbr_id}">
								    		<span><a href="javascript:;" onclick="deleteComment(${list.cbr_id})">삭제</a></span>
							    		</div>
							    		<span class="collapse" id="edit${list.cbr_id}"><a onclick="cancelEdit()" data-toggle="collapse" href="#edit${list.cbr_id}" role="button" aria-expanded="false" aria-controls="edit${list.cbr_id}">닫기</a></span>
						    		</div>
					    		</c:if>
					    		<%-- 댓글 내용 --%>
					    		<p class="collapse show mt-1" id="edit${list.cbr_id}">${list.cbr_content}</p>
					    	</div>
					    </c:forEach>
				    </div>
				</div>
				<!-- 본문 -->
				
			</div>
			<!-- 하단 푸터 부분 -->
			<jsp:include page="../layout/footer.jsp"/>
    		<!-- 하단 푸터 부분 -->
		</div>
	</div>
    
    <script>
    
    </script>
</body>
</html>