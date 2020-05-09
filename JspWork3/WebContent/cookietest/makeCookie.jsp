<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<%
	//1. 쿠키를 생성하려면 -> 이름,저장할 값을 지정 (한글도 가능함)-> 접속한 클라이언트에게 전송
	String cookiename ="mycookie"; // 
	Cookie c = new Cookie(cookiename,"apple");
	//2. 쿠키값을 접속한 클라이언트 컴퓨터에 전송하기 전에 기본값을 설정
	c.setMaxAge(60*2);
	//setMaxAge(sec 단위) 쿠키값을 얼마동안 저장할 것인가. 60*2 = 120sec 저장 유지 시간  > 60*60*24 : 하루동안
	//3.쿠키의 값읇 ㅕㄴ경 -> setValue
	c.setValue("박종혁");
	// 4. 클라이언트->addCookie(전송할 쿠키 객체명)
	response.addCookie(c);
	
%>
<body>
<h1>쿠키를 생성하는 예제</h1>
<p>
	쿠키가 생성되었습니다.<br>
	쿠키의 내용은 <a href="useCookie.jsp">여기에서 확인</a>
</p>

</body>
</html>