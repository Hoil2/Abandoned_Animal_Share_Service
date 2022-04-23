<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% 
	request.setCharacterEncoding("UTF-8");
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
%>
</head>
<script>
	function init(){
		var url = location.href;
		var confmKey = "devU01TX0FVVEgyMDIxMTExOTE0MDkzNjExMTkxMjQ=";
		var resultType = "4";
		var inputYn= "<%=inputYn%>";
		
		if(inputYn != "Y"){
			document.form.confmKey.value = confmKey;
			document.form.returnUrl.value = url;
			document.form.resultType.value = resultType;
			document.form.action="https://www.juso.go.kr/addrlink/addrLinkUrl.do";
			document.form.submit();
		}
		else {
			opener.jusoCallBack("<%=roadFullAddr%>");
			window.close();
		}
	}
</script>

<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
	</form>
</body>
</html>