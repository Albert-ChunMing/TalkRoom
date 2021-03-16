<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.UserInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>進擊的聊天室</title>
<style type="text/css">
body {
	height:100%;
	width:100%;
	margin: 0;
	background-color:gray;
	font-family:Microsoft JhengHei;
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
.toRight{		
	display:flex;
	justify-content:flex-end;/*調整水平排列:內部DIV靠右對齊*/
	align-items:flex-end;/*調整鉛直排列:內部DIV靠下對齊*/
	padding:10px;
	background-color:#fcf3e9;
	font-weight:bold;
}
.select{
	text-align:center;
	display:flex;
}
.talkroom{
	width:250px;
	margin-left:auto;
	margin-right:auto;
	margin-top:10px;
	background-color:black;
	padding:2px;
}
.talkroom:hover{
	cursor:pointer;
}
.roomName{
	background-color:#a52603;
	color:#fcf3e9;
	border-radius: 5px;
	padding:5px;
	margin:5px;
	font-weight:bold;
}
.roomName:hover{
	background-color:#fcf3e9;
	color:#a52603;
}
.btn{
	border:#a52603 2px solid;
	border-radius: 5px;
	padding:3px;
	font-size:15px;
	background-color:#a52603;
	color:#fcf3e9;
	margin:2px;
}
.btn:hover{
	border:#a52603 2px solid;
	border-radius: 5px;
	padding:3px;
	font-size:15px;
	background-color:#fcf3e9;
	color:#a52603;
}
.img{
	width:240px;
	height:240px;
	border-radius: 5px;
}
@media screen and (max-width:1050px) {
	.select{text-align:center;display:block;}

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
			$("#welcome").append(" 您好 ");
			$("#login").hide();
			$("#register").hide();
			$("#update").show();
			$("#logout").show();
		};		
		
	});
</script>
</head>
<body>
<header>進擊的聊天室</header>
	<div class="toRight">
		<span id="welcome">${sessionScope.userInfo.username}</span>&nbsp;
		<input type="button" id="login" value="登入" class="btn">
		<input type="button" id="register" value="註冊" class="btn">
		<input type="button" id="update" value="修改個資" class="btn">
		<input type="button" id="logout" name="logout" value="登出" class="btn">
	</div>
	<div class="select">
		<div id="talkroom1"  class="talkroom"><div class="roomName">鄉民都30cm起跳</div><img src="images/netizen.gif"  alt="No images" class='img'/></div>
		<div id="talkroom1"  class="talkroom"><div class="roomName">地方媽媽的煩惱</div><img src="https://media.giphy.com/media/LkNrdxLtU1YYxsjjJL/giphy.gif"  alt="No images" class='img'/></div>
		<div id="talkroom1"  class="talkroom"><div class="roomName">單身狗只能吃土</div><img src="https://media.giphy.com/media/baq37DWuGSMFIljIwQ/giphy.gif"  alt="No images" class='img'/></div>
	</div>

</body>
</html>