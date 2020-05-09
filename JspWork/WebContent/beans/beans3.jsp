<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력받은 값을 저장해서 출력</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); // 한글데이터 처리
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	System.out.println("name:"+name+",addr:"+addr);
	// 1. 객체생성  (메소드 호출, 데이터 저장)
	//BeanDTO bd = new BeanDTO();
	//<jsp:useBean id="bd" class="test.BeanDTO" scope="page">
	// 2. 입력받은 갯수만큼 Setter Method 호출 => 데이터 값을 저장한다.
	//bd.setName(name); // bd.setName(request.getParameter("name"));
	//bd.setAddr(addr);
	// 3. Getter Method를 호출해서 화면에출력
	//out.println("입력받은 이름:"+bd.getName()+"<br>");
	//out.println("입력받은 주소:"+bd.getAddr()+"<br>");
%>
<jsp:useBean id="bd" class="test.BeanDTO" scope="page"/>
<%-- <jsp:setProperty name="bd" property="name" value="<%=name %>"/>
<jsp:setProperty name="bd" property="addr" value="<%=addr %>"/> --%>
<jsp:setProperty name="bd" property="*"/>
<p>
<jsp:getProperty name="bd" property="name" />님 잘 오셨습니다.
</p>
회원님의 주소는 <jsp:getProperty name="bd" property="addr" /> 입니다.
<%-- <hr>
<b><%=bd.getName() %></b>님 잘 오셨습니다.
<b>제 주소는 <%=bd.getAddr() %></b>입니다. --%>
</body>
</html>