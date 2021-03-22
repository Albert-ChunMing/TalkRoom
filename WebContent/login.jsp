<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>login</title>
<style type="text/css">
body {
	height:100%;
	width:100%;
	margin: 0;
	background-color:#383838;
	font-family:Microsoft JhengHei;
	font-size:30px;
	color:white;
}
header{
	max-width:100%;
	font-size:40px;
	font-weight:bolder;
	font-family:Microsoft JhengHei;
	background-color:#a52603;
	color:#fcf3e9;
	text-align:center;
	padding:5px;
	border:black 3px solid;
}
.btn{
	border:#a52603 2px solid;
	border-radius: 5px;
	padding:3px;
	font-size:25px;
	background-color:#a52603;
	color:#fcf3e9;
	margin:10px;
}
.btn:hover{
	background-color:#fcf3e9;
	color:#a52603;
}
#msg,span{
	font-size:20px;
	color:#ffe8a8;
	vertical-align:top;
}
.center{
	text-align:center;
	margin-top:50px;
}
#account ,#password{
	width:200px;
	height:33px;
	font-size:25px;
	margin-top:5px;
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
			window.history.back();
		});
		$("#register").click(function(){
			window.location.href="register.jsp";
		});
	});	
</script>
</head>
<body>
<header><%@ include file="indexbutton.html" %>會員登入</header>
	<div class="center">
		<form action="LoginAndLogout" method="post" onsubmit="return checkForm()">
			帳號 : <input type="text" name="account" id="account"><br><span id="error1"></span><br>
			密碼 : <input type="password" name="password" id="password"><br><span id="error2"></span><br>
			<input type="hidden" name="action" value="login">
			<input type="submit" id="login" value="登入" class="btn"><button id="register" class="btn">註冊</button><button id="back" class="btn">返回</button>
		</form>
		<div id=msg>${requestScope.loginStatus}</div>
	</div>
	
</body>
</html>