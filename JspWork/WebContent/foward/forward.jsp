<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이동하는 페이지를 요청하는 페이지</title>
</head>
<body>
<h1>페이지를 이동시키는 역할</h1>
<form action="move2.jsp" method="post">
<!--  <form action="move.jsp" method="post"> -->
	<p>이동할 페이지명: <input type="text" name="move"></p>
	<p><input type="submit" value="전송"></p>
</form>

</body>
</html>