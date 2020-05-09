<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

   
<body bgcolor="#e0ffff">  
<b>글쓰기</b>
<br><!-- input type="submit" 의 처리 > onsubmit="return 호출할 함수명()"  
		호출할 함수에서 false 값을 리턴 받으면 onsubmit="return false" 로 변경되어 '실패'로 처리된다.
		호출할 함수내에서 true 값을 받아야만 onsubmit ="return true" 로 되어 '성공'처리 된다.
		-->

<form method="post" name="writeform" action="/JspBoard2/writePro.do" onsubmit="return writeSave()">

<input type="hidden" name="num" value="${num}"/>
<input type="hidden" name="ref" value="${ref}"/>
<input type="hidden" name="re_step" value="${re_step}"/>
<input type="hidden" name="re_level" value="${re_level}"/>

<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">
   <tr>
    <td align="right" colspan="2" bgcolor="#b0e0e6">
	    <a href="/JspBoard2/list.do"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center">이 름</td>
    <td  width="330">
       <input type="text" size="10" maxlength="10" name="writer"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >제 목</td>
    <td  width="330">
       <c:if test="${num==0}">
       	<input type="text" size="40" maxlength="50" name="subject">
       </c:if>
       <c:if test="${num!=0}">
       	<input type="text" size="40" maxlength="50" name="subject" value="[re]">
       </c:if>
    </td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center">Email</td>
    <td  width="330">
       <input type="text" size="40" maxlength="30" name="email" ></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >내 용</td>
    <td  width="330" >
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="#b0e0e6" align="center"> 
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='/JspBoard2/list.do'">
</td></tr></table>    
</form>      
</body>
</html>      
