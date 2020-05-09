<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 전달하는 목적</title>
</head>
<body>
<jsp:forward page="/view/indexControl.jsp">
	<jsp:param name="CONTROL" value="intro"/>
	<jsp:param name="PAGENUM" value="01"/>
</jsp:forward>

</body>
</html>