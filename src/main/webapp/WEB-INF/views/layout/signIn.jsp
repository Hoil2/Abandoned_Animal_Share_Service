<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<!-- 로그인 Modal 부분 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form action="/signIn" method="post">
						<div class="form-title text-center">
							<h4>Login</h4>
						</div>
						<div class="d-flex flex-column text-center">
							<div class="form-group">
								<input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요" required autofocus>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요" required>
							</div>
							<button type="submit" class="thm-btn-psd btn-block btn-round">로그인</button>
						</div>
					</form>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<div class="signup-section">
						회원이 아니라면 <a href="#registerModal" class="text-primary" data-toggle="modal" data-target="#registerModal">회원가입</a> <br>							
		                   <a href="findID">아이디 찾기</a> | <a href="findPassword">비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%-- <script>	
		$(document).ready(function() {
			$('#nonMembers').click(function() {
				var UserID = $("#ReservationUserID").val();
				var Name = $("#ReservationName").val();
				var Phone = $("#ReservationPhone").val();
				
				var param = {'userId': UserID, 'name': Name, 'phonenum': Phone};
				
				if(!UserID){
					swal({
						title: "비회원 문의",
						text: "아이디가 작성되지 않았습니다.",
						icon: "warning",
						timer: 3000
					});
					return false;
				}
				else if(!Name) {
					swal({
						title: "비회원 문의",
						text: "이름이 작성되지 않았습니다.",
						icon: "warning",
						timer: 3000
					});
					return false;
				}
				else if(!Phone){
					swal({
						title: "비회원 문의",
						text: "전화번호가 작성되지 않았습니다.",
						icon: "warning",
						timer: 3000
					});
					return false;
				}
				else {
					$.ajax({
						url: "NonMemberView",
						type: "POST",
						data: param,
						success: function(data) {
							if (data == null) {
								swal({
									title: "비회원 문의",
									text: "최근 예약된 내역이 없습니다.",
									icon: "warning",
									timer: 3000
								});
							}
							else {
								swal({
									title: "비회원 문의",
									text: "회원님께서 예약하신 상품은 " + data.productname + "입니다.\n자세한 문의사항은 고객센터로 문의해주시길 바랍니다.",
									icon: "success",
									buttons : {
										confirm : {
											value : true
										}
									}
								});
							}
						},
						error: function() {
							swal({
								title: "케어핀투어",
								text: "문제가 발생하였습니다.\n잠시 후 다시 시도해주세요.",
								icon: "error",
								timer: 3000
							});
						}
					});
				}
			})
		})
	</script> --%>
</body>
</html>