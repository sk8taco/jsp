<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include지시어 특징</title>
</head>
<body>
<%@include file="./sub/JspModule.java" %>
  <h3>이 페이지는 include지시어를 연습하기위해서 만들어진 페이지입니다.</h3>
  <h3>테스트중입니다.</h3>
   <%=getStr() %>
  <h3>테스트중입니다.</h3>
  <%=getStr() %>
  <h3>테스트중입니다.</h3>
  <h3>테스트중입니다.</h3>
  <%=getStr() %>
  <h3>테스트중입니다.</h3>
   <h3>테스트중입니다.</h3>
  <%@include file="./bottom/bottom.html" %>
</body>
</html>





