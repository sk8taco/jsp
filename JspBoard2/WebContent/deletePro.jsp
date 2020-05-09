<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pjh.board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check ==1 }">
	<script>
		alert("삭제가 성공적으로 이루어졌습니다. 게시판으로 돌아갑니다");
	</script>
	<meta http-equiv="Refresh" content="0;url=/JspBoard2/list.do?pageNum=${pageNum }">
</c:if>
<c:if test="${check !=1 }">
	<script>
		alert("비밀번호가 맞지 않습니다.\n 다시 비밀번호를 확인해 주십시오");
		history.go(-1);
	</script>	
</c:if>
