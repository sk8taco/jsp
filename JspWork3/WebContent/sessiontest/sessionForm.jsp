<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session내장객체</title>
</head>
<body>
<%
	//회원가입이 이미 된 상태라고 보자->인증성공
	String id = request.getParameter("id");
	String passwd = request.getParameter("psswd");
	System.out.println("id:"+id+",passwd:"+passwd);
	
	//제대로 넘어 왔다면 
	//Oracle, MySql 등으로 -> member > sql 문으로 체크
	
	session.setAttribute("idKey",id); // 유지되는 시간 default:30분 <-> session.getAttribute("키명");
	session.setMaxInactiveInterval(60);//세션 유지 시간 설정 : 1분
%>
   <form method="post" action="sessionTest1.jsp">
      id:<input type="text" name="id"><p>
      pw:<input type="password" name="passwd"><p>
     <input type="submit" value="로그인">
   </form>
</body>
</html>



