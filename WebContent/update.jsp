<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.UserInfo,model.UserInfoDao"%>
<% 
	//每次載入該頁時 從DB取得最新會員資料 同時更新session
	UserInfo user=(UserInfo)session.getAttribute("userInfo");
	user=UserInfoDao.getUserInfoByAccount(user.getAccount());
	session.setAttribute("userInfo", user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>修改個資</title>
<link rel="stylesheet" href='style/jquery-ui.css'>
<style>
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
input{
	width:200px;
	height:33px;
	font-size:25px;
	margin-top:5px;
}
.ui-datepicker {font-size:60%;}
</style>
<script src='js/jquery.js'></script>
<script src="js/jquery-ui.js"></script>
<script src='js/datepicker-zh-TW.js'></script>
<script>	
	$(document).ready(function(){		
		$("#update").click(function(){
			if(!$("#account").val().trim() || $("#account").val().length !==$("#account").val().trim().length || $("#account").val().trim().length>20
				|| !$("#pass").val().trim() || $("#pass").val().length !==$("#pass").val().trim().length || $("#pass").val().trim().length>20 || $("#pass").val().trim().length<8
				|| !$("#name").val().trim() || $("#name").val().length !==$("#name").val().trim().length || $("#name").val().trim().length>20
				|| !$("#birth").val().trim() || $("#birth").val().length !==$("#birth").val().trim().length || $("#birth").val().trim().length>20
				|| !$("#phone").val().trim() || $("#phone").val().length !==$("#phone").val().trim().length || $("#phone").val().trim().length>20)
				{
					$("#error1").text($("#account").val().trim()? $("#account").val().length==$("#account").val().trim().length? $("#account").val().trim().length<21? "":"須20字以內":"前後不能有空格":"請輸入帳號");
					$("#error2").text($("#pass").val().trim()? $("#pass").val().length==$("#pass").val().trim().length? $("#pass").val().trim().length<21? $("#pass").val().trim().length>7? "":"請輸入8碼以上":"須20字以內":"前後不能有空格":"請輸入密碼");
					$("#error3").text($("#name").val().trim()? $("#name").val().length==$("#name").val().trim().length? $("#name").val().trim().length<21? "":"須20字以內":"前後不能有空格":"請輸入姓名");
					$("#error4").text($("#birth").val().trim()? $("#birth").val().length==$("#birth").val().trim().length? $("#birth").val().trim().length<21? "":"須20字以內":"前後不能有空格":"請輸入生日");
					$("#error5").text($("#phone").val().trim()? $("#phone").val().length==$("#phone").val().trim().length? $("#phone").val().trim().length<21? "":"須20字以內":"前後不能有空格":"請輸入手機");	
					return false;
				}
				$("#userInfo").submit();
		});

		$("#back").click(function(){
			window.location.href="index.jsp";
		});

		$("#birth").datepicker({
			dateFormat:"yy-mm-dd",//設定日期格式
			changeMonth:true,//可直接選擇月份
			changeYear:true,//可直接選擇年份
			yearRange:"c-30:c+30",//可選擇的年份範圍 c為當前年度
			defaultDate:"2000-01-01",//月曆一開始的日期  原本預設是今日
		});
	});	
</script>
</head>
<body>
<header><%@ include file="indexbutton.html" %>會員資料更新</header>
<div class="center">
	<form action="RegisterAndUpdate" method="post" id="userInfo">
		帳號: <input type="text" id="account" name="account" value="<%=user.getAccount()%>" readonly="readonly"><br><span id="error1"></span><br>
		密碼: <input type="text" id="pass" name="pass"  value="${userInfo.password}"><br><span id="error2"></span><br>
		姓名: <input type="text" id="name" name="name" value="${userInfo.username}"><br><span id="error3"></span><br>
		生日: <input type="text" id="birth" name="birth" value="${userInfo.birthday}"><br><span id="error4"></span><br>
		手機: <input type="text" id="phone" name="phone" value="${userInfo.cellphone}"><br><span id="error5"></span><br>
		<input type="hidden" name="action" value="update">
	</form>	
	<button id="update" class="btn">更新</button><button id="back" class="btn">返回</button>
	<div id=msg>${requestScope.result}</div>
</div>
</body>
</html>