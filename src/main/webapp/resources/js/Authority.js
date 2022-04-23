/* 공지사항 권한 체크 */
function AuthCheck() {
	swal({
		title: "권한 오류",
		text: "접근할 수 없는 권한입니다.",
		icon: "error",
		buttons : {
			confirm : {
				value : true
			}
		}
	}).then((result) => {
		if(result) {
			location.href="/ex/main";
		}
	});
}