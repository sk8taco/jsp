<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력받은 값을 저장해서 출력</title>
</head>
<body style="text-align:center;">

<jsp:useBean id="cb" class="calc.CalcBean" scope="page"/>
<jsp:setProperty name="cb" property="*"/>
<h1>계산기</h1>
<hr>
<form method="post" action="calResult.jsp" name="form1">
	<input type="text" name="num1" size="5">
	<select name="operator">
		<option value="+">+</option>
		<option value="-">-</option>
		<option value="*">*</option>
		<option value="/">/</option>
	</select>
	<input type="text" name="num2" size="5"><br>
	<input type="submit" value="계산" style="margin:5px;">
	<input type="button" value="다시입력" style="margin:5px;">
</form>

<%-- <jsp:include page="calResult.jsp" flush="false"/> --%>
	
</body>
</html>