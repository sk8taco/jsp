package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 추가
import pjh.board.BoardDAO;
import java.util.*;

///list.do = action.ListAction
//각 액션클래스에서 공통으로 사용하는 메서드를 사용하기 위해서 상속(CommandAction)
public class ListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String pageNum=request.getParameter("pageNum");
		//추가(검색분야, 검색어)
		String search = request.getParameter("search");
		String searchtext = request.getParameter("searchtext");
		
		int count = 0; // 총 레코드 수

		List articleList = null;// 화면에 출력할 레코드를 저장할 변수
		BoardDAO dbPro = new BoardDAO();
		count = dbPro.getArticleSearchCount(search, searchtext);// select count(*) from board=>getMemberList()
		System.out.println("검색된 현재 레코드수(count)=>" + count);
		
		//페이징 처리 결과를 담을 Hashtable 객체 생성
		
		Hashtable<String, Integer> pgList = dbPro.pageList(pageNum, count);
		
		if (count > 0) { // startRow,endRow(X)=>pageSize(O)
			System.out.println(pgList.get("startRow")+","+pgList.get("endRow"));
			articleList = dbPro.getBoardArticles(pgList.get("startRow"), pgList.get("pageSize"), search, searchtext);// 첫번째 레코드번호, 끊어서보여줄갯수
		}else { 
			//count=0 일 때a
			articleList = Collections.EMPTY_LIST;
		}
		
		
		// 2.처리결과를 list.jsp에 전달 (메모리에 저장, setAttribute / 공유시키기 위해서)
		
		request.setAttribute("search",search);
		request.setAttribute("searchtext",searchtext);
		request.setAttribute("pgList",pgList);
		request.setAttribute("articleList",articleList);
		
		
		// 3.이동할 페이지명을 지정 -> return "경로를 포함해서 이동할 페이지명"

		return "/list.jsp";
	}

}
