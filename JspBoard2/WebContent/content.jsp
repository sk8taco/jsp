<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#e0ffff">  
<b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">글번호</td>
    <td align="center" width="125" align="center">
	     ${article.num}<%-- <%=article.getNum() %> --%>
	</td>
    <td align="center" width="125" bgcolor="#b0e0e6">조회수</td>
    <td align="center" width="125" align="center">
	     ${article.readcount}<%-- <%=article.getReadcount() %></td> --%>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">작성자</td>
    <td align="center" width="125" align="center">
	     ${article.writer}<%-- <%=article.getWriter() %> --%>
	</td>
    <td align="center" width="125" bgcolor="#b0e0e6" >작성일</td>
    <td align="center" width="125" align="center">
	     ${article.reg_date}<%-- <%=sdf.format(article.getReg_date()) %></td> --%>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     ${article.subject}<%-- <%=article.getSubject() %> --%>
	</td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="#b0e0e6">글내용</td>
    <td align="left" width="375" colspan="3"><pre>${article.content}<%-- <%=article.getContent() %> --%></pre></td>
  </tr>
  <tr height="30">
  <!--onclick = "document.location.href='요청페이지.jps?매개변수=값&매개변수2=값2'"  -->      
    <td colspan="4" bgcolor="#b0e0e6" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='/JspBoard2/updateForm.do?num=${num}<%-- <%=article.getNum()%> --%>&pageNum=${pageNum}<%-- <%=pageNum%> --%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='/JspBoard2/deleteForm.do?num=${num}<%-- <%=article.getNum()%> --%>&pageNum=${pageNum}<%-- <%=pageNum%> --%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="답글쓰기" 
       onclick="document.location.href='/JspBoard2/writeForm.do?num=${num}<%-- <%=num%> --%>&ref=${article.ref}<%-- <%=ref%> --%>&re_step=${article.re_step}<%-- <%=re_step%> --%>&re_level=${article.re_level}<%-- <%=re_level%> --%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='/JspBoard2/list.do?${pageNum}<%-- <%=pageNum%> --%>'">
    </td>
  </tr>
</table>    
</form>      
</body>
</html>      
