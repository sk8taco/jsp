<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
	// java.util.HashMap map = new java.util.HashMap(); // 세션처리와 연관, 메모리에 저장
	//request.setCharacterEncoding("utf-8");
	//response.setContentType("text/html; charset=utf-8");
	//requestEncoding(액션태그명) value="캐릭터셋";
%>
<fmt:requestEncoding value="utf-8"/>
<c:set var="map" value="<%=new java.util.HashMap() %>"/>
<html>
<head>
<meta charset="UTF-8">
<title>setTage의 2번째 예제</title>
</head>
<body>
<%--
	액션태그의 주석을 달 때 사용
	target(객체명(어떤 객체에 저장할 것인지) > 만들어져있는 객체변수명),
		
		==> 외부에서 만들어진 객체를 불러오는 경우엔 ${객체명} 으로 인식을 시켜주어야 한다
	
	property(속성명 > 멤버변수 지정 
		-> jsp:setProperty name="객체명" value="값"
	value(객체의 값을 저장할 때 필요로 하는 속성)
	
	==> map.put("name", "박종혁"); map.get("name");
--%>

<c:set target="${map}" property="name" value="박종혁"/>
변수 map에 저장된 name값:${map.name}<br>
변수 map에 저장된 name값:${map['name']}<br>
변수 map에 저장된 name값:${map["name"]}<br>

<form method="post" action="setTag2.jsp"> <!-- action="test.jsp" -->
	이름:<input type="text" name="name">
	<input type="submit" value="전송">
</form>
<hr>
이름은 <%=request.getParameter("name") %>입니다.
이름은(el) ${param.name} 입니다.
<!-- param은 el 언어에 내장된 내장객체 : 매개변수를 받을때 관여하는 내장객체(request대용 > 이건 jsp 내장객체) -->

</body>
</html>