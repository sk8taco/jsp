<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 전달용</title>
</head>
<body>
<!-- index.jsp -> /view/indexControl.jsp 
/view/indexCotrol.jsp?CONTROL (매개변수명)=값&(매개변수2)=값2&  // 매개변수 전달방식 
indexControl페이지로 넘기는데, 파라미터는 CONTROL, PAGENUM 두개를 넘길겁니다. 그 값은 intro 01 페이지입니다.  -->
<jsp:forward page="/view/indexControl.jsp"> 
	<jsp:param name="CONTROL" value ="intro"/>
	<jsp:param name="PAGENUM" value ="01"/>
</jsp:forward>
<!-- 액션 태그에는 눈에 보이지 않는 주석을 주어야 정보은닉이 가능하다. %-- --% 로 -->
<%--<jsp:forawrd|include page ="상대경로"> 
<jsp:param name="CONTROL" value ="intro"/>
	 <jsp:param(액션태그명) name="매개변수명" value="전달할 값">--%> 
</body>
</html>