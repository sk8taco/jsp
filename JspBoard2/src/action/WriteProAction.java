package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import pjh.board.*;


public class WriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	// 한글처리
	request.setCharacterEncoding("utf-8");

	/*
		BoardDTO 의 setter method 5개 + hidden 4개 + 2개(작성)
		BoardDTO article = new BoardDTO();
		BoardDAO 객체 필요
		
		<jsp:useBean id="article" class="pjh.board.BoardDTO"/>
		<jsp:setProperty name="article" property="*"/> 
	*/
	
	BoardDTO article = new BoardDTO();
	article.setNum(Integer.parseInt(request.getParameter("num")));
	article.setWriter(request.getParameter("writer"));	
	article.setEmail(request.getParameter("email"));
	article.setSubject(request.getParameter("subject"));
	article.setPasswd(request.getParameter("passwd"));	
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	//ref,re_step,re_level
	article.setRef(Integer.parseInt(request.getParameter("ref")));
	article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
	article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
	article.setContent(request.getParameter("content"));
	article.setIp(request.getRemoteAddr());
	//readcount --> default로 설정한 관계로 자동으로 0이 들어감
	
	
	BoardDAO dbPro = new BoardDAO();
	dbPro.insertArticle(article); //데이터를 article 객체에 넣고, 그 객체를  BoardDAO에  결합 --> DB에 저장  
	// 3. / 데이터는 공유되는게 아님 /--> WritePro.jsp로 가서 list.jsp로 이동
	return "/writePro.jsp";
	}

}
