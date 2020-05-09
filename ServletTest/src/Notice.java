

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Notice
 */
@WebServlet("/Notice")
public class Notice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");// 한글처리
		PrintWriter out = response.getWriter();
		out.println("<html><header><title>공지사항</title></header>");
		out.println("<body>");
		//notice -> 2020218.txt
		Calendar cal = Calendar.getInstance();
		String fileName = ""; //불러올 파일명 저장
		fileName+=cal.get(Calendar.YEAR); //2020
		fileName+=cal.get(Calendar.MONTH)+1;  // 0~11+1 => 1~12 => 2020에 붙임
		fileName+=cal.get(Calendar.DATE); // 18
		fileName+=".txt";//2020218.txt
		
		String realPath="F:/02.Web_Develope/02.KIC_web_develope_webtest/4.jsp/sou/ServletTest/WebContent/notice/"+fileName;
		System.out.println("realPath:"+realPath);
		try {
			// FileInputStream(영문) or FileReader(한글)
			BufferedReader br = new BufferedReader(new FileReader(realPath));
			String line="";// 한줄씩 읽어들여서 저장할 변수
			while((line=br.readLine())!=null) {
				out.println(line+"<br>"); // client의 browser로 전송
			}
			br.close();
			
		}catch(IOException e) {
			System.out.println("블러올 파일의 경로아 파일명을 확인하세요:"+e); // e.toString
		}catch(Exception e) {
			System.out.println("오늘 공지사항이 없슴다.(파일없음)");
		}
		//-------------------------
		out.println("<hr>");
		out.println("<input type='submit' value='창닫기' onclick='window.close()'>");
		out.println("</body></html>");
		
	}

}
