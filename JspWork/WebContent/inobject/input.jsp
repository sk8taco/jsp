<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중선택 예제</title>
</head>
<body>
<form action="arrayprint.jsp" method="post">
	<p>이름: <input type="text" name="name"></p>
	<p>주소: <input type="text" name="addr"></p>
	<p>좋아하는 동물
		<input type="checkbox" name="pet" value="dog">강아지
		---------------> 배열의 값
		<input type="checkbox" name="pet" value="cat">고양이
		<input type="checkbox" name="pet" value="ham">햄찌
	</p>
	<p><input type="submit" value="전송"></p>
</form>

</body>
</html>