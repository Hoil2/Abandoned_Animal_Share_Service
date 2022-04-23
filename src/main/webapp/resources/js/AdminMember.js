/* 관리자페이지 내 정보 수정 유효성 검사 */
function AdminProfileEdit() {
	var UserID = $("#AdminID").val();
	var Password = $("#AdminPassword").val();
	var Email = $("#AdminEmail").val();
	var Phone = $("#AdminPhone").val();
	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(Password);			//영문, 숫자
	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(Password);	//영문, 특수문자
	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,20}$/.test(Password);		//특수문자, 숫자
	
	if(!Password) {
		swal({
			title: "관리자",
			text: "비밀번호가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!(check1 || check2 || check3)) {
		swal({
			title: "관리자",
			text: "사용할 수 없는 비밀번호입니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(/(\w)\1\1/.test(Password)) {
		swal({
			title: "관리자",
			text: "같은 문자를 3회 이상 사용하실 수 없습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(Password.search(UserID)>-1) {
		swal({
			title: "관리자",
			text: "비밀번호에 아이디가 포함되어 있습니다.",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(!Email) {
		swal({
			title: "관리자",
			text: "이메일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Phone) {
		swal({
			title: "관리자",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		Swal.fire({
			title: '관리자',
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
					title: '관리자',
					text: "정보가 성공적으로 업데이트 되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#AdminProfileEditForm").submit();
					}
				});
			}
		})
	}
}