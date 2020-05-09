<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp, pjh.board.*" %>

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
	//작성날짜 , ip주소
	Timestamp temp = new Timestamp(System.currentTimeMillis());
	article.setReg_date(temp);
	article.setIp(request.getRemoteAddr()); // 원격 아이피 주소 저장
	BoardDAO dbPro = new BoardDAO();
	dbPro.insertArticle(article);
	// 데이터를 공유하면서 이동할 필요 없이, 그냥 이동
	response.sendRedirect("list.jsp");
%>
 