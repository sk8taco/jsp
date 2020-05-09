package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 추가
import pjh.board.BoardDAO;
import java.util.*;

///list.do = action.ListAction
//각 액션클래스에서 공통으로 사용하는 메서드를 사용하기 위해서 상속(CommandAction)
public class ListAction2 implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		// 1.jsp 에서 처리했던 자바코드를 액션클래스에서 대신 처리함

		int pageSize = 10;// numPerPage(페이지당 보여주는 게시물수(=레코드수))
		int blockSize = 3;// pagePerBlock(블럭당 보여주는 페이지수)		

		// 페이징 처리에 해당하는 환경설정을 다 코딩->게시판은 처음 실행시키면 ->무조건 1페이지부터 출력
		String pageNum = request.getParameter("pageNum"); // 처음엔 pageNum을 가져올 수 없음
		if (pageNum == null) {
			pageNum = "1";// default(무조건 1페이지는 선택하지 않아도 보여줘야 되기때문에)
		}
		// 화면에 계산해서 페이지를 출력시키기위해서 정수가 되야하기때문에
		int currentPage = Integer.parseInt(pageNum);// 현재페이지->nowPage
		// limit ?,? (1-1)*10+1=1,(2-1)*10+1=11,(3-1)*10+1=21
		
		
		int startRow = (currentPage - 1) * pageSize + 1;// 시작 레코드번호
		int endRow = currentPage * pageSize;// 1*10=10,2*1=20,30
		int count = 0;// 총레코드수
		int number = 0;// beginPerPage;(페이지별로 시작하는 맨 처음에 나오는 게시물번호)
		List articleList = null;// 화면에 출력할 레코드를 저장할 변수
		BoardDAO dbPro = new BoardDAO();
		count = dbPro.getArticleCount();// select count(*) from board=>getMemberList()
		System.out.println("현재 레코드수(count)=>" + count);

		if (count > 0) { // startRow,endRow(X)=>pageSize(O)
			articleList = dbPro.getArticles(startRow, pageSize);// 첫번째 레코드번호, 끊어서보여줄갯수
		}else { 
			//count=0 일 때
			articleList = Collections.EMPTY_LIST;
		}
		// 122-(1-1)*10=>122,121,120,,,
		// 122-(2-1)*10=>122-10=>112,111,110,,,
		number = count - (currentPage - 1) * pageSize;
		System.out.println("페이지별 number=>" + number);
		
		
		// 2.처리결과를 list.jsp에 전달 (메모리에 저장, setAttribute / 공유시키기 위해서)
		request.setAttribute("currentPage",currentPage);
		request.setAttribute("startRow",startRow);
		request.setAttribute("count",count);
		request.setAttribute("pageSize",pageSize);
		request.setAttribute("blockSize",blockSize);
		request.setAttribute("number",number);
		request.setAttribute("articleList",articleList);
		
		
		// 3.이동할 페이지명을 지정 -> return "경로를 포함해서 이동할 페이지명"

		return "/list.jsp";
	}

}
