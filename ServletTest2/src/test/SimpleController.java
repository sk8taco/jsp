package test;

import java.io.IOException; // 입출력

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; // 서블릿을 실행
import javax.servlet.annotation.WebServlet; // 어노테이션 때문에 필요
import javax.servlet.http.*; // 웹상에서 어떻게 서블릿을 요청하는지 (경로, 프로토콜 정보)

/**
 * Servlet implementation class SimpleController
 */
@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
	
	// Get or Post 방식으로 요청에 상관없이 둘 다 처리할 수 있도록 method를 따로 작성
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//1. 요청명령어를 입력받아서 분석 -> 매개변수 :type
		String type = request.getParameter("type");
		System.out.println("type:"+type);
		//ex) greeting : 안녕하세요 하고 왔는데 date=> 오늘날짜 출력 하는건 맞지 않다. > invalid Type 메세지를 출력
		//2. 요청명령어에 따른 요청 기능을 구현-> 요청처리 클래스의 객체생성 -> 처리(화면에 보여주는 것)
		Object resultObject = null; // String or java.util.Date 둘다 처리하기 위한 Object 선언
		if((type==null)||(type.contentEquals("greeting"))) {
			resultObject = "안녕하세요"; // 자식(String) -> Object 로 자동 형변환
		}else if(type.contentEquals("date")) {
			resultObject = new java.util.Date();
		}else {
			resultObject = "정확하게 다시 한번 알려주세요!!";
		}
		
		//3. 처리결과를 simpleview.jsp에 전송 --> 화면에 출력
		request.setAttribute("result",resultObject);
		
		//4. forward 액션태그를 사용(jsp) 할수 없기때문에, forward 시켜주는 객체가 필요 : RequestDispatcher
		// dispatcher : 데이터를 공유 받아서 이동할 페이지의 정보를 가진 각체
		RequestDispatcher dispatcher = request.getRequestDispatcher("/simpleview.jsp"); // 전송할 페이지명
																// root > webcontents
		
		//5. forward : 데이터를 공유하면서 페이지를 이동시키는 기능 dispatcher 객체를 통해서만 사용이 가능하다 (모델2)
		dispatcher.forward(request, response);
		
	}
	
}
