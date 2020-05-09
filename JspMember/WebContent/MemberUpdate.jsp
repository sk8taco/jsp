<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="hewon.*"%>
<html>
<head>
<title>회원수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600" > <!--  onLoad="regForm.mem_id.focus()" 회원수정에서는 필요 없는 부분-->
<br><br>
<%
	//Memberupdate.jsp?mem_id='nup' --> URL에 이렇게 값이 있는건 Get 방식으로 파라미터값을 전달하는 방법이다.
	//String mem_id=request.getParameter("mem_id"); --> parameter앖을 가져와서 전달 
	//둘다 실질적으론 같은 기능이다.
	
	String mem_id=(String)session.getAttribute("idKey"); // 메모리에서 불러오는 방식 (임시메모리가 아니다)
	System.out.println("MemberUpdate.jsp의 mem_id:"+mem_id);
	MemberDAO memMgr = new MemberDAO(); // method 호출을 위해 객체 생성
	MemberDTO mem = memMgr.getMember(mem_id);
%>
<table align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="MemberUpdateProc.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
          </tr>
          <tr> 
            <td width="16%">아이디</td>
            <td width="57%"> <%=mem.getMem_id() %></td>
		    <td width="27%">아이디를 적어 주세요.</td>
          </tr>
          <tr> 
            <td>패스워드</td>
            <td> <input type="password" name="mem_passwd" value ="<%=mem.getMem_passwd() %>"size="15"> </td>
            <td>패스워드를 적어주세요.</td>
          </tr>
          <tr> 
            <td>이름</td>
            <td> <input type="text" name="mem_name" value="<%=mem.getMem_name() %>" size="15"> </td>
            <td>고객실명을 적어주세요.</td>
          </tr>
          <tr> 
            <td>이메일</td>
            <td> <input type="text" name="mem_email" value="<%=mem.getMem_email() %>size="27"> </td>
            <td>이메일을 적어주세요.</td>
          </tr>
          <tr>  
            <td>전화번호</td> 
            <td> <input type="text" name="mem_phone" value="<%=mem.getMem_phone() %>" size="20"> </td>
            <td>연락처를 적어 주세요.</td>
          </tr>
		  <tr>  
            <td>우편번호</td>
            <td> <input type="text" name="mem_zipcode" value="<%=mem.getMem_zipcode() %>" size="7">
                 <input type="button" value="우편번호찾기" onClick="zipCheck()"></td>
            <td>우편번호를 검색 하세요.</td>
          </tr>
		  <tr>  
            <td>주소</td>
            <td><input type="text" name="mem_address" value="<%=mem.getMem_address() %>" size="70"></td>
            <td>주소를 적어 주세요.</td>
          </tr>
		  <tr>  
            <td>직업</td>
            <td><select name=mem_job>
 					<option value="0">선택하세요.
 					<option value="회사원">회사원
 					<option value="연구전문직">연구전문직
 					<option value="교수학생">교수학생
 					<option value="일반자영업">일반자영업
 					<option value="공무원">공무원
 					<option value="의료인">의료인
 					<option value="법조인">법조인
 					<option value="종교,언론,에술인">종교.언론/예술인
 					<option value="농,축,수산,광업인">농/축/수산/광업인
 					<option value="주부">주부
 					<option value="무직">무직
 					<option value="기타">기타
				  </select>
				  <script>
				  	document.regForm.mem_job.value="<%=mem.getMem_job() %>"; //JavaScript와 Java를 연결할 때 표현식을 많이 쓴다 
				  </script>
				  </td>
            <td>직업을 선택 하세요.</td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="수정완료"><!-- 수정이기 때문에 check()가 필요없음  / submit 해줘야 memberUpdate로 전달--> 
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
             <input type="reset" value="다시쓰기"> 
             <input type="button" value="수정취소" onclick="history.back()">
            </td>
          </tr>
          <!--  직접 입력 받는 것이 아닌 경우에 특정한 값을 전달 hidden 객체를 사용해서 전달한다
          		형식) <input type="hidden" name="매개변수명" value="전달할 값">
           -->
           <input type="hidden" name="mem_id" value="<%=mem_id %>">
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
