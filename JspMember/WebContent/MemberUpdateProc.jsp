<%@ page contentType="text/html;charset=UTF-8" import="hewon.*" %>
<%
	//MemberUpdate.jsp -> MemberUpdateProc.jsp
	request.setCharacterEncoding("utf-8");	
%>
<jsp:useBean id="member" class="hewon.MemberDTO"/>
<jsp:setProperty name="member" property="*"/>
<%
	MemberDAO memMgr=new MemberDAO(); //회원수정할 method 호출
	boolean check = memMgr.memberUpdate(member);
	System.out.println("MemberUpdateProc.jsp의 회원 수정 유무 check:"+check);
%>
<html>
<head>
<meta charset="utf-8">
</head>
<body bgcolor="#ffc">
<br>
<center>
<%
	if(check){//회원가입에 성공했다면
%>
	<script>
		alert("성공적으로 수정되었습니다.");
		location.href="Login.jsp"; // 아직 로그아웃은 하지 않은 상태 -> 회원수정 링크를 클릭할 수 있는 페이지로
	</script>
<%	}else{ %>
	<script>
		alert("수정도중 에러가 발생되었습니다.");
		history.back();
	</script>		
<%	} %>

</center>
</body>
</html>
