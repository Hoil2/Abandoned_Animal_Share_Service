/* 로그인 스크립트 */
$(document).ready(function() {
	$('#Login').click(function() {
		var param = {'UserID':$("#UserID").val(), 'Password': $("#Password").val(), 'lastDate': $("#lastDate").val()};
		$.ajax({
			url: "Login",
			type: "POST",
			data: param,
			success: function(data) {
				if (data != 1) {
					swal({
						title: "로그인",
						text: "아이디 또는 비밀번호가 잘못되었습니다.",
						icon: "error",
						timer: 3000
					});
				}
				else {
					swal({
						title: "로그인",
						text: "환영합니다 " + $("#UserID").val() + "님",
						icon: "success",
						buttons : {
							confirm : {
								value : true
							}
						}
					}).then((result) => {
						if(result) {
							location.reload();
						}
					});
				}
			},
			error: function() {
				swal({
					title: "로그인",
					text: "문제가 발생하였습니다.\n잠시 후 다시 시도해주세요.",
					icon: "error",
					timer: 3000
				});
			}
		});
	})
})

/* 회원가입 아이디 중복확인 */
$(document).ready(function() {
	$('#IDCheck').click(function() {
		var param = {'UserID':$("#RegisterUserID").val()};
		if ($("#RegisterUserID").val() == "") {
			swal({
				title: "중복확인",
				text: "아이디를 입력해주세요.",
				icon: "info",
				timer: 3000
			});
		}
		else if(!/^[a-z0-9]{6,12}$/.test($("#RegisterUserID").val())) {
			swal({
				title: "회원가입",
				text: "아이디는 영소문자, 숫자 6~12자리로 입력해주세요.",
				icon: "warning",
				timer: 3000
			});
			return false;
		}
		else {
			$.ajax({
				url: "IDCheck",
				type: "POST",
				data: param,
				success: function(data) {
					if (data != 1) {
						swal({
							title: "중복확인",
							text: "이미 사용중인 아이디입니다.",
							icon: "error",
							timer: 3000
						});
					}
					else {
						swal({
							title: "중복확인",
							text: "사용할 수 있는 아이디입니다.",
							icon: "success",
							buttons : {
								confirm : {
									value : true
								}
							}
						});
						$Register_Button = $('#register').attr('disabled', false);
						$IDCheck_Button = $('#IDCheck').attr('disabled', true);
						$Register_UserID = $('#RegisterUserID').prop('readonly', true);
					}
				},
				error: function() {
					swal({
						title: "오류",
						text: "오류가 발생하였습니다.\n잠시 후 다시 시도해주세요.",
						icon: "error",
						timer: 3000
					});
				}
			});
		}
	})
})

/* 회원가입 유효성 검사 */
function Register() {
	var UserID = $("#RegisterUserID").val();
	var Password = $("#RegisterPassword").val();
	var Name = $("#Name").val();
	var Email = $("#Email").val();
	var Phone = $("#Phone").val();
	var Birth = $("#Birth").val();
	var Address = $("#Address").val();
	var PasswordCheck1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(Password);			//영문, 숫자
	var PasswordCheck2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(Password);	//영문, 특수문자
	var PasswordCheck3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,20}$/.test(Password);		//특수문자, 숫자
	
	if(!UserID) {
		swal({
			title: "회원가입",
			text: "아이디가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Password) {
		swal({
			title: "회원가입",
			text: "비밀번호가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!(PasswordCheck1 || PasswordCheck2 || PasswordCheck3)) {
		swal({
			title: "비밀번호 확인",
			text: "사용할 수 없는 비밀번호입니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(/(\w)\1\1/.test(Password)) {
		swal({
			title: "비밀번호 확인",
			text: "같은 문자를 3회 이상 사용하실 수 없습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(Password.search(UserID)>-1) {
		swal({
			title: "비밀번호 확인",
			text: "비밀번호에 아이디가 포함되어 있습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(!Name) {
		swal({
			title: "회원가입",
			text: "이름이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Email) {
		swal({
			title: "회원가입",
			text: "이메일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Phone) {
		swal({
			title: "회원가입",
			text: "휴대폰 번호가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Birth) {
		swal({
			title: "회원가입",
			text: "생년월일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Address) {
		swal({
			title: "회원가입",
			text: "주소가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	$( "#form" ).submit();
}

/* 회원가입 유효성 검사 */
function adminsubmit() {
	var UserID = $("#UserID").val();
	var Password = $("#Password").val();
	var Name = $("#Name").val();
	var Email = $("#Email").val();
	var Phone = $("#Phone").val();
	var Birth = $("#Birth").val();
	var Address = $("#Address").val();
	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(Password);			//영문, 숫자
	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(Password);	//영문, 특수문자
	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,20}$/.test(Password);		//특수문자, 숫자
	
	if(!UserID) {
		swal({
			title: "회원가입",
			text: "아이디가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Password) {
		swal({
			title: "회원가입",
			text: "비밀번호가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!(check1 || check2 || check3)) {
		swal({
			title: "비밀번호 확인",
			text: "사용할 수 없는 비밀번호입니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(/(\w)\1\1/.test(Password)) {
		swal({
			title: "비밀번호 확인",
			text: "같은 문자를 3회 이상 사용하실 수 없습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(Password.search(UserID)>-1) {
		swal({
			title: "비밀번호 확인",
			text: "비밀번호에 아이디가 포함되어 있습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(!Name) {
		swal({
			title: "회원가입",
			text: "이름이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Email) {
		swal({
			title: "회원가입",
			text: "이메일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Phone) {
		swal({
			title: "회원가입",
			text: "휴대폰 번호가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Birth) {
		swal({
			title: "회원가입",
			text: "생년월일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Address) {
		swal({
			title: "회원가입",
			text: "주소가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	$( "#form" ).submit();
}

/* 휴대폰 번호 입력 */
$(document).ready(function() {
	$("#Phone").keyup(function() {
	    var inputVal = $(this).val();
	    $(this).val(inputVal.replace(/[^0-9]/gi,''));
	});
	$("#MyInfoPhone").keyup(function() {
	    var inputVal = $(this).val();
	    $(this).val(inputVal.replace(/[^0-9]/gi,''));
	});
})

/* 회원가입 취소 버튼 */
$(document).ready(function() {
	$('#registerReset').click(function() {
		$Register_Button = $('#register').attr('disabled', true);
		$IDCheck_Button = $('#IDCheck').attr('disabled', false);
		$Register_UserID = $('#RegisterUserID').prop('readonly', false);
	})
})

/* 회원가입 주소 찾기(도로명주소API) */
function goPopup() {
	window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr) {
	document.form.Address.value = roadFullAddr;
}

/* 마이페이지 주소 찾기(도로명주소API) */
function goPopup2() {
	window.open("jusoPopup2","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack2(roadFullAddr) {
	document.MyPageUpdate.Address.value = roadFullAddr;
}

/* 마이페이지 내 정보 수정 유효성 검사 */
function MyInfoUpdate() {
	var UserID = $("#MyInfoUserID").val();
	var Password = $("#MyInfoPassword").val();
	var Email = $("#MyInfoEmail").val();
	var Phone = $("#MyInfoPhone").val();
	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(Password);			//영문, 숫자
	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(Password);	//영문, 특수문자
	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,20}$/.test(Password);		//특수문자, 숫자
	
	if(!Password) {
		swal({
			title: "내 정보",
			text: "비밀번호가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!(check1 || check2 || check3)) {
		swal({
			title: "내 정보",
			text: "사용할 수 없는 비밀번호입니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(/(\w)\1\1/.test(Password)) {
		swal({
			title: "내 정보",
			text: "같은 문자를 3회 이상 사용하실 수 없습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(Password.search(UserID)>-1) {
		swal({
			title: "내 정보",
			text: "비밀번호에 아이디가 포함되어 있습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(!Email) {
		swal({
			title: "내 정보",
			text: "이메일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Phone) {
		swal({
			title: "내 정보",
			text: "내3용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		Swal.fire({
			title: '내 정보',
			text: "정말 수정하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				swal({
					title: '내 정보',
					text: "정보가 성공적으로 업데이트 되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#MyPageUpdate").submit();
					}
				});
			}
		})
	}
}

/* 회원 탈퇴 */
$(document).ready(function() {
	$('#btnWithdrawal').click(function() {
		var Password = $("#WithdrawalPassword").val();
		
		if($("#agree").is(":checked") == false) {
			swal({
				title: "회원 탈퇴",
				text: "안내 내용에 동의하지 않았습니다.",
				icon: "warning",
				timer: 3000
			});
			return;
		}
		else if(!Password) {
			swal({
				title: "회원 탈퇴",
				text: "비밀번호가 입력되지 않았습니다." + " : " + Password,
				icon: "warning",
				timer: 3000
			});
			return;
		}
		else {
			$.ajax({
				url : "MyPagePassChk",
				type : "POST",
				dataType : "json",
				data : $("#MemberWithdrawal").serializeArray(),
				success: function(data) {
					if(data == 0) {
						swal({
							title: "회원 탈퇴",
							text: "비밀번호가 올바르지 않습니다.",
							icon: "warning",
							timer: 3000
						});
						return;
					}
					else {
						Swal.fire({
							title: '회원 탈퇴',
							text: "정말 탈퇴하시겠습니까?",
							icon: 'error',
							showCancelButton: true,
							confirmButtonColor: '#3085d6',
							cancelButtonColor: '#d33',
							confirmButtonText: '확인',
							cancelButtonText: '취소'
						}).then((result) => {
							if (result.isConfirmed) {
								swal({
									title: '회원 탈퇴',
									text: "성공적으로 탈퇴되었습니다.",
									icon: "success",
									buttons : {
										confirm : {
											value : true
										}
									}
								}).then((result) => {
									if(result) {
										$("#MemberWithdrawal").submit();
									}
								});
							}
						})
					}
				}
			})
		}
	});
})