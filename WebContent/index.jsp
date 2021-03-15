<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.UserInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>進擊的聊天室</title>
<style type="text/css">
.talkroom:hover{
	cursor:pointer;
	border:black 2px solid; 
}
</style>
<script src='js/jquery.js'></script>
<script>
	$(document).ready(function(){
		$("#update").hide();
		$("#logout").hide();
		
		$("#login").click(function(){
			window.location.href="login.jsp";
		});
		$("#register").click(function(){
			window.location.href="register.jsp";
		});
		$("#update").click(function(){
			window.location.href="update.jsp";
		});
		$("#logout").click(function(){
			window.location.href="LoginAndLogout?action=logout";
		});		
		
		$("#talkroom1").click(function(){
			window.location.href="talkroom.jsp";
		});
		
		if($("#welcome").html()){
			$("#welcome").append(" 您好");
			$("#login").hide();
			$("#register").hide();
			$("#update").show();
			$("#logout").show();
		};		
		
	});
</script>
</head>
<body>
<header><b>進擊的聊天室</b></header>
<span id="welcome">${sessionScope.userInfo.username}</span>
<input type="button" id="login" value="登入">&nbsp;
<input type="button" id="register" value="註冊">&nbsp;
<input type="button" id="update" value="修改個資">&nbsp;
<input type="button" id="logout" name="logout" value="登出">&nbsp;
<br><br>
	<div>
		<span id="talkroom1"  class="talkroom">鄉民都30cm起跳</span><br>
		<span id="talkroom2"  class="talkroom">地方媽媽的煩惱</span><br>
		<span id="talkroom3"  class="talkroom">單身狗變黃金狗</span><br>
	</div>

</body>
</html>