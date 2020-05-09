<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈즈(입력폼)</title>
</head>
<body>
<h1>include 액션태그 연습</h1>
<form action="beans3.jsp" method="post">
	<p>이름: <input type="text" name="name"></p>
	<p>주소: <input type="text" name="addr"></p>
	<!-- <p>나이: <input type="text" name="age"></p> -->
	<p><input type="submit" value="전송"></p>
</form>

</body>
</html>