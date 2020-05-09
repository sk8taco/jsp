<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pjh.board.*" %>

<%
	// 한글처리
	request.setCharacterEncoding("utf-8");

	//BoardDTO 의 setter method 5개 + hidden 4개 + 2개(작성)
	//BoardDTO article = new BoardDTO();
	//BoardDAO 객체 필요
%>
<jsp:useBean id="article" class="pjh.board.BoardDTO"/>
<jsp:setProperty name="article" property="*"/> 
<!-- article의 모든 속성값을 빈에 입력 -->
<!-- 그 외에 시스템을 통해서 입력받을 값은 아래에 구현  -->
<%
	//정상적으로 수정이 되었을때, 수정이 된 레코드로 이동 -> 게시물이 수정된 페이지로 이동하라
	String pageNum= request.getParameter("pageNum");
	System.out.println("업데이트 전:"+pageNum);
	BoardDAO dbPro = new BoardDAO(); //updateArticle() 호출을 위한 객체
	int check = dbPro.updateArticle(article);
	//수정이 성공했다면
	if(check==1){
		//response.sendRedirect("listj.jsp");
		//http-equiv="Refresh" ==> 새로고침 옵션 content="초단위(몇초동안 멈춘후); url="이동페이지명";
		System.out.println(pageNum);
	
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<% } else{ %>
<script>
	alert("비밀번호가 맞지 않습니다.\n 다시 비밀번호를 확인해 주십시오");
	history.go(-1);
</script>
<% } %> 