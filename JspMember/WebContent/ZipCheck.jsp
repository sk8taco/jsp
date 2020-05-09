<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*,hewon.*"%>
<!DOCTYPE html>
<jsp:useBean id="memMgr" class="hewon.MemberDAO"/> <!-- 나 Bean 쓸거에여 선언  -->
<%
	//script.js 에서 ZipCheck() 실행 -> ZipCheck.jsp?check=y 을 가져옴
	request.setCharacterEncoding("utf-8"); //한글처리를 해주어야함
	String check = request.getParameter("check"); // y  > 우편번호를 눌렀을때 전달되는 값  ---> self로
	String area3 = request.getParameter("area3"); // 검색어를 입력하고 검색버튼을 클릭했을때 전달되는 값 ---> self로
	System.out.println("check:"+check+",area3:"+area3);//디버깅 코드
	Vector<ZipcodeDTO> zipcodeList = memMgr.zipcodeRead(area3); 
	int totalList = zipcodeList.size();
	System.out.println("검색된 총 레코드 수 (totalList)"+totalList);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
//동이름을 체크할 함수선언
  function dongCheck(){
	  if(document.zipForm.area3.value==""){ //입력을 안했을 경우에
		  alert("동이름을 먼저 입력하세요!");
		  document.zipForm.area3.focus(); // 다시 포커스
		  return;
	  }
	  document.zipForm.submit(); // document.폼객체명.submit() 전송
  }
 //검색된 레코드 중에서 내 주소와 가장 가까운 주소 링크를 클링할때 호출할 함수를 선언
 //자바스크립트 -> 부모창 (opener)--> 자식창(self.close())
 //형식 ) opener.document.폼객체명.입력양식객체명.속성 = 값
  function sendAddress(zipcode, area1,area2,area3,area4){
	 var address = area1+" "+area2+" "+area3+" "+area4
	 opener.document.regForm.mem_zipcode.value=zipcode;
	 opener.document.regForm.mem_address.value=address;
	 self.close(); // self -> ZipCheck.jsp 창(자식창)
	 
 }
</script>
</head>
<body bgcolor="#FFFFCC">
  <center>
    <b>우편번호 찾기</b>
    <table>
  <!-- 
  	셀프호출 
  	검색어를 입력해서 자기자신의 페이지가 처리하여 자신의 페이지에 뿌려줌 (다른 페이지로의 전환이 없음)
  -->
   <form name="zipForm" method="post"action="ZipCheck.jsp">  
        <tr>
        <td><br>
        동이름 입력:<input type="text" name="area3">
        <input type="button" value="검색" onclick="dongCheck()">
        </td>
        </tr>    
        <input type="hidden" name="check" value="n"> 
        <!-- hidden : 데이터르 전송하는 방법의 일종으로 post 방식처럼 url값에  전송 데이터값을 보여주지 않고 전송시키는 방법(입력받지않고 전달)  
        	 check가 매개변수 n이 값 / check=y(검색전)  검색버튼클릭 -> check=n (변경) 
        -->
   </form>
        <%
        	//검색어를 입력하고 검색버튼을 눌렀다면
        	if(check.equals("n")){
        		if(zipcodeList.isEmpty()){ //검색된 레코드가 없다면
        			//if(zipcodeList.size()==0)
        %>
       <tr><td align="center">
            <br>검색된 레코드가 없습니다.
          </td>
      </tr>
      <% }else{ %>
      %>
   <tr><td align="center"><br>
   *검색후 ,아래 우편번호를 클릭하면 자동으로
     입력됩니다</td></tr>
     <%
     	for(int i=0; i<totalList;i++){
     		ZipcodeDTO zipBean = zipcodeList.elementAt(i); // zipcodeList.get(i);
     		String tempZipcode = zipBean.getZipcode(); // 우편번호
     		String tempArea1 = zipBean.getArea1().trim(); // "서울 " <<-- 공백이 있을 수 있음
     		String tempArea2 = zipBean.getArea2().trim(); // 구
     		String tempArea3 = zipBean.getArea3().trim(); // 동
     		String tempArea4 = zipBean.getArea4().trim(); // 나머지
     %>
  <tr><td>
  <a href="JavaScript:sendAddress('<%=tempZipcode %>',
  								'<%=tempArea1 %>',
  								'<%=tempArea2 %>',
  								'<%=tempArea3 %>',
  								'<%=tempArea4 %>')">
  	<%=tempZipcode %>&nbsp;<%=tempArea1 %>&nbsp;<%=tempArea2 %>&nbsp;<%=tempArea3 %>&nbsp;<%=tempArea4 %>
  </a><br>
  <%
     		}//for
        }//inner if
  	}// outer if
  %>
 
    </td></tr>
    <tr><td align="center"><br>
<a href="JavaScript:this.close()">닫기</a>                      
    </table>
  </center>
</body>
</html>