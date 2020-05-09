<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청을 하는 페이지(빈즈이용)</title>
</head>
<body>
<center>
<h3> 간단한 계산기</h3>
<form method="post" action="calResult.jsp" name="form1">
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
</center>
</body>
</html>