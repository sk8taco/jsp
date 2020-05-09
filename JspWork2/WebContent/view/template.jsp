<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String CONTROL = request.getParameter("CONTROL");
	String PAGENUM = request.getParameter("PAGENUM");
	System.out.println("template.jsp의 CONTROL:"+CONTROL+",PAGAENUM:"+PAGENUM);
	// 좌측메뉴의 jsp 조합을 보면 Left로 조합이 되어있다.
	String left="/module/"+CONTROL+"Left.jsp"; // 경로를 left 라는 변수에 저장
	// 본문내용 -> /view/intro_01.jsp
	String content="/view/"+CONTROL+"_"+PAGENUM+".jsp";
	System.out.println("left:"+left+",content:"+content); // debugging code
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>실질적인 메인페이지</title>
</head>
<body>
	<center>
		<table width="800px" height="600px" border="1" cellpadding="2" cellspacing="0">
			<!-- 상단메뉴 -->
			<tr height="50">
				<td colspan="2">
					<jsp:include page="/module/top.jsp" flush="false"/>
				</td>
			</tr>
			<!-- 좌측메뉴 ,본문 -->
			<tr height="500px">
				<td width="150" valign="top">
					<jsp:include page="<%=left %>" flush="false"/>
				</td>
				<td width="650" valign="top">
					<jsp:include page="<%=content %>" flush="false"/>
				</td>
			</tr>
			<!-- 하단메뉴  -->
		 	<tr height="50px">
				<td colspan="2">
					<jsp:include page="/module/bottom.jsp" flush="false"/>
				</td>
			</tr>
			
		</table>
	</center>
</body>
</html>