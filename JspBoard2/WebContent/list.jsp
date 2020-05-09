<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pjh.board.*,java.util.*,java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// Object -> Integer -> int => 메모리에서 꺼내오는 소스코드의 양을 줄일 수 있다.
	/* int currentPage = (Integer)request.getAttribute("currentPage"); 
	*  int count = (Integer)request.getAttribute("count");	 // ${count}
	*  Hastable pgList =(Hashtable)request.getAttribute("pgList");
	*  pgList.get("count") => ${pgList.count(키명)}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#e0ffff">
		<b>글목록(전체 글:${pgList.get("count")})</b> <!-- 여기선 단지 출력  -->
		<table width="700">
			<tr>
				<td align="right" bgcolor="#b0e0e6"><a
					href="/JspBoard2/writeForm.do">글쓰기</a></td>
			</tr>
		</table>		
		<c:if test="${pgList.count ==0}">
			<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${pgList.count>0}">
			<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
				<tr height="30" bgcolor="#b0e0e6">
					<td align="center" width="50">번 호</td>
					<td align="center" width="250">제 목</td>
					<td align="center" width="100">작성자</td>
					<td align="center" width="150">작성일</td>
					<td align="center" width="50">조 회</td>
					<td align="center" width="100">IP</td>
				</tr>
				<!-- 실질적으로 레코드를 출력시켜주는 부분 -->
				<c:set var="number" value="${pgList.number}"/> <!-- 매번 pgList.number 를 쓸 필요가 없도록 set -->
				<c:forEach var="article" items="${articleList}">
					<tr height="30" onmouseover="this.style.backgroundColor='#fff'" onmouseout="this.style.backgroundColor='#e0ffff'">
						<!--하나씩 감소하면서 출력하는 게시물번호  -->
						<td align="center" width="50">
						<c:out value="${number}" />
       					<c:set var="number"  value="${number-1}" />
						</td>
						<td width="250">
							<!-- 답변글인 경우 먼저 답변이미지를 부착시켜주는 코드부분 --> 
							<c:if test="${article.re_level > 0}">
								<img src="images/level.gif" width="${7*article.re_level}" height="16">
								<img src="images/re.gif">
							</c:if> 
							<c:if test="${article.re_level == 0}">
							<!-- 신규글  -->
								<img src="images/level.gif" width="${7*article.re_level}" height="16">
							</c:if> 
							<!-- 글상세보기 num(게시물번호),pageNum(페이지번호)--> 
							<a href="/JspBoard2/content.do?num=${article.num}&pageNum=${pgList.currentPage}">${article.subject}</a> 
							<c:if test="${article.readcount>=20}">
								<img src="images/hot.gif" border="0" height="16">
							</c:if>
						</td>
						<td align="center" width="100">
							<a href="mailto:${article.email}">${article.writer}</a></td>
						<td align="center" width="150">
							<fmt:formatDate value="${article.reg_date}" timeStyle="medium" pattern="yy-MM-dd (hh:mm)"/>							
						</td>
						<td align="center" width="50">${article.readcount}</td>
						<td align="center" width="100">${article.ip}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<div class="paging">
			<!-- 페이징 처리  -->
			<!-- //1.총 페이지 수 구하기 -->
			<c:if test="${pgList.startPage > pgList.blockSize }">
				<a href="/JspBoard2/list.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&serchtext=${searchtext}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pgList.startPage}" end="${pgList.endPage}">
				<a href="/JspBoard2/list.do?pageNum=${i}&search=${search}&serchtext=${searchtext}">
					<c:if test="${pgList.currentPage==i}">						
						<font color="red"><b>[${i}]</b></font>
					</c:if> 
					<c:if test="${pgList.currentPage!=i}">
						${i}
					</c:if>
				</a>
			</c:forEach>
			<c:if test="${pgList.endPage < pgList.pageCount }">
				<a href="/JspBoard2/list.do?pageNum=${pgList.startPage+pgList.blockSize }&search=${search}&serchtext=${searchtext}">[다음]</a>
			</c:if>
		</div>
		<div class="search_box">
			<!--검색어 추가  -->
			<form name="test" action="/JspBoard2/list.do">
				<select name="search"><!-- 검색분야 -->
					<option value="subject">제목</option>
					<option value="subject_content">제목+본문</option>
					<option value="writer">작성자</option>
				</select>
				<!-- 검색어 --> 
				<input type="text" size="15" name="searchtext">&nbsp;
				<input type="submit" value="검색">
			</form>
		</div>
</body>
</html>