<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.UserInfo,model.UserInfoDao"%>
<% 
	UserInfo user=(UserInfo)session.getAttribute("userInfo");
	user=UserInfoDao.getUserInfoByAccount(user.getAccount());
	session.setAttribute("userInfo", user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改個資</title>
<link rel="stylesheet" href='style/jquery-ui.css'>
<style>
table, th, td {border-bottom:black 2px solid;border-collapse: collapse;padding: 15px;text-align:center;}
span, #msg{font-size:20px;color:red;}
.ui-datepicker {font-size:60%;}
</style>
<script src='js/jquery.js'></script>
<script src="js/jquery-ui.js"></script>
<script src='js/datepicker-zh-TW.js'></script>
<script>	
	$(document).ready(function(){		
		$("#update").click(function(){
			var passwithspace=$("#pass").val().length !==$("#pass").val().trim().length;
			var namewithspace=$("#name").val().length !==$("#name").val().trim().length;
			var birthwithspace=$("#birth").val().length !==$("#birth").val().trim().length;
			var phonewithspace=$("#phone").val().length !==$("#phone").val().trim().length
			var allnull=!($("#pass").val()||$("#name").val()||$("#birth").val()||$("#phone").val());
			
			if(passwithspace||namewithspace||birthwithspace||phonewithspace||allnull){
				$("#error1").text(passwithspace? "前後不能有空格":"");
				$("#error2").text(namewithspace? "前後不能有空格":"");
				$("#error3").text(birthwithspace? "前後不能有空格":"");
				$("#error4").text(phonewithspace? "前後不能有空格":"");
				$("#msg").text(allnull?"請輸入欲更改的項目":"");	
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
<form action="RegisterAndUpdate" method="post" id="userInfo">
	<table>
		<tr><th colspan="3">會員資料更新</th></tr>
		<tr><th>項目</th><th>原資料</th><th>新資料</th></tr>
		<tr><td>帳號</td><td>${userInfo.account}</td><td>不可修改<input type="hidden" name="account" value="<%=user.getAccount()%>"></td></tr>
		<tr><td>密碼</td><td>${userInfo.password}</td><td><input type="text" id="pass" name="pass"><br><span id="error1"></span></td></tr>
		<tr><td>姓名</td><td>${userInfo.username}</td><td><input type="text" id="name" name="name"><br><span id="error2"></span></td></tr>
		<tr><td>生日</td><td>${userInfo.birthday}</td><td><input type="text" id="birth" name="birth"><br><span id="error3"></span></td>	</tr>
		<tr><td>手機</td><td>${userInfo.cellphone}</td><td><input type="text" id="phone" name="phone"><br><span id="error4"></span></td></tr>		
</table>
<input type="hidden" name="action" value="update">
</form>
<button id="update">更新</button>&nbsp;<button id="back">返回</button>
<div id=msg>${requestScope.result}</div>

</body>
</html>