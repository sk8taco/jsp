<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); // 한글데이터 처리
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String operator = request.getParameter("operator");
	System.out.println("num1:"+num1+",num2:"+num2);
	System.out.println(operator);
%>

<jsp:useBean id="cb" class="calc.CalcBean" scope="page"/>
<jsp:setProperty name="cb" property="*"/>



<jsp:include page="cal.jsp" />
<hr>
계산결과 : <%=cb.calc() %>
</body>
</html>