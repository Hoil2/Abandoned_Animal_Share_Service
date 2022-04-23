<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<%
	//현재시간 구해서 String으로 formating
	LocalDateTime nowTime = LocalDateTime.now();
	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String now = nowTime.format(dateTimeFormatter);   
%>
		<!-- 하단 푸터 -->
		<footer class="site-footer">
			<div class="site-footer__bg" style="background-image: url(<c:url value="/resources/images/backgrounds/footer-bg-1-1.png"/>);"></div>
			<div class="container">
				<div class="row">
					<div class="footer-widget__column footer-widget__about">
						<a href="main" class="footer-widget__logo">
							<img src='<c:url value="/resources/images/bottom_Logo.png"/>' width="100" alt="">
						</a>
						<p>대한민국 최고의 여행사!<br>당신의 여행 지킴이 케어핀투어</p>
						<a href="mailto:ljpk@kyungmin.ac.kr">ljpk@kyungmin.ac.kr</a><br>
						<a href="tel:031-828-7700">031-828-7700</a>
					</div>
					<div class="footer-widget__column">
						<h3 class="footer-widget__title">Company</h3>
						<ul class="footer-widget__links-list list-unstyled">
							<li><a href="javascript:void(0)">사업자등록번호 : 123-45-67890</a></li>
							<li><a href="javascript:void(0)">관광사업자등록번호 : 제2021-123456호</a></li>
							<li><a href="javascript:void(0)">E-mail : ljpk@gmail.com</a></li>
							<li><a href="javascript:void(0)">주소 : 경기도 의정부시 서부로 545 효행관 401호</a></li>
						</ul>
					</div>
					<div class="footer-widget__column footer-widget__links">
						<h3 class="footer-widget__title">Information</h3>
						<ul class="footer-widget__links-list list-unstyled">
							<li><a href="company">회사개요</a></li>
							<li><a href="#" data-toggle="modal" data-target="#privacypolicy">개인정보처리방침</a></li>
							<li><a href="#" data-toggle="modal" data-target="#useservice">이용약관</a></li>
							<li><a href="domestictttac">여행약관</a></li>
							<li><a href="insurance">여행자보험</a></li>
							<li><a href="support">고객센터</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
		<!-- 하단 푸터 -->
		
		<!-- 하단 Copyright -->
		<div class="site-footer__bottom">
			<div class="container">
				<p>Copyright &copy; 2021 CarefinTour ALL rights reserved.</p>
				<div class="site-footer__social">
					<a href="#"><i class="fab fa-facebook-square"></i></a>
					<a href="#"><i class="fab fa-twitter"></i></a>
					<a href="#"><i class="fab fa-instagram"></i></a>
					<a href="#"><i class="fab fa-dribbble"></i></a>
				</div>
			</div>
		</div>
		<!-- 하단 Copyright -->

		<!-- 모바일 하단 푸터-->
		<a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<div class="side-menu__block">
			<div class="side-menu__block-overlay custom-cursor__overlay">
				<div class="cursor"></div>
				<div class="cursor-follower"></div>
			</div>
			<div class="side-menu__block-inner ">
				<div class="side-menu__top justify-content-end">
					<a href="#" class="side-menu__toggler side-menu__close-btn">
						<img src='<c:url value="/resources/images/Logo.png"/>' width="123" alt="">
					</a>
				</div>
				<nav class="mobile-nav__container"></nav>
				<div class="side-menu__sep"></div>
				<div class="side-menu__content">
					<p>대한민국 최고의 여행사!<br>당신의 여행 지킴이 케어핀투어</p>
					<p>
						<a href="mailto:ljpk@kyungmin.ac.kr">ljpk@kyungmin.ac.kr</a><br>
						<a href="tel:031-828-7700">031-828-7700</a>
					</p>
					<div class="side-menu__social">
						<a href="#"><i class="fab fa-facebook-square"></i></a>
						<a href="#"><i class="fab fa-twitter"></i></a>
						<a href="#"><i class="fab fa-instagram"></i></a>
						<a href="#"><i class="fab fa-pinterest-p"></i></a>
					</div>
				</div>
			</div>
		</div>
		<!-- 모바일 하단 푸터 -->
		<div class="search-popup">
			<div class="search-popup__overlay custom-cursor__overlay">
				<div class="cursor"></div>
				<div class="cursor-follower"></div>
			</div>
			<div class="search-popup__inner">
				<form action="travelNameSearch" class="search-popup__form">
					<input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색어를 입력하세요...">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
		
		<!-- Plugin Script -->
		<script src='<c:url value="/resources/js/jquery.min.js"/>'></script>
		<script src='<c:url value="/resources/js/bootstrap.bundle.min.js"/>'></script>
		<script src='<c:url value="/resources/js/owl.carousel.min.js"/>'></script>
		<script src='<c:url value="/resources/js/waypoints.min.js"/>'></script>
		<script src='<c:url value="/resources/js/jquery.counterup.min.js"/>'></script>
		<script src='<c:url value="/resources/js/TweenMax.min.js"/>'></script>
		<script src='<c:url value="/resources/js/wow.js"/>'></script>
		<script src='<c:url value="/resources/js/jquery.magnific-popup.min.js"/>'></script>
		<script src='<c:url value="/resources/js/jquery.ajaxchimp.min.js"/>'></script>
		<script src='<c:url value="/resources/js/swiper.min.js"/>'></script>
		<script src='<c:url value="/resources/js/typed-2.0.11.js"/>'></script>
		<script src='<c:url value="/resources/js/vegas.min.js"/>'></script>
		<script src='<c:url value="/resources/js/jquery.validate.min.js"/>'></script>
		<script src='<c:url value="/resources/js/bootstrap-select.min.js"/>'></script>
		<script src='<c:url value="/resources/js/countdown.min.js"/>'></script>
		<script src='<c:url value="/resources/js/jquery.mCustomScrollbar.concat.min.js"/>'></script>
		<script src='<c:url value="/resources/js/bootstrap-datepicker.min.js"/>'></script>
		<script src='<c:url value="/resources/js/nouislider.min.js"/>'></script>
		<script src='<c:url value="/resources/js/isotope.js"/>'></script>
	
		<!-- Template Script -->
		<script src='<c:url value="/resources/js/theme.js"/>'></script>
		<script src='<c:url value="/resources/js/Member.js"/>'></script>
		
		<!-- 로그인 Modal 부분 -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header border-bottom-0">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-title text-center">
							<h4>Login</h4>
						</div>
						<div class="d-flex flex-column text-center">
							<div class="form-group">
								<input type="text" class="form-control" id="UserID" name="LoginUserID" placeholder="아이디를 입력하세요" required autofocus>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="Password" placeholder="비밀번호를 입력하세요" required>
							</div>
							<input type="hidden" id="lastDate" name="lastDate" value="<%=now%>">
							<button id="Login" class="thm-btn-psd btn-block btn-round">로그인</button>
						</div>
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
							<form name="form" id="form" action="SignUp" method="POST">
								<div class="form-group row">
									<div class="col-sm-9">
										<input type="text" class="form-control" id="RegisterUserID" name="UserID" placeholder="아이디" required autofocus>
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
									<input type="email" class="form-control" id="Email" name="Email" placeholder="이메일" required>
								</div>
								<div class="form-group">
									<input type="tel" class="form-control" id="Phone" name="Phone" maxlength="11" placeholder="-를 제외한 휴대폰 번호" required>
								</div>
								<div class="form-group">
									<input type="date" class="form-control" id="Birth" name="Birth" placeholder="생일" required>
								</div>
								<div class="form-group">
									<select class="form-control" id="Sex">
										<option value="1">남자</option>
										<option value="0">여성</option>
									</select>
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
	<script>	
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
</script>
		<!-- 예약확인 비회원 부분-->
		<div class="modal fade" id="ReservationModal" tabindex="-1" role="dialog" aria-labelledby="reservationModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header border-bottom-0">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-title text-center">
							<h4>비회원 예약확인</h4>
						</div>
						<div class="d-flex flex-column text-center">
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text">아이디　</span>
								</div>
								<input type="email" id="ReservationUserID" name="userId" class="form-control" required>
							</div>
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text">성　　명</span>
								</div>
								<input type="text" id="ReservationName" name="name"  class="form-control" required autofocus>
							</div>
							<div class="input-group my-2 mb-1">
								<div class="input-group-prepend">
									<span class="input-group-text">전화번호</span>
								</div>
								<input type="text" id="ReservationPhone" name="phonenum" class="form-control" required autofocus>
							</div>
							<button type="button" class="thm-btn-psd btn-block btn-round" id="nonMembers" name="nonMembers">조회하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 개인정보처리방침 -->
		<div class="modal fade" id="privacypolicy" tabindex="-1" role="dialog" aria-labelledby="privacypolicy" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document" style="max-width: 50%; width: 50%;">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-title">
							<h4>개인정보처리방침</h4>
						</div>
						<div class="d-flex flex-column text-left">
							<textarea class="form-control" style="resize:none;" rows="30">
(주)케어핀투어(이하 ‘당사’)는 고객님의 개인정보처리방침을 매우 중요시하며, 『정보통신망 이용촉진 및 정보보호"에 관한 법률』상의 개인정보보호 규정 및 행정안전부가 제정한 『개인정보보호법』을 준수하고 있습니다. 당사는 개인정보취급(처리)방침을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. *개인정보의 수집,제공 및 활용에 동의하지 않을 권리가 있으며, 미동의시 회원가입 및 여행서비스의 제공이 제한됩니다.
■ 개인정보의 수집방법 및 항목
당사는 여행 서비스와 회원 서비스 제공을 위해 아래와 같이 필요한 최소한의 개인정보만을 수집합니다.
- 회원가입 시
구분	수집/이용 항목	수집/이용 목적
필수	아이디, 비밀번호, 성명, 성별, 생년월일, 휴대전화번호, 이메일, CI(본인인증 회원), 법정대리인정보(성명, 관계, 연락처)	이용자 식별, 회원 서비스 제공, 본인인증, 만 14세 미만 회원가입 시 확인, 멤버십 혜택 및 각족 이벤트 정보 안내, 상품수령
선택	영문이름, 결혼여부, 결혼기념일, 환불 시 계좌번호, 자택주소
- 여행상품 예약 시
수집/이용 항목	수집/이용 목적
성명(국문/영문), 생년월일, 성별, 여권번호, 여권만료일, 여권발급일, 비자소지여부, 이 메일, 연락처, 주소	여행상품 예약 및 상담, 출국가능여부 파악, 경품배송, 만족도조사
성명, 생년월일, 성별, 여권번호	여행자보험 가입
성명, 신용카드번호, 유효기간, 계약자와의관계, 계좌번호	대금결제, 정산, 환불
성명, 생년월일, 성별, 연락처, 회원번호	마일리지 서비스 제공 및 회원확인
■ 개인정보 수집방법
당사에서 운영하는 홈페이지(www.modetour.com)와 전화, 팩스등과 당사 상품을 판매하는 대리점에서 홈페이지회원, 여행회원, 투어마일리지(상담)신청서, 상품예약(구매) 및 그 외 본인 확인, 제휴사로부터의 당사제공 등의 방법으로 개인정보를 수집합니다.
■ 개인정보의 수집 및 이용목적
당사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
1. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
-여행상품 예약, 여행자보험 가입, 항공권/호텔의 예약, 예약내역의 확인 및 상담, 컨텐츠 제공, 투어마일리지 적립, 조회, 사용 및 이에 관한 안내, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 본인인증 및 금융서비스, 구매 및 요금결제, 환불, 출국가능여부파악, 회원카드발급, 회원우대 등
2.고객 관리
- 고객관리 및 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 이용 및 이용횟수 제한, 연령확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 분쟁조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등
3. 신규서비스 및 마케팅,광고에 활용
- 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 이벤트, 신상품 등 광고성 정보 전달 및 참여기회제공, 접속 빈도 파악, 서비스 이용에 대한 통계, 신규 및 제휴 비지니스 관련 서비스제공 및 각종 마케팅 활동등   위 정보는 가입 당시 정보만 아니라 정보 수정으로 변경된 정보를 포함 합니다.
■개인정보의 이용, 보유기간 및 파기
당사는 고객님의 개인정보를 다음과 같이 수집목적 또는 제공받은 목적이 달성되거나 고객이 표명한 절차에 따라 탈퇴를 요청하거나 표명된 회원자격상실 사유에 의해 고객님의 자격을 제한 및 정지시키는 경우에는 해당 개인의 정보는 재생할 수 없는 기술적 방법을 통해 삭제되며, 어떠한 용도로도 열람 또는 이용할 수 없도록 파기됩니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원 정보를 보관 합니다.
가. 계약 또는 청약철회 등에 관한 기록: 5년 (전자상거래등에서의 소비자보호에 관한 법률)
나. 대금결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래등에서의 소비자보호에 관한 법률)
다. 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 (전자상거래등에서의 소비자보호에 관한 법률)
라. 표시•광고에 관한 기록: 6개월
▶ 파기방법 :
- 종이에 출력된 개인정보: 분쇄기를 이용하여 분쇄
- 전자적파일형태로 저장된 개인정보: 개인정보는 남기지 않으며, 기록을 재생할수 없는 방법을 통하여 기록삭제
■ 개인정보 제공 및 공유
1. 당사는 고객님의 동의가 있거나 관련 법령의 규정에 의한 경우를 제외하고 어떠한 경우에도 ‘개인정보의 수집 및 이용목적’ 에서 고지한 범위를 넘어 서비스와 무관한 타 기업/기관에 제공하거나 이용하지 않습니다. 단, 고객님의 개인정보를 제공 및 공유하는 경우는 다음과 같습니다.
제공대상	제공하는 항목	제공받는 자의 이용목적
대한항공, 아시아나항공 외 기타 항공사, 크루즈 및 기타 해운업체, 호텔 및 기타 숙박업체, 기타 현지 랜드업체
[전체보기]	성명(영문이름포함), 생년월일, 성별, 여권/비자 유무 및 관련 정보(여권만료일, 여권번호 등), 핸드폰번호, 투어마일리지정보, 회원종류	항공권 및 기타운송업체 탑승예약, 숙박예약, 현지 행사 진행 및 고객관리 목적, 서비스 제공, 구매 및 요금 결제, 개인 식별, 불만처리 등 민원처리, 고지사항 전달,마일리지적립/전환,사용확인, 회원할인등
Rail Europe 외 기타 철도업체
[전체보기]	성명(영문이름포함), 여권/비자 유무 및 관련 정보(여권만료일, 여권번호 등)
기타 현지 렌터카 업체
[전체보기]	성명, 자택전화번호, 휴대전화번호, 생년월일, 성별
모두투어 대리점,자회사 및 제휴사[전체보기]	성명(영문이름포함), 생년월일,성별, 여권/비자 유무 및 관련 정보(여권만료일, 여권번호 등), 연락처, 이메일, 마일리지정보, 회원종류	여행상담 및 예약확인, 일반 및 제휴 서비스 제공, 구매 및 요금 결제,마일리지적립/전환,사용확인,제휴서비스이용안내,이벤트 안내등
DB손해보험, 한화손해보험, 에이스보험	성명(영문이름포함), 생년월일, 여권번호, 연락처	서비스 제공, 구매 및 요금 결제, 개인 식별, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달
삼성카드, 롯데카드, 외환카드 외 제휴신용카드사, 제휴은행 및 기타 송신 관련 업체
[전체보기]	이름, 생년월일, 성별, 연락처, 이메일, 카드번호	요금납부/정산, 제휴서비스 이용안내/권유, 마일리지 적립, 전환, 사용, 확인, 회원할인 및 기타 연계서비스 제공
㈜홈플러스,하나카드	성명, 생년월일, 성별, 연락처, 마일리지 정보, 회원종류, 이메일주소	홈플러스 FMC포인트등 기타 포인트 적립, 전환, 사용, 확인, 회원할인 및 기타 포인트관련 서비스 제공
SK플래닛, ㈜엠콤, ㈜얍컴퍼니	성명, 생년월일, 성별, 핸드폰번호, 멤버십 회원번호, 마일리지 정보	모바일 멤버십관련 서비스
㈜인터내셔날에스오에스코리아	영문이름,성별,항공사 예약번호, 티켓번호, 여정	고객의 체류정보 확인 및 응급상항 대처
● 정보 보유 및 이용 기간 : 이용목적에 따른 개인정보 제공시, 이용목적 달성시 및 관계법령에 따른 보관기간까지 (제휴업체에는 제휴계약 종료시 까지)
2. 영업의 양수 등 영업의 전부 또는 일부를 양도하거나, 합병ㆍ상속 등으로 서비스 제공자의 권리ㆍ의무를 이전 승계하는 경우 개인정보보호 관련 고객의 권리를 보장하기 위하여 반드시 그 사실을 고객님에게 통지합니다. 이외에는 아래의 경우에 준합니다.
- 형사소송법, 금융실명거래 및 비밀보장에 관한 법률, 신용정보의 이용 및 보호에 관한 법률, 지방세법, 소비자보호법, 한국은행법, 등 관계법령에 의하여 수사상의 목적으로 관계기관으로부터 요구가 있는 경우
- 통계작성 학술연구나 시장조사를 위하여 특정 개인을 식별할 수 없는 형태로 광고주, 협력사나 연구단체 등에 제공하는 경우
- 문화관광부 인증 우수상품에 관한 해당 관련기관의 요청이 있는 경우
- 서비스 제공에 따른 요금정산을 위하여 필요한 경우
3. 고객님의 개인정보는 원활한 상담 진행 및 맞춤 여행상품 안내를 위한 정보제공 목적으로 아래와 같이 활용될 수 있습니다.
- 당사는 고객님의 원활한 여행서비스를 위해 파트너 여행사와 상담센터를 운영하고 있으며 제휴사와 업무를 진행하고 고객님의 여행상품 상담과 진행에 관련하여 개인정보(성명, 연락처, 생일, 성별) 및 상품이용정보를 당사에서 제공한 관리시스템을 통해 당사와 계약된 협력사 및 대리점에서 제한적으로 열람할 수 있도록 하고 있습니다.
- 당사의 여행상품 및 여행관련 서비스를 이용한 고객님에게 한정하여 기획여행상품이나 다양한 서비스를 홍보하고 안내 드리기 위하여 개인정보 제공 및 공유에 동의한 고객님에게 맞춤 서비스를 제공할 수 있습니다.
■ 개인정보 취급위탁에 관한 사항
당사는 고객의 편안한 여행업무를 지원하기 위하여 물품배송관련 전문업체에 위탁 처리하고 있습니다. 당사는 위탁업체에 업무처리를 위해 필요한 고객님의 기본 개인정보와 여행정보를 열람할 수 있게 하며 개인정보 보호의 안전을 기하기 위하여 위탁계약 종료 시까지 서비스 제공자의 개인정보 취급관련 지시엄수, 개인정보에 관한 비밀유지, 제3자 제공의 금지 및 사고시의 책임부담 등을 명확히 규정하고 당해 계약내용을 서면 및 전자적으로 보관하고 있습니다. 현재 위탁업체와 위탁업무는 다음과 같습니다.
위탁대상자(수탁자)	위탁내용 및 목적	위탁기간
지메카, 디엔케이플래닝, 에스앤피, 원폴라리스, 즐거운, ㈜명문기획	물품배송물품(경품)배송, 기프티콘 등 발송	계약시작일로부터
계약종료일까지
SK플래닛, 슈어엠주식회사	광고성 메시지 발송업무 대행	계약시작일로부터
계약종료일까지
중국씬싱항공, 동원여행개발, 마이비자코리아	비자발급 대행	계약시작일로부터
계약종료일까지
서울신용평가정보, 한국모바일인증	본인인증 확인	계약시작일로부터
계약종료일까지
이니시스	신용카드 결제승인, 은행자동납부 인출업무 중계, 은행계좌인증	계약시작일로부터
계약종료일까지
■ 개인정보의 열람, 정정, 동의 철회
당사의 고객님 개인정보 열람 및 정정을 위해서는 홈페이지의 마이페이지내 회원정보 수정을 클릭하여 열람 또는 정정하실 수 있습니다. 당사는 개인정보에 대한 열람증명 또는 정정을 요구하는 경우 성실하게 대응합니다.
개인정보 열람/삭제 요청서(다운로드)
■ 만14세 미만이용자 및 법정대리인의 권리와 그 행사 방법
만14세 미만 아동의 경우 (법정대리인 포함)는 언제든지 개인정보에 대한 열람, 정정을 요구하시거나 개인정보의 수집과 이용, 위탁 또는 제공에 대한 동의를 철회 하실 수 있습니다.
■ 미성년자의 거래에 관한 계약 체결 및 취소
당사는 미성년자와 재화 등의 거래에 관한 계약을 체결하고자 하는 경우에는 법정 대리인이 그 계약에 대해서 동의를 하지 아니하면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있습니다.
■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
당사는 고객님의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 당사의 웹사이트를 운영하는데 이용되는 서버가 고객님의 브라우저에 보내는 아주 작은 텍스트 파일로서 고객님의 컴퓨터 하드디스크에 저장됩니다.
당사는 다음과 같은 목적을 위해 쿠키를 사용합니다.
▶ 쿠키 등 사용 목적
고객님과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
고객님은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 고객님은 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
▶ 쿠키 설정 거부 방법
예: 쿠키 설정을 거부하는 방법으로는 고객님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
설정방법 예(인터넷 익스플로어의 경우):
웹 브라우저 상단의 도구 >인터넷 옵션 >개인정보
단, 고객님께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.
■ 개인정보보호를 위한 기술 및 관리대책
가. 기술적 대책
- 고객님의 개인정보는 비밀번호에 의해 보호되며 파일 및 전송데이터를 암호화 하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.
- 당사는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.
- 당사는 암호알고리즘을 이용하여 네트워크상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL 또는 SET)를 채택하고 있습니다.
- 해킹 등 외부침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석시스템 등을 이용하여 보안에 만전을 기하고 있습니다.
나. 관리적 대책
당사는 회원님의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다
- 이용자를 직접 상대로 하여 마케팅 업무를 수행하는 자
- 개인정보관리책임자 및 담당자 등 개인정보관리업무를 수행하는 자
- 기타 업무상 개인정보의 취급이 불가피한 자
- 개인정보를 취급하는 직원을 대상으로 새로운 보안 기술 습득 및 개인정보 보호 의무 등에 관해 정기적인 사내 교육 및 외부 위탁교육을 실시하고 있습니다.
- 입사시 전 직원의 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보처리방침에 대한 이행사항 및 직원의 준수여부를 감사하기 위한 내부절차를 마련하고 있습니다.
- 개인정보 관련 취급자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확화하고 있습니다.
- 개인정보와 일반 데이터를 혼합하여 보관하지 않고 별도의 서버를 통해 분리하여 보관하고 있습니다.
- 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다.
- 당사는 이용자 고객님의 실수나 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다. 고객님 개개인이 본인의 개인정보를 보호하기 위해서 자신의 ID 와 비밀번호를 적절하게 관리하고 여기에 대한 책임을 져야 합니다.
- 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될 경우 당사는 즉각 고객님께 사실을 알리고 적절한 대책과 보상을 강구할 것입니다.
■ 개인정보에 관한 민원서비스
당사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.
개인정보 보호책임자	개인정보 관련 문의
소속: 홍보마케팅부
직위: 부서장
성명: 육현우
전 화: 1544-5252
이메일: sixx@modetour.com	부서명: 고객센터
전 화: 1544-5252
FAX: 02-2021-7800
고객님께서는 당사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 당사는 고객님들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다
그 외 개인정보에 관한 상담이 필요한 경우에는 한국정보보호진흥원(KISA)에서 운영하는 개인정보 침해신고센터 (전화 : 118)으로 문의하실 수 있습니다.
개인정보에 관련한 상담은 개인정보 침해신고센터, 개인정보 분쟁조정위원회, 대검찰청 사이버수사과, 경찰청 사이버안전국 등으로 문의하실 수 있습니다.
○ 개인정보 침해신고센터(한국인터넷 진흥원 운영)
- 전화 : (국번없이)118
- URL : http://privacy.kisa.or.kr
○ 개인정보 분쟁조정위원회(개인정보보호위원회 운영)
- 전화 : 02-1833-6972
- URL : http://www.kopico.go.kr
○ 대검찰청 사이버수사과
- 전화 : (국번없이)1301
- URL : http://www.spo.go.kr
○ 경찰청 사이버안전국
- 전화 : (국번없이)182
- URL : http://cyberbureau.police.go.kr
■ 고지의 의무
당사는 개인정보처리방침을 개정하는 경우 웹사이트 ‘공지사항’을 통해 고지하겠습니다
공고일자 : 2020년 11월 11일
시행일자 : 2008년 05월 27일
	 						</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 이용약관 -->
		
		<!-- 이용약관 -->
		<div class="modal fade" id="useservice" tabindex="-1" role="dialog" aria-labelledby="userservice" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document" style="max-width: 50%; width: 50%;">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-title">
							<h4>이용약관</h4>
						</div>
						<div class="d-flex flex-column text-left">
							<textarea class="form-control" style="resize:none;" rows="30">
제1장 총칙
제1조(목적)
이 약관은 (주)케어핀투어가 운영하는 모두투어 닷컴 사이버 몰(이하 "당사"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.
※「PC통신, 모바일 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
제2조(정의)
① "당사"란 (주)모두투어네트워크가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다.
② "이용자"란 "당사"홈페이지에 접속하여 이 약관에 따라 "당사"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ "회원"이라 함은 "당사"에 개인정보를 제공하여 회원등록을 한 자로서, "당사"의 정보를 지속적으로 제공받으며, "당사"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④ "비회원"이라 함은 회원에 가입하지 않고 "당사"가 제공하는 서비스를 이용하는 자를 말합니다.
제3조(약관의 명시와 개정)
① "당사"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지, 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 “당사” 홈페이지의 초기 서비스화면(전면)에 게시합니다. 다만 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② "당사"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회•배송책임•환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ "당사"는 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에 관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다
④ "당사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 “당사”홈페이지의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이전의 유예기간을 두고 공지합니다. 이 경우 "당사"는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ "당사"가 약관을 개정할 경우에는 그 개정약관은 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정 약관의 공지기간 내에 "당사"에 송신하여 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 정부가 제정한 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상 관례에 따릅니다.
제4조(서비스의 제공 및 변경)
① "당사"는 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역 등에 대한 정보 제공 및 계약의 체결
2. 계약이 체결된 재화 또는 용역 등의 배송
3. 기타 "당사"가 정하는 업무
② "당사"는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
⑤ "당사"가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
⑥ 전항의 경우 "당사"는 이로 인하여 이용자가 입은 인과관계가 입증된 실제 손해를 배상합니다. 다만, "당사"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
제5조(서비스의 중단)
① "당사"는 컴퓨터 등 정보통신설비의 보수 점검•교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② "당사"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 "당사"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
③ 사업종목의 전환, 사업의 포기, 업체간 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "당사”는 제8조에 정한 방법으로 이용자에게 통지하고 당초 "당사"에서 제시한 조건에 따라 소비자에게 보상합니다.
제6조(회원가입)
① 이용자는 "당사"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② "당사"는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "당사"의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 "당사"의 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입의 성립시기는 "당사"의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 제 16조 제 1항에 의한 등록사항에 변경이 있는 경우,즉시 전자우편 및 기타 방법으로 “당사”에 그 변경사항을 알려야 합니다.
제7조(회원 탈퇴 및 자격 상실 등)
① 회원은 "당사"에 언제든지 탈퇴를 요청할 수 있으며 "당사"는 즉시 회원 탈퇴를 처리합니다.
② 회원이 다음 각 호의 사유에 해당하는 경우, "당사"는 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청 시에 허위 내용을 등록한 경우
2. "당사"를 이용하여 구입한 재화 등의 대금, 기타 "당사"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 "당사" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래질서를 위협하는 경우
4. "당사"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
5. 기타 다음과 같은 행위 등으로 "당사"의 건전한 운영을 해하거나 "당사"의 업무를 방해하는 경우
가. "당사"의 운영에 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 "당사"의 명예를 실추시키고 "당사"의 신뢰성을 해하는 경우
나. "당사"의 운영과정에서 직원에게 폭언 또는 음란한 언행을 하여 업무환경을 심각히 해하는 경우
다. "당사"의 운영과정에서 이유 없는 잦은 연락이나 소란 또는 협박, 인과관계가 입증되지 않는 피해에 대한보상(적립금, 현금, 상품)요구 등으로 업무를 방해하는 경우
라. "당사"를 통해 구입한 상품 또는 용역에 특별한 하자가 없는데도 불구하고 일부 사용 후 상습적인 취소•전부 또는 일부 반품 등으로 회사의 업무를 방해하는 경우. 단, 당해 회원의 취소 반품비율이 회사의 평균 취소 반품율보다 50%이상 높을 경우에는 상습적인 것으로 인정될 수 있습니다
③ "당사"가 회원 자격을 제한•정지 시킨 후 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "당사"는 회원자격을 상실시킬 수 있습니다.
⑤ "당사"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
제8조(회원에 대한 통지)
① "당사"가 회원에 대한 통지를 하는 경우, 회원이 "당사"와 미리 약정한 전자우편 주소로 할 수 있습니다.
② "당사"는 불특정다수 회원에 대한 통지의 경우 1주일이상 "당사" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
제9조(구매신청)
"당사" 이용자는 "당사"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "당사"는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호내지 제4호의 적용을 제외할 수 있습니다.
1. 재화 등의 검색 및 선택
2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호)등의 입력
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료, 설치비 등의 비용 부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 제3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화 등의 구매신청 및 이에 관한 확인 또는 "당사"의 확인에 대한 동의
6. 결제방법의 선택
제10조(계약의 성립)
① "당사"는 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
1. 신청내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 "당사" 기술상 현저히 지장이 있다고 판단하는 경우
4. 신용카드 결제 시 소유주의 동의를 얻지 않는 불법행위로 추정 또는 확인되었을 경우
5. 구매 신청 고객이 제 7조에 따른 회원 자격 제한 •정지 고객임이 확인되었을 경우
② "당사"의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
③ "당사"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보를 포함하여야 합니다.
제11조(대금지급방법)
"당사"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단,"당사"는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
1. 온라인무통장입금
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 당사 내사방문후 대금지급
4. 모두투어 여행상품권에 의한 결제
제12조(수신확인통지•구매신청 변경 및 취소)
① "당사"는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 "당사"는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.
제13조(재화 등의 공급)
① "당사"는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "당사"가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 "당사"는 이용자가 재화 등의 공급 절차 및 진행사항을 확인할 수 있도록 적절한 조치를 합니다. 여행상품과 같은 무형의 재화 공급은 해당 상품에 적용되는 별도의 약관을 교부하고 해당 서비스가 차질 없이 진행되도록 일련의 조치를 하여야 합니다.
② "당사"는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "당사"가 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만, "당사"가 고의•과실이 없음을 입증한 경우에는 그러하지 아니합니다. 여행상품과 같은 무형의 재화 공급은 예약한 상품에 대한 별도의 여행자 계약서 등을 교부하여 이용자가 상기 상품의 구매와 이용에 대해 숙지할 수 있도록 하여야 합니다.
제14조(환급)
"당사"는 이용자가 구매신청 한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. 다만, 여행상품의 경우 상품의 특성 상 이용자가 출발일 전 모든 예약이 완료된 이후 계약을 해지할 경우 국내(외) 여행표준약관 및 국내(외) 소비자 피해보상규정에 의거 손해 배상액을 공제하고 환불하며, 기타 상품의 상품이용 계약체결 시 계약한 특별약관 등의 규정에 의거한 상품의 취소 및 환불 수수료를 공제 후 환불합니다.
제15조(청약철회 등)
① "당사"와 재화 등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 여행상품의 경우 국내(외) 여행표준약관에 의한 환급기준에 따라 별도의 취소수수료가 부과될 수 있습니다.
② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 경우에는 청약철회 및 교환을 할 수 없습니다.
1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우
(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 사전에 청약철회 제한에 관해 고지하지 않은 한 청약철회 등을 할 수 있습니다.)
2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
③ 제2항 제2호 내지 제4호의 경우에 "당사"가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급 받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
제16조(청약철회 등의 효과)
① "당사"는 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급 받은 재화 등의 대금을 환급합니다. 이 경우 "당사"이 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
② "당사"는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
③ 청약철회 등의 경우 공급 받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다.
③ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 "당사"는 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
제17조(개인정보취급방침)
개인정보보호에 관한 사항은 몰에 게시된 당사의 개인정보보호정책에 규정된 내용에 따릅니다.
제18조("당사"의 의무)
① "당사"는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고 안정적으로 재화•용역을 제공하는 데 최선을 다하여야 합니다.
② "당사"는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안시스템을 갖추어야 합니다.
③ "당사"가 상품이나 용역에 대하여 「표시•광고의공정화에관한법률」제3조 소정의 부당한 표시•광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
제19조(회원의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.
④ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "당사"에 통보하고 "당사"의 안내가 있는 경우에는 그에 따라야 합니다.
제20조(이용자의 의무)
이용자는 다음 행위를 하여서는 안 됩니다.
1. 신청 또는 변경 시 허위내용의 등록
2. 타인의 정보 도용
3. "당사"에 게시된 정보의 변경
4. "당사”가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
5. "당사" 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. "당사" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지•화상•음성•기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
제21조(연결 "당사"과 피연결 "당사" 간의 관계)
① 상위 "당사"과 하위 "당사"이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨 ) 방식 등으로 연결된 경우, 전자를 연결 "당사"(웹사이트)이라고 하고 후자를 피연결 "당사"(웹사이트)라고 합니다.
② 연결 "당사"는 피연결 "당사"가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 피연결 "당사"의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.
제22조(저작권의 귀속 및 이용제한)
① "당사"가 작성한 저작물에 대한 저작권, 기타 지적재산권은 "당사"에 귀속합니다.
② 이용자는 "당사"를 이용함으로써 얻은 정보 중 "당사"에게 지적재산권이 귀속된 정보를 "당사"의 사전승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
③ "당사"는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
④ 이용자는 “당사”가 제공하는 각종 서비스 등을 이용하는 과정에서 “당사”에 게시 또는 등록한 각종 저작물을 “당사”가 무상으로 사용하는 것을 허락하며, 이는 이용자가 회원을 탈퇴한 경우에도 유효합니다. 단, 이용자가 “당사”에 대해 상기 사용권의 허락을 취소하는 통지를 한 경우에는 그러하지 아니합니다.
제23조(회원의 게시물 및 저작권)
① 게시물이라 함은 회원이 서비스를 이용하면서 게시한 글, 사진, 각종 파일과 링크 등을 말합니다.
③ 회원의 게시물에 의한 손해나 기타 문제가 발생하는 경우, 회원은 이에 대한 책임을 지게 되며, “당사”는 책임을 지지 않습니다.
③ “당사”는 다음 각 호에 해당하는 게시물 등을 회원의 사전 동의 없이 임의 게시, 중단, 수정, 삭제, 이동 또는 등록 거부 등의 관련 조치를 할 수 있습니다.
- 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
- 불법복제 또는 해킹을 조장하는 내용인 경우
- 제 3자의 저작권을 침해하여 게시중단 요청을 받은 경우
- 영리를 목적으로 하는 광고일 경우
- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
- 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
- 사적인 정치적 판단이나 종교적 견해의 내용으로 회사가 서비스 성격에 부합하지 않는다고 판단하는 경우
- 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
- 기타 관계법령에 위배된다고 판단되는 경우
④ 회원이 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, “당사”는 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 회원의 게시물을 사용할 수 있습니다.
④ “당사”는 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다.
⑥ 회원이 이용계약 해지를 한 경우 타인에 의해 보관, 담기 등으로 재게시 되거나 복제된 게시물과 타인의 게시물과 결합되어 제공되는 게시물, 공용 게시판에 등록된 게시물 등은 삭제되지 않습니다.
제24조(분쟁해결)
① "당사"는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치•운영합니다.
② "당사"는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
③ "당사"와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
제25조(재판권 및 준거법)
① "당사"와 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 “당사”가 소재하는 법원의 전속관할로 합니다.
② "당사"와 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
제26조(특별규정)
① 당 약관에 명시되지 않은 사항은 전자거래기본법, 전자서명법, 전자성거래 등에서의 소비자보호에 관한 법률, 기타 관련법령의 규정 및 국내(외) 여행표준약관 등에 의합니다.
[부칙]
1. 본 약관은 2012년 5월 4일부터 적용됩니다.
2. 2008년 2월 20일부터 시행된 종전의 약관은 본 약관으로 대체합니다.
	 						</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 이용 약관 -->