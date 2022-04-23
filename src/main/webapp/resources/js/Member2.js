/* 아이디 찾기 */
function find_id() {
	var Name = $("#Name").val();
	var Email = $("#Email").val();
	
	$.ajax({
		url : 'FindUserID',
		type : 'POST',
		datatype: 'json',
		data : {
	    	Name : Name,
	    	Email : Email
	    },
		success: function(msg){
        	if(msg == "") {
        		swal({
					title: "아이디 찾기",
					text: "존재하지 않는 아이디거나 입력된 정보가 일치하지 않습니다.",
					icon: "error",
					timer: 3000
				});
			}
			else {
				swal({
					title: "아이디 찾기",
					text: "회원님의 아이디는 " + msg + "입니다.",
					icon: "success",
					timer: 3000
				});
        	}
		},
		error : function() {
			swal({
				title: "아이디 찾기",
				text: "오류가 발생하였습니다. 잠시 후 다시 시도해주세요.",
				icon: "error",
				timer: 3000
			});
		}
	});
}

/* 비밀번호 찾기 */
function find_pw() {
	var UserID = $("#UserID").val();
	var Name = $("#Name").val();
	var Email = $("#Email").val();
	
	$.ajax({
		url : 'FindPassword',
		type : 'POST',
		datatype: 'json',
		data : {
			UserID : UserID,
			Name : Name,
			Email : Email
		},
		success: function(msg){
        	if(msg == "") {
        		swal({
					title: "비밀번호 찾기",
					text: "존재하지 않는 아이디거나 입력된 정보가 일치하지 않습니다.",
					icon: "error"
				});
			}
           	else if(msg == "Success") {
				swal({
					title: "비밀번호 찾기",
					text: "회원님의 이메일로 임시 비밀번호가 발송되었습니다.",
					icon: "success"
				});
			}
		},
		error : function() {
			swal({
				title: "비밀번호 찾기",
				text: "오류가 발생하였습니다. 잠시 후 다시 시도해주세요.",
				icon: "error"
			});
		}
	});
}