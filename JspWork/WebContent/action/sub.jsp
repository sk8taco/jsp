<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지2</title>
</head>
<body>
<!-- sub.jsp  -->
<%
	String name = request.getParameter("name");
%>
<b><%=name%>님 잘 오셨습니다!</b>
</body>
</html>