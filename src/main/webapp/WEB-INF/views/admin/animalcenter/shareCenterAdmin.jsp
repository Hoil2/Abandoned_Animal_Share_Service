<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet"href="/resources/css/loading.css" />
<title>멍멍냥냥 관리자</title>
<script>
$(document).ready(function() {
	let searchCategory = '${searchCategory}';
	let searchKeyword = '${searchKeyword}';
	if(searchCategory == 'no'){
		$('#searchKeyword').val('');
		$("#category2").on("change", function() {
			shereCenterUrl = "shereCenter?page=1&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
			$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		});
		
		$("#searchTheme").on("change", function() {
			shereCenterUrl = "shereCenter?page=1&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
			$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		});
		
		$("#searchArea").on("change", function() {
			shereCenterUrl = "shereCenter?page=1&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
			$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		});
	}else{
		console.log("as");
		$("#category2").on("change", function() {
			shereCenterUrl = "shereCenter?page=1&searchCategory=" + $("#searchCategory").val() + "&searchKeyword=" + $("#searchKeyword").val() + "&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
			$("#slistDiv").load(shereCenterUrl + " #slistDiv");
			//location.href = "shereCenter?page=1&searchCategory=" + $("#searchCategory").val() + "&searchKeyword=" + searchKeyword + "&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
		});
		
		$("#searchTheme").on("change", function() {
			shereCenterUrl = "shereCenter?page=1&searchCategory=" + $("#searchCategory").val() + "&searchKeyword=" + $("#searchKeyword").val() + "&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
			$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		});
		
		$("#searchArea").on("change", function() {
			shereCenterUrl = "shereCenter?page=1&searchCategory=" + $("#searchCategory").val() + "&searchKeyword=" + $("#searchKeyword").val() + "&searchTheme=" +$("#searchTheme").val() + "&searchArea=" + $("#searchArea").val() + "&alignment=" + $("#category2").val();
			$("#slistDiv").load(shereCenterUrl + " #slistDiv");
		});
	}
	
});
</script>

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
						<h1 class="h3 mb-0 text-gray-800">ShareCenter Management</h1>
					</div>
					
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">오늘 등록된 유기동물 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<c:choose>
													<c:when test="${TodayRegistrationCount ne null}">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${TodayRegistrationCount} 마리</div>
													</c:when>
													<c:otherwise>
														<font size="2px;">오늘 등록된 유기동물이 없습니다.</font> 
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-cat fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
										<div class="text-xs font-weight-bold text-info text-uppercase mb-1">공고 종료 3일내 동물 수</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${AnimalDeadlineCount}마리</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar-times fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-success text-uppercase mb-1">등록 보호소 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${ShelterCount} 개</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-hospital-alt fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">API 갱신일</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatDate value="${ApiRenewalDate}" pattern="yyyy-MM-dd a h:mm"/></div>
										</div>
										<div class="col-auto">
											<button style="border:none; background-color: white;" id="btnApiRequest"><i class="fas fa-sync-alt fa-2x text-gray-300"></i></button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">보호중</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<c:choose>
													<c:when test="${AnimalProtectCount ne null}">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${AnimalProtectCount} 마리</div>
													</c:when>
													<c:otherwise>
														<font size="2px;">보호중인 유기동물이 없습니다.</font> 
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dog fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
										<div class="text-xs font-weight-bold text-info text-uppercase mb-1">입양(2주 내)</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${AnimalAdoptionCount} 건</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-baby-carriage fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-success text-uppercase mb-1">반환(2주 내)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${AnimalReturnCount} 건</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user-friends fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">무지개다리(2주 내)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${AnimalDeathCount} 건 </div>
										</div>
										<div class="col-auto">
											<i class="fas fa-skull fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-sm-8">
							<form action="/admin/shereCenter" role="form" method="GET" class="form-inline">
								<select class="form-control" id="searchCategory" name="searchCategory">
									<option value="desertion_no" <c:if test="${searchCategory eq 'desertion_no'}"> selected </c:if>>No</option>
									<option value="kind_cd" <c:if test="${searchCategory eq 'kind_cd'}"> selected </c:if>>종</option>
									<option value="notice_no" <c:if test="${searchCategory eq 'notice_no'}"> selected </c:if>>공고지역</option>
								</select>
								<div class="col-sm-4">
									<input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요." class="form-control" required="required"  value ="${searchKeyword}">
									<button type="submit" class="btn px-3 btn-primary">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</form>
						</div>
						
									
						<div class="d-flex flex-row justify-content-end"  style="margin: 10px 0px;">
							<div class="col-lg-2 col-md-2" align="right" style="padding: 0px 10px 0px 0px;">
								분류
							</div>
							<div class="col-lg-3 col-md-3" style="padding: 0px 0px;">
								<select class="form-control" id="searchTheme">
									<option value="allTheme" <c:if test="${searchTheme eq 'allTheme'}"> selected </c:if>>전체</option>
									<option value="개" <c:if test="${searchTheme eq '개'}"> selected </c:if>>개</option>
									<option value="고양이" <c:if test="${searchTheme eq '고양이'}"> selected </c:if>>고양이</option>
									<option value="기타축종" <c:if test="${searchTheme eq '기타축종'}"> selected </c:if>>기타</option>
								</select>
							</div>
							<div class="col-lg-2 col-md-2" align="right" style="padding: 0px 10px 0px 0px;">
								지역
							</div>
							<div class="col-lg-3 col-md-3" style="padding: 0px 0px;">
								<select class="form-control" id="searchArea" name="searchArea">
									<option value="allArea" <c:if test="${searchArea eq 'allArea'}"> selected </c:if>>전체</option>
									<c:forEach var="areaList" items="${areaList}">
										<c:choose>
											<c:when test="${areaList.notice_no ne null}">
												<option value="${areaList.notice_no}" <c:if test="${searchArea eq areaList.notice_no}"> selected </c:if>>${areaList.notice_no}</option>
											</c:when>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="col-lg-2 col-md-2" align="right" style="padding: 0px 10px 0px 0px;">
								보기
							</div>
							<div class="col-lg-3 col-md-3" align="right" style="padding: 0px 0px;">
								<select class="form-control" id="category2">
									<option value="alignmentDay" <c:if test="${alignment eq 'alignmentDay'}"> selected </c:if>>최신순</option>
									<option value="alignmentHit" <c:if test="${alignment eq 'alignmentHit'}"> selected </c:if>>조회순</option>
									<option value="alignmentGood" <c:if test="${alignment eq 'alignmentGood'}"> selected </c:if>>좋아요순</option>
								</select>
							</div>
						</div>
					</div>
					<br>
					<div id="slistDiv">
						<c:if test="${sTotolCount ne 0}">
							<div>
								<table class="table table-hover table-white">
									<thead>
										<tr>
											<th>
												<input id="allCheck" type="checkbox" name="allCheck">
											</th>
											<th><font size="3">No</font></th>
											<th><font size="3">종</font></th>
											<th><font size="3">나이</font></th>
											<th><font size="3">성별</font></th>
											<th><font size="3">지역</font></th>
											<th><font size="3">상태</font></th>
											<th><font size="3">기간</font></th>
											<th><font size="3">조회수</font></th>
											<th><font size="3">좋아요</font></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${slist}" var="slist">
											<tr>
												<td>
													<input name="RowCheck" type="checkbox" value="${slist.desertion_no}">			
												</td>
												<td><font size="3">${slist.desertion_no}</font></td>
												<td><font size="3"><c:out value="${slist.kind_cd}"></c:out></font></td>
												<td><font size="3"><c:out value="${slist.age}"></c:out></font></td>
												<c:choose>
													<c:when test="${slist.sex_cd eq 'M'}"> 
														<td><font size="3px;" color="Blue">♂</font></td>
													</c:when>
													<c:when test="${slist.sex_cd eq 'F'}"> 
														<td><font size="3px;" color="#FF7171;">♀</font></td>
													</c:when>
													<c:otherwise> 
														<td><font size="1px;">(미상)</font></td>
													 </c:otherwise>
												</c:choose>
												<td><font size="3">${fn:substring(slist.notice_no,0,5)}</font></td>
												<td><font size="3">${slist.process_state}</font></td>
												<td><font size="3">${slist.notice_sdt} ~ ${slist.notice_edt} </font></td>
												<td><font size="3">${slist.hit} </font></td>
												<td><font size="3">${slist.good} </font></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
						<c:if test="${sTotolCount eq 0}">
							<div align="center" class="col-lg-12" style="margin:  25% 0;">등록된 유기동물 정보가 없습니다</div>
						</c:if>
						
						<c:if test="${Paging.totalCount > 10}">
							<nav aria-label="Page navigation" id="pagination">
								<ul class="pagination justify-content-center">
									<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
									<c:choose>
										<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
										</c:when>
										<c:when test="${Paging.pageNo ne Paging.firstPageNo and searchCategory ne 'no'}">
											<li class="page-item">
												<a class="page-link" href="shereCenter?page=${Paging.prevPageNo}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}">Previus</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="shereCenter?page=${Paging.prevPageNo}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}">Previus</a>
											</li>
										</c:otherwise>
									</c:choose>
									<!-- 페이지 갯수만큼 버튼 생성 -->
									<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
										<c:choose>
											<c:when test="${i eq Paging.pageNo }">
												<li class="page-item disabled">
													<a class="page-link" href="shereCenter?page=${i}"><c:out value="${i }"/></a>
												</li>
											</c:when>
											<c:when test="${i ne Paging.pageNo and searchCategory ne 'no'}">
												<li class="page-item">
													<a class="page-link" href="shereCenter?page=${i}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}">${i}</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link" href="shereCenter?page=${i}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}"><c:out value="${i }"/></a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
									<c:choose>
										<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
										</c:when>
											<c:when test="${Paging.pageNo ne Paging.finalPageNo and searchCategory ne 'no'}">
												<li class="page-item">
													<a class="page-link" href="shereCenter?page=${Paging.nextPageNo}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}">Next</a>
												</li>
											</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="shereCenter?page=${Paging.nextPageNo}&searchTheme=${searchTheme}&searchArea=${searchArea}&alignment=${alignment}">Next</a>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</nav>
						</c:if>
					</div>
				</div>
				<!-- 본문 -->
			</div>
			<!-- 하단 푸터 부분 -->
			<jsp:include page="../layout/footer.jsp"/>
			<!-- 하단 푸터 부분 -->
		</div>
	</div>
<div class="wrap-loading display-none">
	<div><img src="/resources/images/loading.gif" /></div>
</div>
<script type="text/javascript">


$('#btnApiRequest').click(function() {
	var doubleSubmitFlag = false;
	
	if(doubleSubmitFlag){ // 더블써밋 플래그가 true가 되면 '처리중' 실행
		alert('처리중입니다.');
		return false;
	}else{
		$.ajax({
			url: "/abandonedAnimalApiRequest",
			type: "GET",
			success: function(data) {
				console.log(data);
				//location.reload();
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			},
			complete:function(){
				$('.wrap-loading').addClass('display-none');
			},
			error: function() {
				swal({
					title: "멍멍냥냥",
					text: "문제가 발생하였습니다.\n잠시 후 다시 시도해주세요.",
					icon: "error"
				});
			}
		});
		doubleSubmitFlag = false; 
	}
})
</script>
</body>
</html>