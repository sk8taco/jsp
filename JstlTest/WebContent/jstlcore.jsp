<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlcore.jsp(변수(객체) 사용 범위, out태그))</title>
</head>
<body>

<h1>출력문</h1>
<h3>
<%--
	<c:out value="${출력할 대상자}">
 --%>
 <%
 	out.println(1+2);
 %>
 <br>
 <%=1+2%> <!-- 표현식을 이용한 출력  -->
 <hr>
 "${1+2}" : ${1+2}<br><!-- 표현(el)언어을 이용한 출력  -->
 <c:out value="${1+2}"/> <!-- 액션태그와 표현(el)언어을 이용한 출력  -->
 <hr>
 ${1>3} <c:out value="${1>3}"/>
 ${1 gt 3} <c:out value="${1 gt 3}"/> <!-- html 에서 부등호 기호를 사용하기  -->
 <hr>
 <h2>사용범위</h2>
 <!-- 같은 변수의 값을 출력하는 경우(저장영역을 표시.출력할 변수명)  -->
<%
	String name="hello";
	//session.setAttribute("name","하늘"); // 메모리에 저장
	//request.setAttribute("name","하늘");
	//scope="page" request seesoin application => jsp 내장객체 사용범위
	// el 내장객체의 사용범위 : pageScope, requestScope, sessionScope, applicatoinScope
%>
<c:set var="name" value="hello" scope="page"/><br>
c:out name:<c:out value="${name}"/><br>
<c:set var="name" value="하늘" scope="session"/> <!-- 사용범위를 다르게 주어 위의 name 과는 다른 개체가 된다. -->
expression name: <%=session.getAttribute("name") %><br>
session 객체의 값 name:<c:out value="${sessionScope.name}"/>
<hr>
remove session scope var "name" : <c:remove var="name" scope="session"/> <br>
session 객체의 값 name2:<c:out value="${sessionScope.name}"/>
</h3>


</body>
</html>