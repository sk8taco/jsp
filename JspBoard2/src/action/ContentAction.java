package action;

import java.text.SimpleDateFormat;
import javax.servlet.http.*;
import pjh.board.*;


public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1.
		//list.jsp? 링크 content.do?num=3&pageNum=1 로 넘어오면
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 작성 형식
		
		BoardDAO dbPro = new BoardDAO();
		BoardDTO article = dbPro.getArticle(num);
		//update board set readcount =readcount+1 where num=?
		// select * from board where num=?
		//링크 문자열의 길이를 줄이기 위해서 
		
		int ref = article.getRef();
		int re_step=article.getRe_step();
		int re_level = article.getRe_level();
		System.out.println("content.jsp의 매개변수");
		System.out.println("ref:"+ref+",re_step:"+re_step+",re_level:"+re_level);
		System.out.println("pageNum:"+pageNum);
		
		request.setAttribute("num", num); // article에  있기에 안넘겨도 되긴 함
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("article",article); // 찾은 데이터 전달
		/*	article 안에 모두 포함되어 있는 세가지 속성
		request.setAttribute("ref",ref);
		request.setAttribute("re_step",re_step);
		request.setAttribute("re_level",re_level);
		*/
		request.setAttribute("sdf",sdf);
		
		
		
		return "/content.jsp";
	}

}
