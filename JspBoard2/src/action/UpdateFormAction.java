package action;

import javax.servlet.http.*;
import pjh.board.*;
/*
 * 액션 클래스의 역할 (Spring 에서의 Controller)
 * 1. Jsp가 처리해야할 자바코드를 대신 처리
 * 2. 모델에 속한 클래스의 특정 method를 호출해서 결과를 리턴 받음
 * 3. 받은 결과를 jsp가 공유해서 사용할 수 있도록 '메모리'에 저장
 */

public class UpdateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//updateForm.jsp에서 전달받은 매개변수 처리
		//content.jsp > 글수정 -> updateForm.jsp?num=?&pageNum=?
		//파라미터는 content.jsp와 동일하기 때문에 동일한 코드를 사용
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO dbPro = new BoardDAO();
		BoardDTO article = dbPro.getArticle(num); // 조회수 증가 기능 없음	 
		
		
		// 처리 결과를 메모리에 저장
		request.setAttribute("article", article); // 수정하는 페이지로 이동필요
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
	
		return "/updateForm.jsp";
	}

}
