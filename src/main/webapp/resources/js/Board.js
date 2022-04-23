/* 공지사항 등록 유효성 검사 */
function NoticeWrite() {
	var Title = $("#Title").val();
	var Content = $("#Content").val();
	
	if(!Title) {
		swal({
			title: "공지사항",
			text: "제목이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Content) {
		swal({
			title: "공지사항",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	if($("#Important_CheckBox").is(":checked") == true) {
		$("#Important").val("Y");
	}
	else {
		$("#Important").val("N");
	}
	$("#NoticeBoardWrite").submit();
}

/* 공지사항 수정 유효성 검사 */
function NoticeModify() {
	var Title = $("#Title").val();
	var Content = $("#Content").val();
	
	if(!Title) {
		swal({
			title: "공지사항",
			text: "제목이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Content) {
		swal({
			title: "공지사항",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		if($("#Important_CheckBox").is(":checked") == true) {
			$("#Important").val("Y");
		}
		else {
			$("#Important").val("N");
		}
		Swal.fire({
			title: '공지사항',
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
					title: "공지사항",
					text: "게시물이 수정되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#NoticeBoardModify").submit();
					}
				});
			}
		})
	}
}

//jquery 파라미터 값 받아오기
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

/* 공지사항 삭제 comfirm */
function NoticeDelete() {
	Swal.fire({
		title: '공지사항',
		text: "정말 삭제하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			swal({
				title: "공지사항",
				text: "게시물이 삭제되었습니다.",
				icon: "success",
				buttons : {
					confirm : {
						value : true
					}
				}
			}).then((result) => {
				if(result) {
					var nId = getParameterByName('nId');
					
					location.href='noticeDelete?nId=' + nId;
				}
			});
		}
	})
}

/* 공지사항 삭제2 comfirm */
function NoticeDelete2() {
	Swal.fire({
		title: '공지사항',
		text: "정말 삭제하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			swal({
				title: "공지사항",
				text: "게시물이 삭제되었습니다.",
				icon: "success",
				buttons : {
					confirm : {
						value : true
					}
				}
			}).then((result) => {
				if(result) {
					var nId = getParameterByName('nId');
					console.log("sadsa");
					location.href='noticeDelete?nId=' + nId;
				}
			});
		}
	})
}

/* 1:1문의 등록 유효성 검사 */
function InquiryWrite() {
	var Category = $("#Category option:selected").val();
	var Title = $("#Title").val();
	var Content = $("#Content").val();
	
	if(Category == 'null') {
		swal({
			title: "1:1 문의",
			text: "카테고리가 선택되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Title) {
		swal({
			title: "1:1 문의",
			text: "제목이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Content) {
		swal({
			title: "1:1 문의",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	$("#InquiryBoardWrite").submit();
}

/* 1:1문의 답변 등록 유효성 검사, ajax 등록 */
$(document).ready(function() {
	$('#btnInquiryAnswerWrite').click(function() {
		var answerContent = $("#answerContent").val();
		var param = {'answerContent':$("#answerContent").val(), 'iId': $("#iId").val()};
		
		if(!answerContent) {
			swal({
				title: "1:1 문의",
				text: "답변 글이 작성되지 않았습니다.",
				icon: "warning",
				timer: 3000
			});
			return false;
		}
		else {
			$.ajax({
				url: "inquiryAnswerWrite",
				type: "POST",
				data: param,
				success: function(data) {
					if (data != 1) {
						swal({
							title: "1:1 문의",
							text: "답변 등록이 실패하였습니다.",
							icon: "error",
							timer: 3000
						});
					}
					else {
						swal({
							title: "1:1 문의",
							text: "답변이 성공적으로 등록되었습니다.",
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

/* 1:1문의 수정 유효성 검사 */
function InquiryModify() {
	var AnswerEditContent = $("#answerEditContent").val();
	
	if(!AnswerEditContent) {
		swal({
			title: "1:1 문의",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		Swal.fire({
			title: '1:1 문의',
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
					title: "공지사항",
					text: "게시물이 수정되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#AnswerContentModify").submit();
					}
				});
			}
		})
	}
}

/* 1:1문의 삭제 comfirm */
function answerInquiryDelete() {
	Swal.fire({
		title: '1:1 문의',
		text: "정말 삭제하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			swal({
				title: "1:1 문의",
				text: "답변이 성공적으로 삭제되었습니다.",
				icon: "success",
				buttons : {
					confirm : {
						value : true
					}
				}
			}).then((result) => {
				if(result) {
					var iId = getParameterByName('iId');
					
					location.href='inquiryDelete?iId=' + iId;
				}
			});
		}
	})
}

/* 관리자 1:1문의 삭제 comfirm */
function answerInquiryDelete2() {
	Swal.fire({
		title: '1:1 문의',
		text: "정말 삭제하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			swal({
				title: "1:1 문의",
				text: "답변이 성공적으로 삭제되었습니다.",
				icon: "success",
				buttons : {
					confirm : {
						value : true
					}
				}
			}).then((result) => {
				if(result) {
					var iId = getParameterByName('iId');
					
					location.href='inquiryDelete?iId=' + iId;
				}
			});
		}
	})
}

/*여행 포토 등록 유효성 검사*/
function Write() {
	var Title = $("#Title").val();
	var Content = $("#Content").val();
	
	if(!Title) {
		swal({
			title: "여행포토",
			text: "제목이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Content) {
		swal({
			title: "여행포토",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		Swal.fire({
			title: '여행포토',
			text: "정말 등록하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				swal({
					title: '여행포토',
					text: "게시글이 성공적으로 등록되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#add").submit();
					}
				});
			}
		})
	}		
}
	
/*여행 포토 수정 유효성 검사*/
function Modify() {
	var Title = $("#Title").val();
	var Content = $("#Content").val();
	
	if(!Title) {
		swal({
			title: "여행포토",
			text: "제목이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Content) {
		swal({
			title: "여행포토",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		Swal.fire({
			title: '여행포토',
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
					title: '여행포토',
					text: "게시글이 성공적으로 수정되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#modify").submit();
					}
				});
			}
		})
	}		
}

/* 여행 포토 게시글 삭제 */
function TravelPhotoDelete() {
	Swal.fire({
		title: '여행포토',
		text: "정말 삭제하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			swal({
				title: "여행포토",
				text: "게시글이 성공적으로 삭제되었습니다.",
				icon: "success",
				buttons : {
					confirm : {
						value : true
					}
				}
			}).then((result) => {
				if(result) {
					var prid = getParameterByName('prid');
					
					location.href='travelphotoDelete?prid=' + prid;
				}
			});
		}
	})
}

/* 여행 포토 댓글 작성 */
$(document).ready(function() {
	$('#btnReplyWrite').click(function() {
		var UserID = $("#replyAuthor").val();
		var Content = $("#replyContent").val();
		var param = {'UserID': UserID, 'Content': Content, 'prId': $("#prId").val()};
		
		if(!UserID) {
			$('#loginModal').modal('show');
			return false;
		}
		else if(!Content) {
			swal({
				title: "여행포토",
				text: "댓글이 입력되지 않았습니다.",
				icon: "warning",
				timer: 3000
			});
			return false;
		}
		else {
			$.ajax({
				url: "travelreplyWrite",
				type: "POST",
				data: param,
				success: function(data) {
					if (data != 1) {
						swal({
							title: "여행포토",
							text: "댓글 등록이 실패하였습니다.",
							icon: "error",
							timer: 3000
						});
					}
					else {
						swal({
							title: "여행포토",
							text: "댓글이 성공적으로 등록되었습니다.",
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

/* 여행 포토 댓글 수정 */
function replyEdit(prrid, reply) {
	var htmls = "";
	
	htmls += '<form action="travelreplyModify" method="POST" class="contact-one__form">';
	htmls += '<div class="input-group">';
	htmls += '<textarea id="replyEditContent" name="Content" placeholder="댓글을 입력하세요..." cols="100">'+reply+'</textarea>';
	htmls += '<button id="btnReplyModify" name="btnReplyModify" class="thm-btn-psd2" type="button" onclick="replySave('+prrid+')">등록</button>';
	htmls += '<button class="thm-btn-psd2" type="button" onclick="replyCancel(' + prrid + ', \'' + reply + '\')">취소</button>';
	htmls += '</div>';
	htmls += '</form>';
	
	$("#replyContentSection"+prrid).html(htmls);
	$('#replyEditContent').focus();
}
/* 여행 포토 댓글 수정 취소 */
function replyCancel(prrid, reply) {
	var htmls = "";
	
	htmls += reply;
	
	$("#replyContentSection"+prrid).html(htmls);
}

/* 여행 포토 댓글 수정 등록 */
function replySave(prrid) {
	var Content = $("#replyEditContent").val();
	var param = {'Content': Content, 'prrId': prrid};
	
	if(!Content) {
		swal({
			title: "여행포토",
			text: "댓글이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		$.ajax({
			url: "travelreplyModify",
			type: "POST",
			data: param,
			success: function(data) {
				if (data != 1) {
					swal({
						title: "여행포토",
						text: "댓글 등록이 실패하였습니다.",
						icon: "error",
						timer: 3000
					});
				}
				else {
					swal({
						title: "여행포토",
						text: "댓글이 성공적으로 수정되었습니다.",
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
					title: "케어핀투어",
					text: "문제가 발생하였습니다.\n잠시 후 다시 시도해주세요.",
					icon: "error",
					timer: 3000
				});
			}
		});
	}
}

/* 여행 포토 댓글 삭제 */
function TravelPhotoReplyDelete(prid, prrid) {
	Swal.fire({
		title: '여행포토',
		text: "정말 삭제하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {
			swal({
				title: "여행포토",
				text: "댓글이 성공적으로 삭제되었습니다.",
				icon: "success",
				buttons : {
					confirm : {
						value : true
					}
				}
			}).then((result) => {
				if(result) {
					location.href='travelreplyDelete?prid=' + prid + '&prrid=' + prrid;
				}
			});
		}
	})
}

/* FAQ 등록 유효성 검사 */
function FAQWrite() {
	var Title = $("#Title").val();
	var Content = $("#Content").val();
	
	if(!Title) {
		swal({
			title: "FAQ",
			text: "질문이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Content) {
		swal({
			title: "FAQ",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	
	$("#FAQBoardWrite").submit();
}

/* FAQ 수정 유효성 검사 */
function FAQModify() {
	var Title = $("#Title").val();
	var Content = $("#Content").val();
	
	if(!Title) {
		swal({
			title: "FAQ",
			text: "질문이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Content) {
		swal({
			title: "FAQ",
			text: "내용이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}else {
		Swal.fire({
			title: 'FAQ',
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
					title: "FAQ",
					text: "FAQ가 수정되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#FAQBoardModify").submit();
					}
				});
			}
		})
	}
}


/* 예약내역 등록 유효성 검사 */
function orderWrite() {
	var ProductName = $("#productname").val();
	var Name = $("#name").val();
	var PhoneNum = $("#phonenum").val();
	var StartDate = $("#startdate").val();
	var Payment = $("#payment").val();
	var Status = $("#status").val();
	var check2 = /^[0-9]*$/.test(Payment);
	var check3 =/^[0-9]*$/.test(Status);
	
	if(!ProductName) {
		swal({
			title: "Order",
			text: "상품명이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Name) {
		swal({
			title: "Order",
			text: "작성자 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!StartDate) {
		swal({
			title: "Order",
			text: "출발일이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Payment) {
		swal({
			title: "Order",
			text: "결제금액이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!PhoneNum) {
		swal({
			title: "Order",
			text: "전화번호가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!Status) {
		swal({
			title: "Order",
			text: "결제상태가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}	
	 
	else if(!(check2)) {
		swal({
			title: "숫자 확인",
			text: "결제금액/결제상태 확인해주세요",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	else if(!(check3)) {
		swal({
			title: "숫자 확인",
			text: "결제금액/결제상태 확인해주세요",
			icon: "error",
			timer: 3000
		});
		return false;
	}
	
	
	$("#OrderWrite").submit();
}

/* 관리자 FAQ 카테고리별 게시글 출력 */
function AdminFaqCategory() {
	var param = {"Category":$("#Category option:selected").val()};
	
	$.ajax({
		url: "faq",
		type: "POST",
		data: param,
		success: function(data) {
			if (data != 1) {
				$('#CategoryChanged').submit();
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

/* 탑앵글러 등록 유효성 검사 */
function TopAnglerWriteCheck() {
	var fishName = $("#FishName").val();
	var fishSize = $("#FishSize").val();
	
	if(!fishName) {
		swal({
			title: "탑 앵글러",
			text: "물고기 이름이 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else if(!fishSize) {
		swal({
			title: "탑 앵글러",
			text: "물고기 실측 사이즈가 입력되지 않았습니다.",
			icon: "warning",
			timer: 3000
		});
		return false;
	}
	else {
		Swal.fire({
			title: '탑 앵글러',
			text: "랭킹 등록 요청을 하시겠습니까?",
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				swal({
					title: "탑 앵글러",
					text: "요청이 완료되었습니다.",
					icon: "success",
					buttons : {
						confirm : {
							value : true
						}
					}
				}).then((result) => {
					if(result) {
						$("#TopAnglerWrite").submit();
					}
				});
			}
		})
	}
}