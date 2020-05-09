<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hewon.*" %>
<%
	//RegisterProc.jsp => MemberInsert.jsp
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="hewon.MemberDTO"/>
<jsp:setProperty name="member" property="*"/>    
<%
	//호원가입 시켜주는 method 호출
	MemberDAO memMgr=new MemberDAO();
	boolean check = memMgr.memberInsert(member);
	System.out.println("MemberInsert.jsp의 check:"+check);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#ffc">
<p>
<center>
<%
	if(check){
		out.println("<b>처음으로 회원가입을 축하드립니다.</b><br>");
		out.println("<a href=Login.jsp>로그인</a>");
	}else{
		out.println("<b>다시 입력하여 주십시오</b><br>");
		out.println("<a href=register.jsp>다시 가입</a>");
	}
%>
</center>
</p>

</body>
</html>