<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청받아 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	// radio -> 문자열 비교하면 됨. 1 아니면 2 
%>
name : <%=request.getParameter("name")%>
addr : <%=request.getParameter("addr")%>
<%
//배열의 값으로 전달이 되면
//-> request.getParameterValues("전달받은 매개변수명")
String values[] = request.getParameterValues("pet");
if(values!=null){
	for(int i=0; i<values.length; i++){%>
		<%=values[i]%>
	<%}
}
%> 

</body>
</html>