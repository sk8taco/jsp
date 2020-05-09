<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hewon.MemberDAO"%>
<jsp:useBean id="memMgr"  class="hewon.MemberDAO" scope="page"/>
<%
	String mem_id=request.getParameter("mem_id");
	String mem_passwd = request.getParameter("mem_passwd");
	System.out.println("mem_id:"+mem_id+",mem_passwd:"+mem_passwd);
	
	//MemberDAO memMgr=new MemberDAO();
	boolean check = memMgr.loginCheck(mem_id,mem_passwd);
%>
<%
	//check -> LogiSuccess.jsp (인증화면), LogError.jsp(에러메세지)
	if(check){
		session.setAttribute("idKey",mem_id); // 메모리에 저장 -> request.getAttribute 로 얻어옴
		response.sendRedirect("LogSuccess.jsp");
		
	} else{//id가 없는 경우, passwd X
		response.sendRedirect("LogError.jsp");// 단순 이동
	}
%>