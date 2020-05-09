package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 글쓰기 버튼 클릭 -> /writeForm.do => action.WriteFormAction 호출
public class WriteFormAction implements CommandAction {

	
	// 모데ㄹ1에서 대신 처리해줬던 자바코드를 대행해주는 액션 클래스 -> writeForm.jsp
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.jsp 가 처리할 문장 대신 수행
		
		//list.jsp (글쓰기) -> 신규글, content.jsp(글상세보기) => 답변글
		int num=0, ref=1, re_step=0,re_level=0; // inesrtArticle(BoardDTO article);
		
		// content.jsp에서 매개변수가 전달되어 받은거라면, (답변 클릭해서 넘어온거라면)
		if(request.getParameter("num")!=null){ // 양수라면
			num=Integer.parseInt(request.getParameter("num"));
			ref=Integer.parseInt(request.getParameter("ref"));
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));
			System.out.println("content.jsp에서 넘어온 매개변수 확인");
			System.out.println("num:"+num+",ref:"+ref+",re_step:"+re_level);
		}		
		//2.처리결과 -> request 객체에 저장 (spring 에서는 ModelAndView 객체에 저장됨)
		request.setAttribute("num",num); // <-> request.getAttribute("num") -> ${num}
		request.setAttribute("ref",ref);
		request.setAttribute("re_step",re_step);
		request.setAttribute("re_level",re_level);		
		//3.이동할 페이지를 지정 (String 값을 넘김)
		return "/writeForm.jsp"; // ControllerAction 클래스가 받아서 리턴값/writeForm.jsp 로 이동시켜줌
	}

}
