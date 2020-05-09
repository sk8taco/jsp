package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//content.jsp -> deleteForm.jsp?num=2&pageNum=1
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		//확인코드 생략
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
				
		return "/deleteForm.jsp";
	}

}
