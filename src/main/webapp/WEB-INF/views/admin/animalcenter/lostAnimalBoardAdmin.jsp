<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍멍냥냥 관리자</title>
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
						<h1 class="h3 mb-0 text-gray-800">LostAnimal Management</h1>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-8">
							<form action="/admin/lostAnimalBoardAdmin" role="form" method="GET" class="form-inline">
								<select class="form-control" id="searchCategory" name="searchCategory">
									<option value="alb_id" <c:if test="${searchCategory eq 'alb_id'}">selected="selected"</c:if>>게시글번호</option>
									<option value="m_id" <c:if test="${searchCategory eq 'm_id'}">selected="selected"</c:if>>회원번호</option>
									<option value="name" <c:if test="${searchCategory eq 'name'}">selected="selected"</c:if>>작성자</option>
								</select>
								<div class="col-sm-4">
									<input type="text" id="searchKeyword " name="searchKeyword" <c:if test="${searchKeyword ne 'no'}"> value="${searchKeyword}"</c:if> placeholder="검색어를 입력하세요." class="form-control" required="required">
									<button type="submit" class="btn px-3 btn-primary">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</form>
						</div>
						
						<div class="col-sm-4">
							<div class="d-flex">
								<div class="ml-auto">
									<button class="btn btn-primary" id="btnLostAnimal">등록</button>
									<input type="button" class="btn btn-primary" value="삭제" onclick="deleteValue();">
								</div>
							</div>
						</div>
					</div>
					<br>
					<table class="table table-hover table-white">
						<thead align="center">
							<tr>
								<th>
									<input id="allCheck" type="checkbox" name="allCheck">
								</th>
								<th ><font size="3">게시글번호</font></th>
								<th><font size="3">작성자</font></th>
								<th><font size="3">회원번호</font></th>
								<th><font size="3">반려동물명</font></th>
								<th><font size="3">나이/성별</font></th>
								<th><font size="3">분실장소</font></th>
								<th><font size="3">분실일</font></th>
								<th><font size="3">작성일</font></th>
								<th><font size="3">게시여부</font></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${slist}" var="slist">
								<tr>
									<td align="center">
										<input name="RowCheck" type="checkbox" value="${slist.alb_id}">			
									</td>
									<td align="center"><font size="3">${slist.alb_id}</font></td>
									<td align="center"><font size="3">${slist.name}</font></td>
									<td align="center"><font size="3">${slist.m_id} </font></td>
									<td align="center"><font size="3"><a href="javascript:void(window.open('/admin/lostAnimalView?alb_id=${slist.alb_id}', '상세페이지' , 'width=1280px,height=840px,left=300,top=100, scrollbars=yes, resizable=no'));"><c:out value="${slist.pet_name}"></c:out></a></font></td>
									<td align="center">
										<font size="3">${slist.age} /
											<c:choose>
												<c:when test="${slist.sex_cd eq 'M'}"> 
													<font size="3px;" color="Blue"> ♂</font>
												</c:when>
												<c:when test="${slist.sex_cd eq 'F'}"> 
													<font size="3px;" color="#FF7171;">♀</font>
												</c:when>
												<c:otherwise> 
													<font size="1px;">(미상)</font>
												 </c:otherwise>
											</c:choose>
										</font>
									</td>
									<td ><font size="3"><c:out value="${slist.lost_place}"></c:out></font></td>
									<td align="center"><font size="3"><c:out value="${slist.lost_date}"></c:out></font></td>
									<td align="center"><font size="3"><c:out value="${slist.reg_date}"></c:out></font></td>
									<td  align="center"><font size="3">
										<c:choose>
											<c:when test="${slist.enable eq '1'}"> 
												<button type="button" class="btn btn-outline-primary" onclick="modifyEnableValue(${slist.alb_id}, ${slist.enable})"><font size="3px;" color="Blue"> ON</font></button>
											</c:when>
											<c:otherwise> 
												<button type="button" class="btn btn-outline-warning" onclick="modifyEnableValue(${slist.alb_id}, ${slist.enable})"><font size="3px;" color="Orange"> OFF</font></button>
											 </c:otherwise>
										</c:choose>
									</font></td>
								</tr>
							</c:forEach>
							
							<c:if test="${Paging.totalCount < 1}">
								<tr align="center" >
									<td rowspan="10" colspan="10"><div align="center" class="col-sm-12" style="margin: 20% 0;">게시글이 없습니다.</div></td>
								</tr>
							</c:if>
							
						</tbody>
						
					</table>
				</div>
				
			</div>
			
			<c:if test="${ Paging.totalCount > 10}">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
							</c:when>
							<c:when test="${Paging.pageNo ne Paging.firstPageNo && searchCategory ne 'no' && searchKeyword ne 'no'}">
								<li class="page-item"><a href="lostAnimalBoardAdmin?page=${Paging.prevPageNo}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}" class="page-link" aria-label="Previous">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="lostAnimalBoardAdmin?page=${Paging.prevPageNo}" class="page-link" aria-label="Previous">Previous</a></li>
							</c:otherwise>
						</c:choose>
						<!-- 페이지 갯수만큼 버튼 생성 -->
						<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
							<c:choose>
								<c:when test="${i eq Paging.pageNo }">
									<li class="page-item active disabled"> <a href="" class="page-link"><c:out value="${i }"/></a> </li>
								</c:when>
								<c:when test="${i ne Paging.pageNo && searchCategory ne 'no' && searchKeyword ne 'no'}">
									<li class="page-item"> <a href="lostAnimalBoardAdmin?page=${i}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}" class="page-link"><c:out value="${i }"/></a> </li>
								</c:when>
								<c:otherwise>
									<li class="page-item"> <a href="lostAnimalBoardAdmin?page=${i}" class="page-link"><c:out value="${i }"/></a> </li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
						<c:choose>
							<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
							</c:when>
							<c:when test="${Paging.pageNo ne Paging.finalPageNo && searchCategory ne 'no' && searchKeyword ne 'no'}">
								<li class="page-item"><a href="lostAnimalBoardAdmin?page=${Paging.nextPageNo}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}" class="page-link" aria-label="Next"> Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="lostAnimalBoardAdmin?page=${Paging.nextPageNo}" class="page-link" aria-label="Next">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</c:if>
			<!-- 하단 푸터 부분 -->
			<jsp:include page="../layout/footer.jsp"/>
    		<!-- 하단 푸터 부분 -->
    		
		</div>
	</div>
	
	<!-- 회원 등록 -->
	<div class="modal fade" id="AdminSignUp" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>회원 등록</h4>
						<hr>
					</div>
					<div class="d-flex flex-column">
						<form id="myform" role="form" method="POST"  enctype="multipart/form-data">
							<!-- 아이디 & 비밀번호 -->
							<div class="form-group row">
								<div class="col-xs-12 col-md-12">
									<input type="file" class="form-control" id="file" name="file">
								</div>
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">아이디</span>
										</div>
										<input type="text" name="m_id" id="m_id" class="form-control" required>
										<span class="input-group-btn">
											<button class="btn btn-primary"  id="IDCheck" type="button">중복체크</button>
										</span>
									</div>
								</div>
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">비밀번호</span>
										</div>
										<input type="password" name="m_pw" id="m_pw" class="form-control" required>
									</div>
								</div>
							</div>
							<!-- 이름 & 마일리지 -->
							<div class="form-group row">
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">이름</span>
										</div>
										<input type="text" id="m_name" name="m_name" class="form-control" required>
									</div>
								</div>
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">권한</span>
										</div>
										<select class="form-control" id="m_authority" name="m_authority">
											<option value="1">관리자</option>
											<option value="2">회원</option>
											<option value="3">VIP</option>
											<option value="4">블랙리스트</option>
										</select>
									</div>
								</div>
							</div>
							<!-- 특이사항 -->
							<div class="form-group">
								<div class="input-group my-2 mb-1">
									<div class="input-group-prepend">
										<span class="input-group-text">특이사항</span>
									</div>
									<textarea rows="5" cols="25" name="m_comment" id="m_comment" class="form-control"></textarea>
								</div>
							</div>
							
							<button type="button" class="btn btn-primary btn-block btn-round" id="btnLostAnimal">회원등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	//체크박스 선택 관련
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	//삭제버튼 눌렀을 때 실행 
	function deleteValue(){
		var url = "/admin/lostAnimalSelectDelete";    // Controller로 보내고자 하는 URL
		var valueArr = new Array();
	    var list = $("input[name='RowCheck']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	            valueArr.push(list[i].value);
	        }
	    }
	    if (valueArr.length == 0){
    		Swal.fire({
	  			title: '선택된 게시글이 없습니다.',
		  		text: "삭제하실 게시글을 선택해주세요.",
		  		icon: 'warning',
		  		confirmButtonColor: '#3085d6',
		  		confirmButtonText: '확인',
		  	})
	    }else{
	    	Swal.fire({
	  		  	title: '게시글을 삭제하시겠습니까?',
  		  		text: "삭제하시면 다시 복구시킬 수 없습니다.",
  		    	icon: 'warning',
  		   		showCancelButton: true,
  		   		confirmButtonColor: '#3085d6',
  		   		cancelButtonColor: '#d33',
  		  	 	confirmButtonText: '삭제',
  		  	 	cancelButtonText: '취소'
	  		}).then((result) => {
	  		  if (result.value) {
		  			$.ajax({
					    url : url,                    // 전송 URL
					    type : 'GET',                // GET or POST 방식
					    traditional : true,
					    data : {
					    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
					    },
		                success: function(jdata){
		                    if(jdata != 1) {
		                    	alert("삭제 실패(문의전화 : 010-9748-5575 or 010-3266-5702)");
		                    } else{
		                    	location.reload(); // 메인 -> 회원페이지 -> 삭제 -> 뒤로가기해도 메인으로 감
		                    }
		                }
					});
	  		  }
	  		})
		}
	}
	
	$('#btnLostAnimal').click(function() {
		window.open('/admin/writeLostAnimalPage', '상세페이지' , 'width=1280px,height=840px,left=300,top=100, scrollbars=yes, resizable=no');
	})
	
	function modifyEnableValue(alb_id, enable){
		$.ajax({
			url :  "/admin/modifyEnableLostAnimal",
			type : 'GET', 
			data : {
				alb_id : alb_id,
				enable : enable
			},
			success: function(jdata){
				if(jdata != 1) {
					alert("삭제 실패(문의전화 : 010-9748-5575 or 010-3266-5702)");
				} else{
					location.reload();
				}
			}
		});
	}
	
	
</script>
</body>
</html>