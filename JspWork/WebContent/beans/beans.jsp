<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈즈가 나온 배경</title>
</head>
<body>
<%!
//입력 > 매개변수를 전달 > 각각의 값을 필드별로 저장하는 변수(멤버변수(저장(테이블의 필드에 저장)
// 선언문 > 변수를 선언, 메서드를 작성

String str = "선언문"; //웹상에서 입력받을 값이 저장되는 ㄴ멤버변수
String addr = "";


//Web에서는 Constructor로 값을 넣지 않고, Setter, Getter를 이용한다.
// Java 구문과 화면구현 구문이 한 문서에 섞이면
// 1. 화면 디자인이 어렵다 (복잡)
// 2. 기존의 코딩을 다른 사이트에 적용하기가 어렵다.(재사용성이 떨어진다)
public void setStr(String s){ // 입력-> 저장
	str = s;
	System.out.println("setStr()호출");
}
public void setAddr(String a){
	addr = a;
	System.out.println("setAddr()호출");
}
public String getStr(){
	return str;
}
public String getAddr(){
	return addr;
}
%>
<p>메서드 호출 (Setter Method):<% setStr("자바빈즈"); %></p>
<p>저장된 값 출력(Getter Method):<h1><%=getStr() %></h1> 
</body>
</html>