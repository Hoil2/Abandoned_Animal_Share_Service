<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 회원가입 Modal 부분 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>Sign in</h4>
					</div>
					<div class="d-flex flex-column text-center">
						<form name="form" id="form" action="/signUp" method="POST">
							<div class="form-group row">
								<div class="col-sm-9">
									<input type="text" class="form-control" id="Email" name="Email" placeholder="이메일" required autofocus>
								</div>
								<div class="col-sm-3">
									<button type="button" id="IDCheck" class="thm-btn-psd2">중복확인</button>
								</div>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="RegisterPassword" name="Password" placeholder="비밀번호" required>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="Name" name="Name" placeholder="이름" required>
							</div>
							<div class="form-group">
								<input type="tel" class="form-control" id="Phone" name="Phone" maxlength="11" placeholder="-를 제외한 휴대폰 번호" required>
							</div>
							<div class="form-group row">
								<div class="col-sm-9">
									<input type="text" id="Address" name="Address" class="form-control" placeholder="주소" required readonly>
								</div>
								<div class="col-sm-3">
									<button type="button" class="thm-btn-psd2" onclick="goPopup()">주소찾기</button>
								</div>
							</div>
							<input type="hidden" id="Grade" name="Grade" value="User">
							<input type="hidden" id="Mileage" name="Mileage" value="1000">
							<!-- 마일리지 적립 -->
							<input type="hidden" id="MileageType" name="Type" value="회원가입">
							<input type="hidden" id="MileageContent" name="Content" value="가입 축하">
							<input type="hidden" id="MileageSaving" name="Saving" value="1000">
							<button type="button" id="register" class="thm-btn-psd btn-block btn-round" onclick="Register()" disabled>회원가입</button>
							<button type="reset" id="registerReset" class="thm-btn-psd btn-block btn-round">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>