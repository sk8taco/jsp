package action;


import javax.servlet.http.*;
import pjh.board.*;
import java.sql.Timestamp;


//WriteProAction 과 거의 동일
public class UpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		String pageNum= request.getParameter("pageNum");
		
		BoardDTO article = new BoardDTO();		
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setWriter(request.getParameter("writer"));	
		article.setEmail(request.getParameter("email"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setPasswd(request.getParameter("passwd"));	
		/* 수정하면 안되는 부분
		 * article.setReg_date(new Timestamp(System.currentTimeMillis()));
		 * //ref,re_step,re_level
		 * article.setRef(Integer.parseInt(request.getParameter("ref")));
		 * article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		 * article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		 * article.setIp(request.getRemoteAddr());
		 */
		
		/*
		 * //정상적으로 수정이 되었을때, 수정이 된 레코드로 이동 -> 게시물이 수정된 페이지로 이동하라 
		 * System.out.println("업데이트 전:"+pageNum);
		 */
		
		BoardDAO dbPro = new BoardDAO(); //updateArticle() 호출을 위한 객체
		int check = dbPro.updateArticle(article);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check",check);		
		
		return "/updatePro.jsp";
		
	}

}
