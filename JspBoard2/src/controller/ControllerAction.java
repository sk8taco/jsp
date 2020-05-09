package controller;

import java.io.*;//FileInputStream
import java.util.*;//Map,Properties (DB연동에 관련된 환결설정파일)
import javax.servlet.*;
import javax.servlet.http.*;
//추가->다른 패키지의 클래스나 인터페이스를 참조
import action.CommandAction; // 요청을 받아서 처리해주는 클래스를 사용(객체형변환)

public class ControllerAction extends HttpServlet {
										// Httpservlet 클래스 상속 필수
    //명령어와 명령어 처리클래스를 쌍으로 저장
    private Map commandMap = new HashMap();
    
	//서블릿을 실행시 서블릿의 초기화 작업->생성자
    public void init(ServletConfig config) 
                    throws ServletException {
    	
  //경로에 맞는 CommandPro.properties파일을 불러옴
    String props = config.getInitParameter("propertyConfig"); // web.xml 에서 전달받음
    System.out.println("불러온경로="+props);
    
  //명령어와 처리클래스의 매핑정보를 저장할
  //Properties객체 생성
    Properties pr = new Properties();
    FileInputStream f = null;//파일불러올때 
    
        try {
           //CommandPro.properties파일의 내용을 읽어옴
        	f=new FileInputStream(props); //props : 경로 , 파일을 불러오는 것
           
        	//파일의 정보를 Properties에 저장
        	pr.load(f); // 메모리에 로드 시킴
        	
        }catch(IOException e){
          throw new ServletException(e);
        }finally{
        if(f!=null) try{f.close();}catch(IOException ex){}	
        }
        	
     //객체를 하나씩 꺼내서 그 객체명으로 Properties
     //객체에 저장된 객체를 접근
     Iterator keyiter = pr.keySet().iterator(); 
     
     while(keyiter.hasNext()){ // 요청명령어가 존재한다면
       //요청한 명령어를 구하기위해
       String command = (String)keyiter.next();
       System.out.println("요청 command="+command);
       //요청한 명령어(키)에 해당하는 클래스명을 구함
       String className=pr.getProperty(command);
       System.out.println("className="+className); // 요청받아서 처리해주는 클래스명
       
       try{
       //그 클래스의 객체를 얻어오기위해 메모리에 로드 -> JDBC에서 드라이버를 올리듯, 같은 처립 ㅏㅇ식
       Class commandClass = Class.forName(className); // 요청클래스를 얻어옴
       System.out.println("commandClass="+commandClass); 
       // 요청클래스명.newInstance(); <<-- 요청에 따른 객체를 얻어올 수 있음.
       Object commandInstance = commandClass.newInstance(); 
       System.out.println
              ("commandInstance="+commandInstance);
      
       //Map객체 commandMap에 저장 -> 요청을 받아서 처리할 때 필요로 하는 객체를 바로바로 사용하기 쉽게 미리 만들어 넣어주는 역할 (DI)
       commandMap.put(command, commandInstance);
       System.out.println("commandMap="+commandMap);
       
            } catch (ClassNotFoundException e) {
                throw new ServletException(e);
            } catch (InstantiationException e) {
                throw new ServletException(e);
            } catch (IllegalAccessException e) {
                throw new ServletException(e);
            }
        }//while
    }

    public void doGet(//get방식의 서비스 메소드
                     HttpServletRequest request, 
                     HttpServletResponse response)
    throws ServletException, IOException {
    	    requestPro(request,response);
    }

    protected void doPost(//post방식의 서비스 메소드
                     HttpServletRequest request, 
                     HttpServletResponse response)
    throws ServletException, IOException {
    	    requestPro(request,response);
    }

    //*** 시용자의 요청을 분석해서 해당 작업을 처리 ****
    private void requestPro(HttpServletRequest request,
    		                HttpServletResponse response) 
    throws ServletException, IOException {
    	String view = null; // 요청명령어에 따라서 이동할 페이지의 이름을 저장-> ex)list.jsp
    	/*
    	 * ListAction com = null; ListAction com = new ListAction(),,,
    	 * CommandAction com = new ListAction();  // 글 목록보기
    	 * CommandAction com = new WriteFormAction();  // 글쓰기 
    	 * CommandAction 부모형으로 생성하여 어떤 자시객체라도 받아서 사용할 수 있게 선언
    	 */
    	CommandAction com = null; // 어떠한 자식클래스의 객체라도 부모형으로 형변환 (어떤 형태의 객체도 담을 수 있음)
    	try { 
    		// 요청명령어를 분리해주는 코드 : list.jsp 만 가져와야함
    		String command = request.getRequestURI(); // 프로젝트명/요청명
    		System.out.println("request.getRequestURI():"+request.getRequestURI());
    		// 프로젝트이름을 얻어옴 
    		System.out.println("request.getContextPath():"+request.getContextPath()); 
    		// /JspBoard2/list.do -> command
    		// /JspBoard2 -> request.getContextPath()
    		// 요청명령어를 얻어오는 방법
    		if(command.indexOf(request.getContextPath())==0) {
    			//indexOf() 가 0 이라는 말은 일치하는 부분
    			command = command.substring(request.getContextPath().length());
    			System.out.println("실질적잉 요청명령어 command:"+command); // /list.do
    		}
    		// /요청명령어 -> /list.do = action.ListAction 객체
    			com = (CommandAction)commandMap.get(command); // ~get(/list.do);
    			System.out.println("com:"+com); // action.ListAction@주소값(처리객체명)
    			// 이동할페이지명 얻어오기
    			view = com.requestPro(request, response);
    			System.out.println("이동할페이지명(view):"+view); // /list.jsp , writeForm.jsp, writePro.jsp ~~~
    	}catch(Throwable e) { // Exception의 상위 클래스 Throwable
    		throw new ServletException(e);
    	}
    	// 위에서 요청명령어에 해당하는 view 로 데이터를 공유시키면서 이동
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher(view); // view = 이동할 페이지 경로
    	dispatcher.forward(request,  response); //forward method를 이용, 데이터를 공유하면서 이동    	
    	
    }
}

