<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인창을 실행</title>
<script>
	function test(){
		//형식) window.open(1.불러올 파일명 2.문서의타이틀 3.창의옵션(width,height,left,top))
		//window.open('./sub/send.html','w','width=400,height=300,left=500,top=150');
		//window.open('/ServletTest/HelloTest','w','width=400,height=300,left=500,top=150');
		window.open('/ServletTest/Notice','w','width=400,height=300,left=500,top=150');
	}
</script>
</head>
<body onload = "test()">
	<h2>Welcome To JspStudy Site!!</h2>
</body>
</html>