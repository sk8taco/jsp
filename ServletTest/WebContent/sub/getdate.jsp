<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력을 받아서 처리</title>
</head>
<body>
<%
	//요청 -> request, 응답-> response
	request.setCharacterEncoding("utf-8"); // 한글처리
	
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	out.println("name:"+name+",addr:"+addr);
%>

</body>
</html>