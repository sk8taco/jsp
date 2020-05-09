/**
 * xhr객체를 생성->요청->jsp로 요청(~.do)로 요청->응답=>콜백함수 실시간으로 출력하자
 */

var xhrObject;//xhr객체를 전역변수로 선언->모든 함수를 불러다 사용

//1.xhr객체를 생성->함수내부에서 var변수명=값 //지역
function createXHR(){
	if(window.XMLHttpRequest){
		  xhrObject=new XMLHttpRequest() //객체를 생성
		  //alert(xhrObject) //주소값을 확인
	  }
}

//2.중복id를 입력->이벤트처리->idCheck()를 이용
function idCheck(id){
	if(id==""){
		//var mem_id=document.getElementById("ducheck");
		var mem_id=$("ducheck")
		$("ducheck").innerHTML="<font color='red'><b>아이디를 먼저 입력요망</b></font>"
	    //document.regForm.mem_id.focus(); jquery를 배우기전
		$("mem_id").focus();
		return false;
	}
	//제대로 입력한 경우->서버에 요청->받아서 처리
	//1.xhr객체 얻어오기
	createXHR()
	alert(xhrObject)
	//항상 새로운 url값을 요청->서버의 메모리에 저장X=>새로 고침기능을 구현하는 방법
	var url="http://localhost:8080/JspMember/IdCheck.jsp?"+getParameterValues()
	alert(url)//요청을 확인
	//2.콜백함수를 지정
	xhrObject.onreadystatechange=resultProcess
	//3.open함수를 이용->서버에 요청준비 마무리
	xhrObject.open("Get",url,true)//비동기방식
	//4.send()요청
	xhrObject.send(null)
}
//3.파라미터값을 처리해주는 함수->jsp에서 서버->404에러가 유발
//서버캐시에 요청에 대한 정보기록=>항상 동일한 url로 요청을 하지 못하도록 코딩
function getParameterValues(){
	var mem_id=$("mem_id").value //document.regForm.mem_id.value
	//서버캐시에 등록X=>jsp 수정->화면에 출력
	return "mem_id="+mem_id+"&timestamp="+new Date().getTime()
}

//4.콜백함수
function resultProcess(){
   alert("resultProcess호출됨!")
   if(xhrObject.readyState==4){//서버가 클라이언트의 요청을 다 받았다면(ex 팩스문자열 보내기)
	   if(xhrObject.status==200){//서버가 클라이언트에게 제대로 전달했는지
		  var result=xhrObject.responseText;//태그+문자열->xml형식으로 전달받음
		  alert(result)
		  $("ducheck").innerHTML=result;
	   }
   }
}










