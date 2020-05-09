/*
 * Servlet > Server Side Applet (서버내부에서 실행되는 웹프로그램) => 브라우저에 전송하여 결과를 봄
 * 			 Client Side > JavaScript (Browser 실행) 
 */

import java.io.IOException; // 입출력 예외처리
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig; //Configuration :  Servlet 환경설정에 관련된 클래스
import javax.servlet.ServletException; // Exception : Servlet 오류 예외처리 클래스
import javax.servlet.annotation.WebServlet;  // Annotation : Servlet 의  Annotation에 관련된 클래스
import javax.servlet.http.HttpServlet; // HttpServlet : Servlet을 만들기 위한 부모클래스 (상속해야한다) 
import javax.servlet.http.HttpServletRequest; // request 역할  interface 
import javax.servlet.http.HttpServletResponse; // response 역할 interface
/*
 * 1. import javax.servlet.*; // 서블릿
 * 	  import javax.servlet.http.*; // 웹상 접속에 관련도니 정보
 * 2. 반드시 public class 로 작성해야 한다. : 누구나 접속할 수 있어야 한다.
 * 3. 반드시 HttpServlet 클래스를 상속받아야된다. : doGet, doPost
 *		: doGet > get으로 접근했을 떄의 반응 -> doGet()을 자동으로 호출 (콜백메서드 계열)
 *		: doPost > post로 접근했을 때의 반응 -> doPost() 을 자동으로 호출 
 */

/**
 * Servlet implementation class HelloTest
 */
//@WebServlet("/HelloTest") // 어노테이션이 없으면, xml 환경설정을 불러올 수없다.

public class HelloTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Servlet 실행 시 가장 먼저 실행되는 method (init)");
		System.out.println("생성자와 같은 역할(서블릿의 초기값을 설정할 때 필요");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Servlet 파괴시 실행되는 method(destroy)");
	}

	/**
	 * 사용자의 요청(Get 방식)을 받을 때  자동으로 처리해주는 method
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("웹상에서 get방식으로 자동으로 호출됨");
		//1. 어떤형태의 문서를 만들어서 보내줄지 결정 -> response 객체가 처리
		response.setContentType("text/html;charset=utf-8"); //html 문서로 처리 (한글)
		//2. Print Writer 클래스의 method 반환형을 통해서 얻어오기
		PrintWriter out = response.getWriter();
		out.println("<html><header></header>"); // document.write("<html>");
		out.println("<body>");
		//외추에 보여줄 내용	
		//추가
		out.println("<table border=1>");
		for(int i=2; i<=9; i++) {//단
			out.println("<tr>");
			for(int j=1; j<=9; j++) {
				out.println("<td>");
				out.println(i+"*"+j+"="+(j*i));
				out.println("</td>");
			}
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * 사용자의 요청(Post 방식)을 받을 때  자동으로 처리해주는 method (회원 로그인, 회원가입)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
