/**
 * xhr객체를 생성 -> 요청 -> jsp로 요청(~.do)로 요청
 */

var xhrObject; // 전역변수 선언 -> 모든 함수에서 불러서 사용 가능

//1.xhr객체를 생성->함수내부에서 var를 쓰면 지역변수가 되어서 함수가 종료되는 그 변수는 날아감
function createXHR(){
	if(window.XMLHttpRequest){
		xhrObject = new XMLHttpRequest(); // 객체생성
		alert(xhrObject); // 주소값 확인
	}
}
//2.중복된 id 입력 -> 이벤트처리 -> idCheck() 를 이용
function idCheck(id){
	if(id==""){
		//var mem_id = document.getElemnetById("doucheck");
		//예전 버전
		var mem_id = $("doucheck")
		$("doucheck").innerHTML="<font color='#f00'><b>아이디를 먼저 입력하세요</b></font>";
		//document.regForm.mem_id.focus();  <<-- jQuery 사용 전 
		$("mem_id").focus();
		return false;
	}
	//제대로 입력한 경우 -> 서버에 요청 -> 받아서 처리
	// 1. xhr 객체 얻어오기
	createXHR()
	
	// 항상 새로운 url 값을 요청 -> 서버의 메모리에 저장되지 않음 --> 새로 고침 기능을 구현하는 방법
	var url="http://localhost:8090/JspMember/IdCheck.jsp?"+getParameterValues() //~.do
	alert(url); //요청확인
	// 2. 콜백함수 지정
	xhrObject.onreadystatechange=resultProcess
		// 3. open함수를 이용-> 서버 요청 준비를 마무리
	xhrObject.open("Get",url,true)//비동기방식
	//4.send()요청
	xhrObject.send(null)
}	

//3.parameter 값을 처리해주는 함수 
//-> jsp에서 서버로 넘어갈때 404 에러가 발생 , 서버캐시에 요청에 대한 정보가 기록되고 남아있음
//-> 변경사항이 바로바로 반영되지 않음 --> 항상 동일안 url로 요청을 하지 못하도록 코딩
function getParameterValues(){
	var mem_id = $("mem_id").value
	//서버캐시에 등록되지 않도록
	return "mem_id="+mem_id+"&timestamp="+new Date().getTime();
	
}

//4.콜백함수
function resultProcess(){
	   alert("resultProcess호출됨!")
	   if(xhrObject.readyState==4){//서버가 클라이언트의 요청을 다 받았다면(ex 팩스문자열 보내기)
		   if(xhrObject.status==200){//서버가 클라이언트에게 제대로 전달했는지
			  var result=xhrObject.responseText;//태그+문자열->xml형식으로 전달받음
			  alert(result)
			 $("doucheck").innerHTML=result;
		   }
	   }
	}
