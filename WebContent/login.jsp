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
	font-size:20px;
	background-color:#a52603;
	color:#fcf3e9;
	margin:5px;
}
.btn:hover{
	background-color:#fcf3e9;
	color:#a52603;
}
#msg{
	font-size:20px;
	color:red;
}
.center{
	text-align:center;
	position:absolute;
	top:50%;
	left:50%;
	margin-top:-72.5px;
	margin-left:-150px;
}
#account ,#password{
	width:200px;
	height:33px;
	font-size:25px;
	margin:5px;
}
</style>
<script src='js/jquery.js'></script>
<script>
	function checkForm(){
		if(!$("#account").val() || !$("#password").val()){
			$("#msg").text("尚有欄位未填寫");
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
<header>會員登入</header>
	<div class="center">
		<form action="LoginAndLogout" method="post" onsubmit="return checkForm()">
			帳號 : <input type="text" name="account" id="account"><br>
			密碼 : <input type="password" name="password" id="password"><br>
			<input type="hidden" name="action" value="login">
			<input type="submit" id="login" value="登入" class="btn"><button id="back" class="btn">返回</button>
		</form>
		<div id=msg>${requestScope.loginStatus}</div>
	</div>
	
</body>
</html>