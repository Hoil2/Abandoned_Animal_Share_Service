/* th(테이블 헤더의 SELECT BOX name="allCheck"), td(테이블 바디의 SELECT BOX name="RowCheck" 설정 후 value는 해당 레코드의 ID) */
$(function() {
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;

	$("input[name='allCheck']").click(function() {
		var chk_listArr = $("input[name='RowCheck']");
		for (var i = 0; i < chk_listArr.length; i++) {
			chk_listArr[i].checked = this.checked;
		}
	});
	
	$("input[name='RowCheck']").click(function() {
		if ($("input[name='RowCheck']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		}
		else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

/* 고객센터 공지사항 선택 삭제 */
function NoticeDeleteSelection() {
	var url = "SelectDelete";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");

	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		Swal.fire({
			title: '선택된 게시글이 없습니다.',
			text: "삭제하실 게시글을 선택해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: '확인',
		})
	}
	else {
		Swal.fire({
			title: '글을 삭제하시겠습니까?',
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
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata) {
						if (jdata == 1) {
							location.replace("notice")
						}
						else {
							alert("삭제 실패(문의전화 : 010-0000-0000)");
						}
					}
				});
			}
		})
	}
}

/* 고객센터 1:1 문의 선택 삭제 */
function InquiryDeleteSelection() {
	var url = "SelectDelete2";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");

	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		Swal.fire({
			title: '선택된 게시글이 없습니다.',
			text: "삭제하실 게시글을 선택해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: '확인',
		})
	}
	else {
		Swal.fire({
			title: '글을 삭제하시겠습니까?',
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
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata) {
						if (jdata == 1) {
							location.replace("inquiry")
						}
						else {
							alert("삭제 실패(문의전화 : 010-0000-0000)");
						}
					}
				});
			}
		})
	}
}

/* 고객센터 FAQ 선택 삭제 */
function FAQDeleteSelection() {
	var url = "FAQDelete";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");

	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		Swal.fire({
			title: '선택된 게시글이 없습니다.',
			text: "삭제하실 게시글을 선택해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: '확인',
		})
	}
	else {
		Swal.fire({
			title: '글을 삭제하시겠습니까?',
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
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata) {
						if (jdata == 1) {
							location.replace("faq")
						}
						else {
							alert("삭제 실패(문의전화 : 010-0000-0000)");
						}
					}
				});
			}
		})
	}
}

/* 게시글 통계 공지사항 선택 삭제 */
function noticeStatisticsDeleteSelection() {
	var url = "noticeSelectDelete";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");

	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		Swal.fire({
			title: '선택된 게시글이 없습니다.',
			text: "삭제하실 게시글을 선택해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: '확인',
		})
	}
	else {
		Swal.fire({
			title: '글을 삭제하시겠습니까?',
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
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata) {
						if (jdata == 1) {
							location.replace("noticedetail")
						}
						else {
							alert("삭제 실패(문의전화 : 010-0000-0000)");
						}
					}
				});
			}
		})
	}
}

/* 게시글 통계 1:1 문의 선택 삭제 */
function inquiryStatisticsDeleteSelection() {
	var url = "inquirySelectDelete";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");

	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		Swal.fire({
			title: '선택된 게시글이 없습니다.',
			text: "삭제하실 게시글을 선택해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: '확인',
		})
	}
	else {
		Swal.fire({
			title: '글을 삭제하시겠습니까?',
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
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata) {
						if (jdata == 1) {
							location.replace("inquirydetail")
						}
						else {
							alert("삭제 실패(문의전화 : 010-0000-0000)");
						}
					}
				});
			}
		})
	}
}

/* 게시글 통계 여행 포토 선택 삭제 */
function travelphotoStatisticsDeleteSelection() {
	var url = "travelphotoSelectDelete";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");

	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		Swal.fire({
			title: '선택된 게시글이 없습니다.',
			text: "삭제하실 게시글을 선택해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: '확인',
		})
	}
	else {
		Swal.fire({
			title: '글을 삭제하시겠습니까?',
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
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata) {
						if (jdata == 1) {
							location.replace("travelphotodetail")
						}
						else {
							alert("삭제 실패(문의전화 : 010-0000-0000)");
						}
					}
				});
			}
		})
	}
}