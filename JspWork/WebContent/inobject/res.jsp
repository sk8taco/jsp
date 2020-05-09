<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답객체(=response)</title>

</head>
<body>
<%
	//response.setContentType("text/html; charset=utf-8"); 문서의 타입설정 가장 상단에 선언된 문장이 서블릿으로 바뀌면서 설정된다.
	//response.sendRedirect("http://www.daum.net"); // 멈추지 않고 바로 외부의 사이트로 이동함(URL내용이 바뀜)
	//response.sendRedirect("../bottom/bottom.html"); //내부의 특정 위치로 이동
	
%>
<script>
	//location.href="http://www.naver.com";
	location.replace("http://www.nate.com");  // replace함수 : url경로 변경
</script>
</body>
</html>