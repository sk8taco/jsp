<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 디자인 목적이 아니어서 html 필요없음
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->
<%
	// /view/indexControl.jsp?CONTROL=intro&PAGENUM=01 ==> URL창에 이렇게 찍힐것
	String CONTROL = null;
	String PAGENUM = null;

	try{
		CONTROL = request.getParameter("CONTROL");
		PAGENUM = request.getParameter("PAGENUM");
		
		// setAttribute() , getAttribute 와 getParameter는 다르다
		// 구분하여 사욯할것, Attribute 는 set으로 서버에 저장하고 get으로 불러오는 것
		System.out.println("CONTROL:"+CONTROL+",PAGAENUM:"+PAGENUM);
		// 중간에 문제가 발생해서 매개변수를 전달 못받는 경우
		//intro_01.jsp를 못받음
		if(CONTROL.equals(null)){
			CONTROL ="intro";
		}
		if(PAGENUM.equals(null)){
			PAGENUM ="01";
		}
	}catch (Exception e){
		e.printStackTrace();
	}
%>
<jsp:forward page="/view/template.jsp"> 
	<jsp:param name="CONTROL" value ="<%=CONTROL %>"/>
	<jsp:param name="PAGENUM" value ="<%=PAGENUM %>"/>
</jsp:forward>