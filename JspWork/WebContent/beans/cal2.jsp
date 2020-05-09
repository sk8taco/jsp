<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="calc.CalcBean"%>
<jsp:useBean id="ca" class="calc.CalcBean" scope="request"/>
<jsp:setProperty name="ca" property="*"/>
<% ca.calculate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청을 하는 페이지(빈즈이용)</title>
</head>
<body style="text-align:center;">
<h3> 간단한 계산기(요청, 응답을 하나의 페이지에서 작성 Ajax)</h3>
<!-- <form method="post" action="cal2.jsp" name="form1"> -->
<form name="form1" method="post">
	<p>
	<input type="text" name="num1" width="200" size="5">
	<select name="operator">
		<option value="+" selected>+</option>
		<option value="-">-</option>
		<option value="*">*</option>
		<option value="/">/</option>
	</select>
	<input type="text" name="num2" width="200" size="5">
	</p>
	<input type="submit" value="계산">
	<input type="reset" value="다시입력">
</form>
<hr>
계산결과:<jsp:getProperty name="ca" property="result"/>
</body>
</html>