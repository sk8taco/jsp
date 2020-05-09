<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청받아 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); // 한글처리
%>
<!-- sub.jsp에게 요청해서 실행한 결과 내용을 삽입-->
<jsp:include page="sub.jsp" flush="false"/><br>
<!-- sub.jsp  -->
업무는 sub.jsp가 알아서 처리할겁니다.
</body>
</html>