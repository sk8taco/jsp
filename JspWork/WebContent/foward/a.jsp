<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp</title>
</head>
<body bgcolor="#09f">
<h1>a.jsp에 오신것을 환영합니다.</h1>
<%
	int su = 200; // 자기것 -> page범위 (일종의 지역변수개념)
%>
<hr>
move2.jsp에서 공유한 su의 값을 찍어라<%=request.getAttribute("total") %>

</body>
</html>