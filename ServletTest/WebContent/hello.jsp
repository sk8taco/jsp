<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP 구성요소</title>
</head>
<body>
<%  //ScriptLet %
	//자바코드를 사용할 수 있도록 해주는 영역(=ScriptLet)
	
	String str="박종혁";
	System.out.println("str="+str);
	out.println("str="+str);
	// Javascript로 웹에 출력? document.write("str="+str);
	//<h1>test</h1> 단독으로태그쓸수없다.
	out.println("<h1>"+str+"</h1");
%>
</body>
</html>