<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hewon.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	//Register.jsp(회원가입창)->searchWord.js->idCheck() => idCheck.jsp?mem_id='kkk'&timestamp=?
	//xhrObject가  xml 형태로 받을 수 있도록 text/xml형태로 변환
	//이유는?  전달될 때 태그와  문자열이 혼합된 형태로 받기위해서
	response.setContentType("text/xml;charset=utf-8");
	
	String outString=""; // xhr 객체에 전달할 내용을 담은 변수 선언 (태그+문자열);
	
	String mem_id=request.getParameter("mem_id");
	System.out.println("IdCheck.jsp에서 넘어온 매개변수 (mem_id):"+mem_id);
	//MemberDAO -> checkID() 
	MemberDAO memMgr = new MemberDAO();
	boolean check = memMgr.checkId(mem_id);
	System.out.println("IdCheck.jsp의 check:"+check);
%>
<%
	if(check){//이미 아이디가 존재하는 경우
		outString  ="<font color='#f00;'><b>이미 존재하는 아이디</b></font>";		
	}else{//id가 없다면 -> 사용이 가능하다면
		outString  ="<font color='#00f;'><b>는 사용 가능한 아이디 입니다.</b></font>";
	}
	//xhr 객체에게 전달
	out.println(outString);
	System.out.println(outString); // 디버깅용 콘솔출력
%>
</html>