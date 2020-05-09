<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404에러가 발생한 경우</title>
</head>
<body>
<%
	response.setStatus(HttpServletResponse.SC_OK);
	//에러페이지를 내가 처리하겠다 라는 처리
	//이 코드를 생략하면 웹브라우저에서 제공하는 에러페이지를 띄운다.
%>
<h1 style="color:#f00;">
요청하신 문서를 못찾았습니다. 요청하신 문서와 경로를 다시 한번 확인해주세요
</h1>
</body>
</html>