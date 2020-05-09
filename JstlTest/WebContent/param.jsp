<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//response.sendRedirect("http://www.naver.com"); // 외부사이트로 이동 (데이터 공유를 하지 않고 그냥 이동)
	//response.sendRedirect("chooseTag.jsp?name2=bk");
%>
<%--
	<c:redirect url="이동할 페이지명"/> 매개변수 없이 이동만 하는 경우(공유X)
	<c:redirect url="이동할 페이지명">
		<c:param name="전달할 매개변수명" value="전달할 값" />
	</c:redirect>
--%>
<c:redirect url="chooseTag.jsp">
		<c:param name="age2" value="20" />
</c:redirect>