<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pjh.board.*" %>

<%
	//정상적으로 삭제가 되었을 때
	String pageNum= request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	
	BoardDAO dbPro = new BoardDAO(); //deleteArticle() 호출을 위한 객체
	int check = dbPro.deleteArticle(num, passwd);
	
	if(check==1){// 삭제가 성공했다면
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<% } else{ %>
<script>
	alert("비밀번호가 맞지 않습니다.\n 다시 비밀번호를 확인해 주십시오");
	history.go(-1);
</script>
<% } %> 