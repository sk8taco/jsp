

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetDate
 */
@WebServlet("/GetDate")
public class GetDate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("웹상에서 get방식으로 자동으로 호출됨");
		//1. 어떤형태의 문서를 만들어서 보내줄지 결정 -> response 객체가 처리
		response.setContentType("text/html;charset=utf-8"); //html 문서로 처리 (한글)
		//2. Print Writer 클래스의 method 반환형을 통해서 얻어오기
		PrintWriter out = response.getWriter();
		out.println("<html><header></header>"); // document.write("<html>");
		out.println("<body>");
		//외추에 보여줄 내용
		out.println("<h2>Hello Servlet Test : getdate.jps --> GetDate.java 로 변경<br>");	
		//추가
		request.setCharacterEncoding("utf-8"); // 한글처리
		
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		out.println("name:"+name+",addr:"+addr);
		out.println("</body>");
		out.println("</html>");
	}
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
