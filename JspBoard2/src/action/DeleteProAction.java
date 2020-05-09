package action;

import javax.servlet.http.*;
import pjh.board.*;

public class DeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//정상적으로 삭제가 되었을 때
		String pageNum= request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String passwd = request.getParameter("passwd");
		
		BoardDAO dbPro = new BoardDAO(); //deleteArticle() 호출을 위한 객체
		int check = dbPro.deleteArticle(num, passwd);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		request.setAttribute("check", check);
	
		return "/deletePro.jsp";
	}

}
