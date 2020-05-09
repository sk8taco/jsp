<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if문 태그</title>
</head>
<body>
<%
	//int age=20;
	//String name="bk";
	//if(조건식) 실행문  if(age>19) => 형식: c:if test="조건식" or "${조건식}"
	// 즉 c(core) 태그의 속성 if를 사용하는데 조건식test를 쓸거야
%>
<c:set var="age" value="${20}"/>
<c:set var="name" value="${'bk'}"/> <!-- 문자를 표현언어로 넣을 때   -->
<c:if test="true">
	무조건 실행돼서 화면에 결과를 보여준다.<br>
</c:if>
<c:if test="${19<age}">
	당신의 나이는 19세 이상이군요.<br>
</c:if>

<c:if test="${name=='bk'}">
	name 파라미터 값은 ${name}입니다.<br>
</c:if>
<!-- if 태그는 else 구문을 처리해주는 속성이 없다. 그 반대의 조건을 따로 주는 c:if 문을 따로 적어주어야한다 -->
<c:if test="${name!='bk'}">
	name 파라미터 값은 bk가 아닌 ${name}입니다.<br>
</c:if>
<!-- 다중조건식 else if, switch~case 사용 -->
<ul>
<!-- choose 내부에는 c:if를 쓸수 없다. 대신 같은 기능인 c:when절을 넣어준다  -->
	<c:choose> 
		<c:when test="${param.name2=='bk'}">
			name2 파라미터값은 ${param.name2}입니다.<br>
		</c:when>
		<c:when test="${param.age2>18}">
			당신의 나이는 ${param.age2} 입니다.<br>
		</c:when>
		<c:otherwise>
			<li> 당신은 'bk'도 아니고 나이도 성인이 아니군요!</li>
		</c:otherwise>
	</c:choose>
	<!--
		http://localhost:8090/JstlTest/chooseTag.jsp?age2=20
		http://localhost:8090/JstlTest/chooseTag.jsp?name2=bk
		이렇게 get 방식으로 넘겨서 확인이 가능하다.
		
		<%-- *** ${param.매개변수} : request.getParameter("매개변수"); 와 같은 역할 --%>
	-->
</ul>



</body>
</html>