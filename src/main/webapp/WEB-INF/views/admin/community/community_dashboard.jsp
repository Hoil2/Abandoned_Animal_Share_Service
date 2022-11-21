<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> 

	<title>멍멍냥냥 일상 게시판 대시보드</title>
	
	<style>
		.note-editable {
			background-color: #fff;
		}
	</style>
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
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
					</div>
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-success text-uppercase mb-1">오늘의 게시글 작성 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${postCountOfToday}개</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">주간 게시글 작성 그래프</h6>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<form action="/admin/community/${classify}" method="GET" class="form-inline">
							<select class="form-control ml-3" name="filter">
								<option value="post_title" <c:if test="${filter.equals('post_title')}">selected</c:if>>제목</option>
								<option value="post_content" <c:if test="${filter.equals('post_content')}">selected</c:if>>내용</option>
								<option value="m_name" <c:if test="${filter.equals('m_name')}">selected</c:if>>작성자명</option>
								<option value="mp_id" <c:if test="${filter.equals('mp_id')}">selected</c:if>>반려동물ID</option>
							</select>
							<input class="form-control ml-2" type="text" name="search" value="${search}" placeholder="검색어를 입력하세요." class="form-control">
							<button type="submit" class="btn px-3 btn-primary">
								<i class="fas fa-search"></i>
							</button>
						</form>
						
						<div class="d-flex ml-auto">
							<button class="btn btn-primary mr-2" data-toggle="modal" data-target="#post_submit">게시물 등록</button>
							<button class="btn btn-danger mr-3" onclick="deletePosts()">게시물 선택 삭제</button>
						</div>
					</div>
					<div>
						<table class="table table-hover table-white text-center">
							<thead>
								<tr>
									<th>
										<input id="allCheck" type="checkbox" name="allCheck">
									</th>
									<th>NO</th>
									<c:if test="${board == 2}"><th>반려동물ID</th></c:if>
									<th>작성자명</th>
									<th>게시물명</th>
									<th>등록일</th>
									<th>조회</th>
									<th>좋아요</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cl" items="${communityList}">
									<tr>
										<td>
											<input name="rowCheck" type="checkbox" value="${cl.cb_id}">			
										</td>
										<td>${cl.cb_id}</td>
										<c:if test="${board == 2}"><td><a onclick="openMemberPetPageToPopup(${cl.mp_id})" href="javascript:;">${cl.mp_id}</a></td></c:if>
										<td><a href="javascript:void(window.open('/admin/memberDetail?m_id=${cl.m_id}', '상세페이지' , 'width=1280px,height=840px,left=300,top=100, scrollbars=yes, resizable=no'));">${cl.m_name}</a></td>
										<td><a href="/admin/community/${classify}/${cl.cb_id}">${cl.title}</a></td>
										<td>${cl.reg_date}</td>
										<td>${cl.hit}</td>
										<td>${cl.goodCnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<c:if test="${Paging.totalCount > 10}">
						<!-- 게시글 페이징 처리(기준 10개) -->
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
						
								<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
								<c:choose>
									<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
										<li class="page-item disabled">
											<a class="page-link" onclick="redirectPage(${Paging.prevPageNo})">Previus</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" onclick="redirectPage(${Paging.prevPageNo})">Previus</a>
										</li>
									</c:otherwise>
								</c:choose>
								<!-- 페이지 갯수만큼 버튼 생성 -->
								<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
									<c:choose>
										<c:when test="${i eq Paging.pageNo }">
											<li class="page-item disabled">
												<a class="page-link" onclick="redirectPage(${i})"><c:out value="${i }"/></a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" onclick="redirectPage(${i})"><c:out value="${i }"/></a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
								<c:choose>
									<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
										<li class="page-item disabled">
											<a class="page-link" onclick="redirectPage(${Paging.nextPageNo})">Next</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" onclick="redirectPage(${Paging.nextPageNo})">Next</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</c:if>
				</div>
				<!-- 본문 -->
			</div>
			<!-- 하단 푸터 부분 -->
			<jsp:include page="../layout/footer.jsp"/>
    		<!-- 하단 푸터 부분 -->
		</div>
	</div>
    
	<div class="modal fade" id="post_submit" tabindex="-1">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">게시물 등록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		  <form id="postForm">
		  	  <input type="hidden" name="classify" value="${board}">
		      <div class="modal-body">
		          <div class="input-group mb-2">
		          	<div class="input-group-prepend">
		            	<span class="input-group-text">제목</span>
		            </div>
		            <input type="text" class="form-control" name="title" required>
		          </div>
		          
		          <%-- 일상 게시판일 때만 반려동물 ID 입력 --%>
		          <c:if test="${board == 2}">
			          <div class="input-group mb-2">
			          	<div class="input-group-prepend">
			            	<span class="input-group-text"><a href="" target="_blank">반려동물ID</a></span>
			            </div>
			            <input type="text" class="form-control" name="mp_id" required>
			          </div>
		          </c:if>
		          
		          <div class="form-group">
		            <textarea class="summernote" name="content"></textarea>
		          </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="submitPost();">게시물 등록</button>
		      </div>
          </form>
	    </div>
	  </div>
	</div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <!-- Chart -->
	<script src='<c:url value="/resources/js/Chart.min.js"/>'></script>
    
    <script>
    	// 게시물 등록
	    function submitPost() {
			var form = document.getElementById('postForm');
			for(var i=0; i < form.elements.length; i++){
			    if(form.elements[i].value === '' && form.elements[i].hasAttribute('required')){
			      alert('There are some required fields!');
			      return false;
			    }
			  }
			
			if ($('.summernote').summernote('isEmpty')) {
				alert('editor content is empty');
				return false;
			}
			
			<c:if test="${member == null}">
				alert('로그인이 필요합니다.');
				return;
			</c:if>
			
			
			$.ajax({
				url: "/admin/community/savePost",
				type: "post",
				data: $("#postForm").serialize(),
				success: function() {
					location.reload();
				}
			});
		}
		
    	// 게시물 선택 삭제
		function deletePosts() {
    		var cb_idList = [];
			$('input:checkbox[name=rowCheck]').each(function() {
				if($(this).is(":checked")==true){
					cb_idList.push($(this).val());
			    }
			});
			
			if(confirm("정말 " + cb_idList.join(",") + " 게시물을 삭제하시겠습니까?")) {
				$.ajax({
					url: "/admin/community/deletePosts",
					type: "post",
					traditional: true,
					data: {
						cb_idList: cb_idList
					},
					success: function() {
						location.reload();
					}
				});
			}
		}
		url = new URL(location.origin + location.pathname);
		console.log(url.toString());
    	function redirectPage(pageNo) {
    		url = new URL(location.origin + location.pathname);
    		
    		<c:if test="${filter != null}">
    			url.searchParams.set('filter', "${filter}");
    		</c:if>
    		<c:if test="${search != null}">
				url.searchParams.set('search', "${search}");
			</c:if>
    		
    		url.searchParams.set('page', pageNo);
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
    	
		// 전체 체크박스 클릭 이벤트
		$("#allCheck").click(function () {
		    $("[name='rowCheck']").prop('checked', $(this).prop('checked'));
		});
		
		$(function() {
			// 섬머노트 텍스트 에디터 설정
			$('.summernote').summernote({
				placeholder: '',
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
			
			/* // select option drop box 옵션 설정
			new Choices('#myPet', {
			    removeItemButton: true,
			    maxItemCount:1,
			    searchResultLimit:10
			    //renderChoiceLimit:10
			}); */
		});
		
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/adminUploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
    </script>

	<!-- 기간별 매출 Chart -->
	<script>
		Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#858796';
	
		function number_format(number, decimals, dec_point, thousands_sep) {
			// *     example: number_format(1234.56, 2, ',', ' ');
			// *     return: '1 234,56'
			number = (number + '').replace(',', '').replace(' ', '');
			var n = !isFinite(+number) ? 0 : +number,
				prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
				sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
				dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
				s = '',
				toFixedFix = function(n, prec) {
					var k = Math.pow(10, prec);
					return '' + Math.round(n * k) / k;
				};
			// Fix for IE parseFloat(0.55).toFixed(0) = 0;
			s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
			if (s[0].length > 3) {
				s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
			}
			if ((s[1] || '').length < prec) {
				s[1] = s[1] || '';
				s[1] += new Array(prec - s[1].length + 1).join('0');
			}
			return s.join(dec);
		}
		var ctx = document.getElementById("myAreaChart");
	
		var OrderDate = new Array();
		var Earnings = new Array();
	
		/* OrderDate.push("2022-11-02");
		Earnings.push("1");
		
		OrderDate.push("2022-11-03");
		Earnings.push("5");
		
		OrderDate.push("2022-11-04");
		Earnings.push("4"); */
		
		<c:forEach items="${postCountBy7Day}" var="list">
			OrderDate.push("${list.selected_date}");
			Earnings.push("${list.postCnt}");
		</c:forEach> 
		
		var myLineChart = new Chart(ctx, {
			type: 'line',
			data: {
				
				labels: OrderDate,
				datasets: [{
					label: "작성 수",
					lineTension: 0.3,
					backgroundColor: "rgba(78, 115, 223, 0.05)",
					borderColor: "rgba(78, 115, 223, 1)",
					pointRadius: 3,
					pointBackgroundColor: "rgba(78, 115, 223, 1)",
					pointBorderColor: "rgba(78, 115, 223, 1)",
					pointHoverRadius: 3,
					pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
					pointHoverBorderColor: "rgba(78, 115, 223, 1)",
					pointHitRadius: 10,
					pointBorderWidth: 2,
					data: Earnings,
				}],
			},
			options: {
				maintainAspectRatio: false,
				layout: {
					padding: {
						left: 10,
						right: 25,
						top: 25,
						bottom: 0
					}
				},
				scales: {
					xAxes: [{
						time: {
							unit: 'date'
						},
						gridLines: {
							display: false,
							drawBorder: false
						},
						ticks: {
							maxTicksLimit: 7
						}
					}],
					yAxes: [{
						ticks: {
							maxTicksLimit: 5,
							padding: 10,
							// Include a dollar sign in the ticks
							callback: function(value, index, values) {
								return number_format(value);
							}
						},
						gridLines: {
							color: "rgb(234, 236, 244)",
							zeroLineColor: "rgb(234, 236, 244)",
							drawBorder: false,
							borderDash: [2],
							zeroLineBorderDash: [2]
						}
					}],
				},
				legend: {
					display: false
				},
				tooltips: {
					backgroundColor: "rgb(255,255,255)",
					bodyFontColor: "#858796",
					titleMarginBottom: 10,
					titleFontColor: '#6e707e',
					titleFontSize: 14,
					borderColor: '#dddfeb',
					borderWidth: 1,
					xPadding: 15,
					yPadding: 15,
					displayColors: false,
					intersect: false,
					mode: 'index',
					caretPadding: 10,
					callbacks: {
						label: function(tooltipItem, chart) {
							var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
							return datasetLabel + " : " + number_format(tooltipItem.yLabel);
						}
					}
				}
			}
		});
	</script>
</body>
</html>