<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>move.jsp</title>
</head>
<body>
<h1>페이지를 이동시키는 역할:: <b style="color:#f00;">체크하여 이동</b>시킴</h1>
<%
	//request.setCharacterEncoding("utf-8"); // 한글처리
	String move = request.getParameter("move"); 
	//a.jsp or b.jsp
	System.out.println("move:"+move);
%>
<!-- forward 액션태그 page ="이동할페이지명"-->
<jsp:forward page ="<%=move%>"/><br>
</body>
</html>