<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
帳號:${param.account}<br>
密碼:${param.password}<br>
<hr>
帳號:${sessionScope.userInfo.account}<br>
密碼:${userInfo.password}<br>
</body>
</html>