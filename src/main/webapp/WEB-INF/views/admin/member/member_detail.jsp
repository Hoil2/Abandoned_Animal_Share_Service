<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍멍냥냥 회원 정보</title>
</head>
<body id="page-top">
    <div id="wrapper">
		<!-- 좌측 배너 부분 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- 상단 헤더 부분 -->
				<jsp:include page="../layout/header.jsp"/>
				<script src='<c:url value="/resources/js/Board.js"/>'></script>
				<!-- 상단 헤더 부분 -->
				
				<!-- 본문 -->
				<div class="container-fluid" >
					<div class="form-title text-center">
						<h4>회원 상세정보</h4>
						<hr>
					</div>
					<div class="d-flex flex-column">
						<form role="form" name="memberUpdate" id="memberUpdate" method="POST"  enctype="multipart/form-data">
							<div class="row">
								<div class="col-xs-8 col-md-8">
									<!-- 아이디 & 비밀번호 -->
									<div class="form-group row">
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">No</span>
												</div>
												<input type="text" name="m_id" id="m_id" class="form-control" value="${mDetail.m_id}" readonly>
											</div>
										</div>
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">이름</span>
												</div>
												<input type="text" name="name" id="name" class="form-control" value="${mDetail.name}" readonly>
											</div>
										</div>
									</div>
									<!-- 이름 & 마일리지 -->
									<div class="form-group row">
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">아이디</span>
												</div>
												<input type="text" name="email" id="email" class="form-control" value="${mDetail.email}" readonly>
											</div>
										</div>
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">비밀번호</span>
												</div>
												<input type="password" name="pw" id="pw" class="form-control" value="${mDetail.m_pw}">
											</div>
										</div>
									</div>
									
									<div class="form-group row">
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">권한</span>
												</div>
												<select id="grade" name="grade" class="form-control">
													<option value="User" <c:if test="${mDetail.grade.equals('User')}">selected</c:if>>회원</option>
													<option value="Admin" <c:if test="${mDetail.grade.equals('Admin')}">selected</c:if>>관리자</option>
												</select>
											</div>
										</div>
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">가입일</span>
												</div>
												<input type="text" name="signup_date" id="signup_date" class="form-control" value="${mDetail.signup_date}" readonly>
											</div>
										</div>
									</div>
									
									<div class="form-group row">
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">지역</span>
												</div>
												<input type="text" name="region" id="region" class="form-control" value="${mDetail.region}">
											</div>
										</div>
										<div class="col-xs-6 col-md-6">
											<div class="input-group my-2 mb-1">
												<div class="input-group-prepend">
													<span class="input-group-text">Tel</span>
												</div>
												<input type="text" name="tel" id="tel" class="form-control" value="${mDetail.phone}">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 특이사항 -->
							<div class="form-group">
								<div class="input-group my-2 mb-1">
									<div class="input-group-prepend">
										<span class="input-group-text">특이사항</span>
									</div>
									<textarea rows="5" cols="25" name="comment" id="comment" class="form-control">${mDetail.comment}</textarea>
								</div>
							</div>
							
							<button type="button" class="btn btn-primary btn-block btn-round" id="btnAdminModify">수정</button>
							<br>
							<!-- 강의 -->
							<h4>펫 보유 목록</h4>
							<table class="table table-hover table-white">
								<thead>
									<tr>
										<th>No</th>
										<th>애칭</th>
										<th>성별</th>
										<th>나이</th>
										<th>종류</th>
										<th>품종</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${memberPetList}" var="memberPet">
									<tr>
										<td><a onclick="openMemberPetPageToPopup(${memberPet.mp_id})" href="javascript:;">${memberPet.mp_id}</a></td>
										<td>${memberPet.name}</td>
										<td>${memberPet.sex }</td>
										<td>${memberPet.age }</td>
										<td>${memberPet.kind }</td>
										<td>${memberPet.breed }</td>
										<td>${memberPet.reg_date }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<c:if test="${petPaging.totalCount > 5}">
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center">
										<!-- 페이지 갯수만큼 버튼 생성 -->
										<c:forEach var="i" begin="${petPaging.startPageNo }" end="${petPaging.endPageNo }" step="1">
											<c:choose>
												<c:when test="${i eq petPaging.pageNo }">
													<li class="page-item disabled">
														<a class="page-link" onclick="redirectPage(${i}, ${communityPaging.pageNo})"><c:out value="${i }"/></a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="page-item">
														<a class="page-link" onclick="redirectPage(${i}, ${communityPaging.pageNo})"><c:out value="${i }"/></a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ul>
								</nav>
							</c:if>
							<c:if  test="${petPaging.totalCount <= 0 }">
								<div align="center">보유한 펫이 없습니다.</div>
							</c:if>
							<hr>
							
							<!-- 커뮤니티 -->
							<h4>커뮤니티 게시글 작성 내역</h4>
							<table class="table table-hover table-white">
								<thead>
									<tr>
										<th>게시글번호</th>
										<th>종류</th>
										<th>제목</th>
										<th>조회수</th>
										<th>작성일</th>
										<th>게시여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${memberPostList}" var="cList">
									<tr>
										<td>C-${cList.cb_id}</td>
										<c:choose>
											<c:when test="${cList.classify eq 1}">
												<td><font size="3">지식백과</font></td>
											</c:when>
											<c:when test="${cList.classify eq 2}">
												<td><font size="3">일상공유</font></td>
											</c:when>
											<c:when test="${cList.classify eq 3}">
												<td><font size="3">정보공유</font></td>
											</c:when>
										</c:choose>
										<td><a onclick="openMemberPostPageToPopup(${cList.classify}, ${cList.cb_id})" href="javascript:;">${cList.title}</a></td>
										<td>${cList.hit }</td>
										<td>${cList.reg_date }</td>
										<c:choose>
											<c:when test="${cList.enable eq 0}">
												<td><font size="3">x</font></td>
											</c:when>
											<c:when test="${cList.enable eq 1}">
												<td><font size="3">O</font></td>
											</c:when>
										</c:choose>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<c:if test="${communityPaging.totalCount > 5}">
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center">
										
										<!-- 페이지 갯수만큼 버튼 생성 -->
										<c:forEach var="j" begin="${communityPaging.startPageNo }" end="${communityPaging.endPageNo }" step="1">
											<c:choose>
												<c:when test="${j eq communityPaging.pageNo }">
													<li class="page-item disabled">
														<a class="page-link" onclick="redirectPage(${petPaging.pageNo}, ${j})"><c:out value="${j }"/></a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="page-item">
														<a class="page-link" onclick="redirectPage(${petPaging.pageNo}, ${j})"><c:out value="${j }"/></a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
									</ul>
								</nav>
							</c:if>
							<c:if  test="${communityPaging.totalCount <= 0 }">
								<div align="center">작성 게시글 이력이 없습니다.</div><br>
							</c:if>
						</form>
					</div>
				</div>
			</div>
			<!-- 본문 -->
		</div>
	</div>
	
	<!-- 하단 푸터 부분 -->
	<jsp:include page="../layout/footer.jsp"/>
	<!-- 하단 푸터 부분 -->
	
	<script type="text/javascript">
		$('#btnAdminModify').click(function() {
			var form = $("form")[0];
			var formData = new FormData(form);
			
			$.ajax({
				cache : false,
				url : "/admin/updateMember", 
				processData: false,
				contentType: false,
				type : 'POST', 
				data : formData, 
				success : function(data = 1) {
					opener.location.reload();
					alert("수정 완료");
				},
				error : function(xhr, status) {
					alert(xhr + " : " + status);
				}
			});
		})
		
		
		function redirectPage(petPage, communityPage) {
			url = new URL(location.origin + location.pathname);
			
			url.searchParams.set('m_id', ${mDetail.m_id});
			url.searchParams.set('petPage', petPage);
			url.searchParams.set('communityPage', communityPage);
			location.href = url;
		}
		
		function openMemberPetPageToPopup(mp_id) {
			// 창 크기 지정
			var width = window.screen.width * 30 / 100;
			var height = (window.screen.height * 43 / 100);

			// pc화면기준 가운데 정렬
			var left = (window.screen.width / 2) - (width / 2);
			var top = (window.screen.height / 2) - (height / 2);

			var url = "/admin/memberPetDetail?mp_id="+mp_id;
			var option = "width = " + width + ", height = " + height + ", left=" + left + ", top = " + top;
			window.open(url, "_blank", option);
		}
		
		function openMemberPostPageToPopup(classify, cb_id) {
			// 창 크기 지정
			var width = window.screen.width * 80 / 100;
			var height = (window.screen.height * 80 / 100);

			// pc화면기준 가운데 정렬
			var left = (window.screen.width / 2) - (width / 2);
			var top = (window.screen.height / 2) - (height / 2);
			
			var boardName;
			if(classify == 1) {
				boardName = "dictionary";
			}
			else if(classify == 2) {
				boardName = "daily";
			}
			else if(classify == 3) {
				boardName = "info";
			}
			var url = "/admin/community/"+boardName+"/"+cb_id;
			var option = "width = " + width + ", height = " + height + ", left=" + left + ", top = " + top;
			window.open(url, "_blank", option);
		}
	</script>
</body>
</html>