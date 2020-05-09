<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hewon.MemberDAO"
 %>
<%
	//추가 -> action = "deletePro.jsp?mem_id='nup'"
	String mem_id = request.getParameter("mem_id");
	String passwd=request.getParameter("passwd");
	System.out.println("deletePro.jsp의 mem_id:"+mem_id+",passwd:"+passwd);
	
	MemberDAO memMgr = new MemberDAO(); //탈퇴 메서드호출
	int check = memMgr.deleteMember(mem_id,passwd);
	System.out.println("deletePro.jsp의 회원삭제유무(check):"+check);
%>
<%
	if(check==1){ // 삭제 성공하면
		session.invalidate(); // 자동 세션 해제
%>
	<script>
		alert('<%=mem_id%>님 성공적으로탈퇴 처리 되었습니다.');
		location.href="Login.jsp"; // mem_id=>null > id,passwd 입력창으로 전환되서 이동
	</script>
<%	} else { %>
	<script>
		alert("비밀번호가 틀립니다. 다시 암호를 입력해주세요");
		history.go(-1); // history.back();
	</script>
<% } %>