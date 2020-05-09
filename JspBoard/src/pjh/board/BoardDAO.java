package pjh.board;

// has a 관계 -> 서로 관련이 있는 클래스들의 관계 설정
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
// Arraylist, List를 사용하기 위해 import
import java.util.ArrayList;
import java.util.List;

public class BoardDAO { // MemberDAO 처럼
	
	private DBConnectionMgr pool = null; //1.얻어올 객체 선언
	// 웹에서 공통으로 사용할 멤버변수
	private Connection con=null;//DB접속할때 필요
	private PreparedStatement pstmt = null; // stmt객체보다 속도가 빠름 
	private ResultSet rs = null; // select 구문 table 형태로 저장
	private String sql=""; //실행시킬 sql문장
	
	// 생성자를 통해서 상대방의 객체를 생성해서 연결
	public BoardDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.println("pool:"+pool);
		}catch(Exception e) {
			System.out.println("pool:"+pool);
		}
	}
	// 1. 페이징처리를 위해서 전체 레코드 수를 구해와야 한다 ==> 메서드로
	// select count(*) from board // -> select count(*) from 테이블명
	public int getArticleCount() {
		int x = 0;
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select count(*) from board";//sql="select count(*) from member";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//검색된 레코드갯수가 있다면
			if(rs.next()) {
				x=rs.getInt(1);    //변수명=rs.get자료형(필드명 또는 인덱스번호)
			}        //불러올 데이터가 필드명이 아니기에 select~from사이의 나오는 인덱스번호로 불러옴
		}catch(Exception e) {
			System.out.println("getArticleCount() method error:"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		return x;
	}
	// 2. 글 목록 보기에 대한 method 구현 -> 레코드가  한 개 이상 -> 페이지당 10개식 끊어주는 기능
	// (1) 레코드의 시작번호  (2) 한 번에불러올 레코드의 갯수(10,15,30~)
		public List<BoardDTO> getArticles(int start,int end) {
		List<BoardDTO> articleList = null; // ArrayList<BoardDTO> articleList = null; 도 같음
		
		try {
			con = pool.getConnection();
			sql="select * from board order by ref desc,re_step asc limit ?,?"; // limit ?,? 몇개의 범위?
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1); // mysql은 순번이 내부적으로 0부터 시작)
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			// 페이징 처리 는 기본적으로 누적의 개념을 도입한다.
			// 기존의 레코드 외에 추가된 레코드를 첨부해서 모두 보여주기 위해서는 누적(do~while)을 사용한다.
			if(rs.next()) { // 만약 레코드가 1개라도 존재한다면
				// articleList = new List() 불가능
				// 형식) articleList = new 자식클래스명();
				articleList = new ArrayList(end); // end 가 10이라면 10개가 저장 가능한 데이터 공간이 만들어짐.
				do {
					BoardDTO article = makeArticleFromResult();
					
					/*
					 * BoardDTO article = new BoardDTO(); // MemberDTO mem = new MemberDTO();
					 * article.setNum(rs.getInt("num")); // 문자열값
					 * article.setWriter(rs.getString("writer"));
					 * article.setSubject(rs.getString("subject"));
					 * article.setEmail(rs.getString("email"));
					 * article.setPasswd(rs.getString("passwd"));
					 * article.setReg_date(rs.getTimestamp("reg_date")); // 오늘 날짜 값 // 정수값(조회수,답변에
					 * 대한 필드) article.setReadcount(rs.getInt("readcount")); // default =0
					 * article.setRef(rs.getInt("ref")); // 그루번호
					 * article.setRe_step(rs.getInt("re_step")); // 답변글의 순서
					 * article.setRe_level(rs.getInt("re_level")); // 들여쓰기
					 * article.setContent(rs.getString("content")); // 글내용
					 * article.setIp(rs.getString("ip")); // 글쓴이의 ip
					 */
					// 레코드를 찾을 때마다, articleList에 담아야함
					articleList.add(article);
				}while(rs.next());
			}
		}catch(Exception e) {
			System.out.println("getArticles() method error:"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return articleList;
	}
	//3.글쓰기 및 답변글까지 구현
	// insert into board values(?,?,?,,,,,) --> 반환값 X 매개변수 O
	public void insertArticle(BoardDTO article) {
		//1.article -> 신규 or 답변? -> b_ref 로 확인
		int num = article.getNum(); // ==0 > 신규글  /  !=0 답변글  // 구분!! 이 목적인 변수
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level= article.getRe_level();
		// 테이블에 입력할 게시물 번호를 저장할 변수
		int number = 0; // 데이터를 넣어줄 때 필요로 하는 게시물 번호 // 새로!! 넣을 목적의 변수
		
		System.out.println("insertArticle method 내부의 num:"+num);
		System.out.println("ref:"+ref+",re_step:"+re_step+",re_level:"+re_level);
		
		try {
			con = pool.getConnection();
			sql="select max(num) from board"; // 최대값 +1 -> 실제 저장할 게시물 번호를 생성
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) { // 현재 테이블에서 데이터가 존재한다면
				number = rs.getInt(1)+1;
			}else { // 맨처음에 레코드가 없다면
				number=1;
			}
			//답변글 이라면
			if(num!=0) {  //-> 답변글
				// 답변글에 대한 SQL 구문
				// 같은 그룹번호를 가지고 있으면서 나(새로 추가된 답변글)보다 re_step값이 큰 답변글을 찾아서
				// re_step값을 하나 증가시킨다
				sql="update board set re_step = re_step+1 where ref=? and re_step > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, article.getRef());
				pstmt.setInt(2, re_step);
				int update=pstmt.executeUpdate();				
				System.out.println("댓글 수정 유무:"+update); // 1 성공 0 실패
				
				re_step+=1;
				re_level+=1;
			}else { // 신규글
				ref=number; // 그룹번호가 단독으로 사용될 때에는 num과 같이 구분자로 사용하기 때문
				re_step=0;
				re_level=0;
			}
			// 12개의 필드를 넣어줌
			sql="insert into board(writer,email,subject,passwd,reg_date,";
			sql+=" ref,re_step,re_level,content,ip)values(?,?,?,?,?,?,?,?,?,?)";
			/*
			 * sql="insert into board(writer,email,subject,passwd,reg_date,";
			 * sql+="ref,re_step,re-level,content,ip) values(?,?,?,?,?,?,?,?,?,?)";
			 */
			//sql+="ref,re_step,re-level,content,ip) values(?,?,?,?,now(),?,?,?,?,?)";
																//sysdate() -> mySQL 함수
			pstmt = con.prepareStatement(sql); // 웹에 입력, 저장 -> setter Method 호출
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			//wirtePro.jsp(날짜는 어떻게 저장할것인가?)
			pstmt.setTimestamp(5, article.getReg_date()); //
			pstmt.setInt(6, ref); // number pstmt.setInt(6,article.getRef()  --> X 아님!
			pstmt.setInt(7, re_step); //0
			pstmt.setInt(8, re_level); //0
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp()); // request.getRemoteAddr();
			
			int insert = pstmt.executeUpdate();
			System.out.println("게시판 글쓰기 성공 유무 :"+insert); // 1 성공, 0 실패
		}catch(Exception e) {
			System.out.println("insertArticle method오류 :"+e);
		}finally{
			
		}
	}
		
	//4.글상세보기 위한 method
	//형식) select * from board where num=? =? 반환형 O 매개변수 O
	//형식2) update board set readcount = readcount +1 where num=?
	public BoardDTO getArticle(int num) {
		BoardDTO article = null; // 한 개의 레코드를 담는 객체
		
		try {
			con = pool.getConnection();
			sql="update board set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int update = pstmt.executeUpdate();
			System.out.println("조회수 증가유무:"+update);
			
			// 2. 조회수를 증가시킨 게시물을 찾아서 출력
			sql="select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 만약 레코드가 1개라도 존재한다면
				// 형식) articleList = new 자식클래스명();				
				article = makeArticleFromResult();
				/*
				 * article = new BoardDTO(); // end 가 10이라면 10개가 저장 가능한 데이터 공간이 만들어짐.
				 * article.setNum(rs.getInt("num")); // 문자열값
				 * article.setWriter(rs.getString("writer"));
				 * article.setSubject(rs.getString("subject"));
				 * article.setEmail(rs.getString("email"));
				 * article.setPasswd(rs.getString("passwd"));
				 * article.setReg_date(rs.getTimestamp("reg_date")); // 오늘 날짜 값 // 정수값(조회수,답변에
				 * 대한 필드) article.setReadcount(rs.getInt("readcount")); // default =0
				 * article.setRef(rs.getInt("ref")); // 그루번호
				 * article.setRe_step(rs.getInt("re_step")); // 답변글의 순서
				 * article.setRe_level(rs.getInt("re_level")); // 들여쓰기
				 * article.setContent(rs.getString("content")); // 글내용
				 * article.setIp(rs.getString("ip")); // 글쓴이의 ip // 레코드를 찾을 때마다, articleList에
				 * 담아야함
				 */			}
		}catch(Exception e) {
			System.out.println("getArticle() method error:"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return article;
	}
	
	// 중복된 내용의 레코드를 담을 수 있는 method를 따로 만들어서 호출 -> 공개할 필요가 없다
	private BoardDTO makeArticleFromResult() throws Exception {
		BoardDTO article = new BoardDTO();		
		article = new BoardDTO(); // end 가 10이라면 10개가 저장 가능한 데이터 공간이 만들어짐.
		article.setNum(rs.getInt("num"));
		// 문자열값
		article.setWriter(rs.getString("writer"));
		article.setSubject(rs.getString("subject"));
		article.setEmail(rs.getString("email"));
		article.setPasswd(rs.getString("passwd"));
		article.setReg_date(rs.getTimestamp("reg_date")); // 오늘 날짜 값
		// 정수값(조회수,답변에 대한 필드)
		article.setReadcount(rs.getInt("readcount")); // default =0 
		article.setRef(rs.getInt("ref")); // 그루번호
		article.setRe_step(rs.getInt("re_step")); // 답변글의 순서
		article.setRe_level(rs.getInt("re_level")); // 들여쓰기
		article.setContent(rs.getString("content")); // 글내용
		article.setIp(rs.getString("ip")); // 글쓴이의 ip		
		return article;		
	}
	
	//5.글 수정하기
	//select * from board where num=? > 조회수는 증가되지 않아야함
	public BoardDTO updateGetArticle(int num){
		BoardDTO article = null;
		try {
			con=pool.getConnection();
			sql="select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = makeArticleFromResult(); // 중복코딩 배제
			}
			System.out.println("updateGetArticle 실행:"+article);
		}catch(Exception e) {
			System.out.println("updateGetArticle() method error:"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
			
		}		
		return article;
	}

	// 6. 글 수정하는 method 호출 -> insertArticle과 거의 동일 -> 1) SQL 2) 암호를 인증
	public int updateArticle(BoardDTO article) { // updatePro.jsp 에서 호출(암호를 확인)
		String dbpasswd = null; // db에서 찾은 암호 저장
		int x = -1; // 게시물의 수정성공 유무 (초기화)

		// 1.암호를 먼저 찾아서 비교 -> 승낙 -> 2)update 수행이 가능
		try {
			con = pool.getConnection();
			sql = "select passwd from board where num=?"; // 최대값 +1 -> 실제 저장할 게시물 번호를 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) { // 데이터가 존재한다면
				dbpasswd = rs.getString("passwd");

				System.out.println("dbpasswd:" + dbpasswd); // 나중에 없애야 하는 코드

				// db상의 암호 == 웹상에 입력한 암호가 맞는지 체크
				if (dbpasswd.contentEquals(article.getPasswd())) {
					// 수정가능한 필드를 수정해서 넣어줌
					sql = "update board set writer=?,email=?,subject=?,passwd=?,content=? where num=?";
					pstmt = con.prepareStatement(sql); // 웹에 입력, 저장 -> setter Method 호출
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());

					int update = pstmt.executeUpdate();
					System.out.println("게시판의 글 수정 성공유무:" + update);
					x = 1;
				} else {
					x = 0; // 암호가 틀린경우(수정 실패)
				}
			} // if(rs.next())

		} catch (

		Exception e) {
			System.out.println("updateArticle method오류 :" + e);
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return x;
	}
	
	//7. 글 삭제
	//select passwd from board where num=?
	//delete from board whre num=?
	public int deleteArticle(int num, String passwd) {
		String dbpasswd = null; // db에서 찾은 암호 저장
		int x = -1; // 게시물의 수정성공 유무 (초기화)

		// 1.암호를 먼저 찾아서 비교 -> 승낙 -> 2)update 수행이 가능
		try {
			con = pool.getConnection();
			sql = "select passwd from board where num=?"; // 최대값 +1 -> 실제 저장할 게시물 번호를 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 데이터가 존재한다면
				dbpasswd = rs.getString("passwd");
				System.out.println("dbpasswd:" + dbpasswd); // 나중에 없애야 하는 코드

				// db상의 암호 == 웹상에 입력한 암호가 맞는지 체크
				if (dbpasswd.contentEquals(passwd)) {
					// 수정가능한odms 필드를 수정해서 넣어줌
					sql = "delete from board where num=?";
					pstmt = con.prepareStatement(sql); // 웹에 입력, 저장 -> setter Method 호출
					pstmt.setInt(1, num);
					int delete = pstmt.executeUpdate();
					System.out.println("게시판의 글 삭제 성공유무:" + delete);
					x = 1;
				} else {
					x = 0; // 암호가 틀린경우(수정 실패)
				}
			} // if(rs.next())

		} catch (

		Exception e) {
			System.out.println("deleteArticle method오류 :" + e);
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return x;
	}
	
}
