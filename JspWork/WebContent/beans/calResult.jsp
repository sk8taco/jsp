<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="calc.CalcBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청을 받아서 처리해주는페이지</title>
</head>
<body>
<!--방법1  -->
<%
	/*
	//입력받아서 계산-> 출력(방법1) -> 자바빈즈를 이용
	CalcBean ca = new CalcBean(); // 멤버변수 저장, 계산 Calculate
	
	ca.setNum1(Integer.parseInt(request.getParameter("num1")));
	ca.setOperator(request.getParameter("operator"));
	ca.setNum2(Integer.parseInt(request.getParameter("num2")));
	ca.calculate();
	*/
%>
<!--방법2  -->
<jsp:useBean id="ca" class="calc.CalcBean" scope="request"/>
<jsp:setProperty name="ca" property="*"/>
<% ca.calculate(); %>
<%-- 계산결과 : <%=ca.getResult() %><br>
계산결과2:<jsp:getProperty name="ca" property="result"/> --%>

</body>
</html>