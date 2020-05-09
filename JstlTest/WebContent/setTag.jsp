<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL사용(액션태그2) core, fmt(set태그, remove 태그))</title>
</head>
<body>
<%
	//int num1 = 20;
	//double num2 = 10.5;
	//java.util.Date today = new java.util.Date();
%>
<%-- <jsp:useBean ~~~ : jsp는 식별자 / 다른 태그를 사용할 때는 식별자 또한 그에 맞는 식별자를 사용한다  --%>
<!-- 
	set액션태그 > var="변수명" value="저장할 값의 자료형은 저장되는 값에 따라 자동으로 부여된다"
	scope="변수의 사용범위 지정(page(default), request, session, application"  

  -->
<c:set var="num1" value="${20}" scope="page"/>
<c:set var="num2">
	10.5
</c:set>
<c:set var="today" value="<%=new java.util.Date()%>"/>

<hr>
변수 num1=${num1} <br>
변수 num2=${num2} <br>
num1+num2=${num1+num2}<br>
오늘은  ${today} 입니다.<p>

<!-- remove var="내용을 삭제시킬 변수명" scope="변수의 사용범위"  -->
<c:remove var="num1" scope="page" />
삭제한 후의 num1 변수 num1 = ${num1}<br>
num1+num2=${num1+num2}

</body>
</html>


