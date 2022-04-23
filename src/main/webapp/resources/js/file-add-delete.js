/* 여행 포토 등록 사진 추가 & 삭제 */
$(document).ready(function() {

	//파일 삭제
	$(document).on("click", "#fileDel", function() {
		$(this).parent().remove();
	})

	//파일 추가
	fn_addFile();

})

/* 파일 추가 */
function fn_addFile() {
	var fileIndex = 1;

	$("#fileAdd_btn").on("click", function() {
		$("#fileIndex").append("<div><input type='file' name='file' + (fileIndex++)'>" + "<button id='fileDel' type='button' style='float:right;'>" + "삭제" + "</button></div>");
	});
}

var fileNoArry = new Array();
var fileNameArry = new Array();

function fn_del(value, name) {
	fileNoArry.push(value);
	fileNameArry.push(name);
	$("#fileNoDel").attr("value", fileNoArry);
	$("#fileNameDel").attr("value", fileNameArry);
}