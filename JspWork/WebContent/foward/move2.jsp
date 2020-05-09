<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>move.jsp</title>
</head>
<body>
<h1>요청을 판단해서 올바른 요청이라면 페이지를 이동시키는 역할</h1>
<%
	int su = 100;
	System.out.println("su:"+su);
	
	Date d = new Date(); //-> b.jsp로 전달하여 출력
	// 자바의 자료구조 -> HashMap(키,값)
	// 형식) request|session|application.setAttribute(key, 값) --> 서버로 넘기는 것
	request.setAttribute("total",su); //-> new Integer(su) 지만 자동 형변환 Wrapper key:total , su = 값
	request.setAttribute("cal",d); //<->request.getAttribute("cal");
	//----------------------------------------
	//request.setCharacterEncoding("utf-8"); // 한글처리
	String move = request.getParameter("move"); //a.jsp or b.jsp
	System.out.println("move:"+move);
	System.out.println(request.getAttribute("cal"));
	System.out.println(request.getAttribute("total"));
	//이동시킬 페이지가 존재 -> 이동 O or 존재 X -> 다시 입력을 받을 수 있도록 코딩
	if(move.equals("a.jsp")){
		//reponse.sendRedirect("a.jsp"); ==> 이동만 하는 역할이라면 이대로도 됨 
%>
<!-- forward 액션태그 page ="이동할페이지명"-->
<jsp:forward page ='a.jsp'/><br>
<%}else if(move.equals("b.jsp")){%>
<jsp:forward page ='b.jsp'/><br>
<%}else{ %>
<script>
	alert("페이지가 존재하지 않습니다. 다시 입력해주세요");
	location.href="forward.jsp";
</script>
<%} %>
</body>
</html>