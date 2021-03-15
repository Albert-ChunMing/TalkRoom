<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
<link rel="stylesheet" href='style/jquery-ui.css'>
<style>
span, #msg{font-size:20px;color:red;}
.ui-datepicker {font-size:60%;}
</style>
<script src='js/jquery.js'></script>
<script src="js/jquery-ui.js"></script>
<script src='js/datepicker-zh-TW.js'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#confirm").click(function(){
			if(!$("#account").val().trim() || !$("#pass").val().trim() || !$("#name").val().trim() || !$("#birth").val().trim() || !$("#phone").val().trim() ||
				$("#account").val().length !==$("#account").val().trim().length ||	$("#pass").val().length !==$("#pass").val().trim().length ||	$("#name").val().length !==$("#name").val().trim().length ||	$("#birth").val().length !==$("#birth").val().trim().length || $("#phone").val().length !==$("#phone").val().trim().length){
				$("#error1").text($("#account").val().trim()? $("#account").val().length==$("#account").val().trim().length? $("#account").val().trim().length>20?"須20字以內":"":"前後不能有空格":"請輸入帳號");
				$("#error2").text($("#pass").val().trim()? $("#pass").val().length==$("#pass").val().trim().length? $("#pass").val().trim().length>20?"須20字以內":"":"前後不能有空格":"請輸入密碼");
				$("#error3").text($("#name").val().trim()? $("#name").val().length==$("#name").val().trim().length? $("#name").val().trim().length>20?"須20字以內":"":"前後不能有空格":"請輸入姓名");
				$("#error4").text($("#birth").val().trim()? $("#birth").val().length==$("#birth").val().trim().length? "":"前後不能有空格":"請輸入生日");
				$("#error5").text($("#phone").val().trim()? $("#phone").val().length==$("#phone").val().trim().length? $("#phone").val().trim().length>20?"須20字以內":"":"前後不能有空格":"請輸入手機");	
				return false;
			}
			$("#userInfo").submit();
		});
		
		$("#back").click(function(){
			window.location.href="index.jsp";
		});
		
		if($("#msg").text()=="註冊成功 3秒後自動返回首頁"){
			setTimeout(function(){
				window.location.href="index.jsp";
			},3000);
		};

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
<header><b>會員註冊</b></header>
<div>
	<form action="RegisterAndUpdate" method="post" id="userInfo">
		帳號: <input type="text" id="account" name="account"><span id="error1"></span><br>
		密碼: <input type="text" id="pass" name="pass"><span id="error2"></span><br>
		姓名: <input type="text" id="name" name="name"><span id="error3"></span><br>
		生日: <input type="text" id="birth" name="birth"><span id="error4"></span><br>
		手機: <input type="text" id="phone" name="phone"><span id="error5"></span><br>
		<input type="hidden" name="action" value="add">
	</form>	
	<button id="confirm">確認</button>&nbsp;<button id="back">返回</button>
	<div id=msg>${requestScope.result}</div>
</div>
</body>
</html>