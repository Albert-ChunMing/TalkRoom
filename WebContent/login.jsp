<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">
span , #msg{
	font-size:20px;
	color:red;
}
</style>
<script src='js/jquery.js'></script>
<script>
	function checkForm(){
		if(!$("#account").val() || !$("#password").val()){
			var error1=$("#account").val()? "":"請輸入帳號";
			var error2=$("#password").val()? "":"請輸入密碼";
			$("#error1").text(error1);
			$("#error2").text(error2);
			return false;
		}
	}
	$(document).ready(function(){
		$("#back").click(function(){
			window.location.href="index.jsp";
		});
	});	
</script>
</head>
<body>
<header><b>會員登入</b></header>
	<div>
		<form action="LoginAndLogout" method="post" onsubmit="return checkForm()">
			帳號 : <input type="text" name="account" id="account"><span id="error1"></span><br>
			密碼 : <input type="password" name="password" id="password"><span id="error2"></span><br>
			<input type="hidden" name="action" value="login">
			<input type="submit" id="login" value="登入">&nbsp;<button id="back">返回</button>
		</form>
	</div>
	<div id=msg>${requestScope.loginStatus}</div>
</body>
</html>