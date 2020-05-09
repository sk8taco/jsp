<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import 관련 태그 </title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	// String url="http://www.naver.com";
	// 네이버와 다음사이트는 외부에서 접근 X
	// javax.servlet.ServletException: javax.servlet.jspTagException:302~
	// <c:import url="접속할 사이트 주소" var="접속해서 가져올 데이터를 저장할 변수명"
	//	  escapeXml = "true" (태그 자체를 문자열로 인식해서 문자형태로 출력함)
	//	  escapeXml = "false" (태그 자체로 인식, 불러와서 화면상의 형태 그래도 가져옴)
%>
<c:set var="url" value="http://www.chosun.com" />
<c:import url="${url}" charEncoding="utf-8" var="u"/>
<c:out value="${url}"/>가져옵니다/ <br>
<c:out value="${u}" escapeXml="false" />
<hr>
<h4>내부 자원 가져오기</h4>
<!-- chooseTag.jsp?age2=20 )get 방식으러 매개변수 전달 : include 태그와 기능이 비슷하다  -->
<c:set var="url" value="chooseTag.jsp"/>
<c:import url="${url}" var="u">
	<c:param name="age2" value="20"/>
</c:import>
<c:out value="${u}" escapeXml="false"/>
</body>
</html>