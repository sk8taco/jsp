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
	//  request.setAttribute("result", resultObject)
	// -> ${param.매개변수명} => request.getParameter("매개변수"); 
	// 형식) ${키명} = request.getAttribute("키명"); 
%>
<h1>처리결과</h1>
<h3>
	처리결과 1: <%=request.getAttribute("result") %><br>
	처리결과 2: ${result}
</h3>
</body>
</html>