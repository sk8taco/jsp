<%@page contentType="text/html;charset=UTF-8"%>
<%
	//웹상에서 강제로 접근할 수도 있음-> 인증처리해야함 -> session.setAttribute("idKey",mem_id);
	String mem_id=(String)session.getAttribute("idKey");
	System.out.println("mem_id:"+mem_id); //계정명 -> null : 로그인한 적이 없으면
	/// ----> 이 부분을 파일로 만들어서 불러오기 -> include 지시어 이용
%>
<html>
 <head>
  <TITLE> 로그인 </TITLE>
<link href="style.css" rel="stylesheet"
      type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="script.js">
</SCRIPT>
 </head>

 <body style="width:100%; margin:0px auto; text-align:center;" onload="document.login.mem_id.focus()" bgcolor="#FFFFCC">
 <center>
  <!-- mem_id의 상태에따라 로그인 처리 : 로그인을 안했으면 로그인페이지, 로그인 됐으면 넘어가면 됨-->
  <br><br><br>
  	
<%
	//Login.jsp -> LoginProc.jsp->LoginSuccess.jsp
	if(mem_id!=null){
%>
	<p>
		<b><%= mem_id %></b> 님 환영합니다.
	</p>
	<p>
		당신은 제한된 기능을 사용할 수 가 있습니다.
	</p>
		<!--
		회원수정 -> 간접적으로 값을 가져와서 , 특정 회원의 정보 수정을 가능하게 하는 방법
		회원탈퇴 -> 직접적으로 mem_id 값을 넘겨주는 방법
		  -->
		<a href="MemberUpdate.jsp?mem_id=">회원수정</a>
		<a href="DelCheckForm.jsp?mem_id=<%=mem_id%>">회원탈퇴</a>
		<a href="MemberList.jsp">회원리스트</a><!-- 관리자전용(admin) -->
		<a href="Logout.jsp">로그아웃</a>
<%		
	}else{ %>


  <!-- 로그인 안된 상태 -->
     <table>
    <form name="login" method="post" action="LoginProc.jsp">
     <tr>
		<td align="center" colspan="2">
		<h4>로그인</h4></td>
     </tr>

     <tr>
		<td>아이디</td>
		<td><INPUT TYPE="text" NAME="mem_id"></td>
     </tr>
     <tr>
		<td>비밀번호</td>
		<td><INPUT TYPE="password" NAME="mem_passwd"></td>
     </tr>
     <tr>
		<td colspan="2"><div align="center">
		<INPUT TYPE="button" value="로그인" onclick="loginCheck()">&nbsp;
		<INPUT TYPE="button" value="회원가입" onclick="memberReg()">
		</div>
		</td>
     </tr>
	 </form>
     </table>
     <% }  %>
 </center>
 </body>
</html>
