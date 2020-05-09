package hewon;
//DAO -> DB에 연결해서 테이블 특정 자료 추출하여 웹에 출ㄹ겨

import java.sql.*;
import java.util.*;

public class MemberDAO {
	//1.DBConnectionMgr과 연결
	private DBConnectionMgr pool = null;
	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	private String sql="";
	
	//2.생성자를 통해서 객체를 얻어오는 구문 작성 -> has a 관계
	public MemberDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool:"+pool);
		}catch(Exception e) {
			System.out.println("DB연결 실패");
		}finally {
			
		}
		
		
	}
	
	// 3. 업무의 ㅇ구 분석 -> 어떤 기능이 필요한지
	//1) 회원로그인 
	//형식 ) public 반환형 메서드명(입력받은 갯수만큼 매개변수 부여) {SQL 작성}
	public boolean loginCheck(String id, String passwd) {
			//1.DB연결 
			boolean check = false;
			//2.SQL 구문 처리
		try {
			con = pool.getConnection();
			System.out.println("con:"+con);
			sql="select id,passwd from member where id =? and passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs= pstmt.executeQuery();
			check=rs.next(); // 데이터가 존재하면 true, 없으면 false
		}catch(Exception e) {
			System.out.println("loginCheck() 실행 에러 유발:"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return check;
			//3.DB연결해제 
	}
	//2.회원가입->중복id를 체크해주는 emthod 필요 -> select(반환형값이 존재),where조건식(매개변수O)
	// SQL -> select id from memeber where id ='kkk';
	public boolean checkId(String id) {
		//DB연결
		boolean check = false;
		//SQL
		try {
			con = pool.getConnection();
			sql="select id from member where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			check = rs.next(); // 데이터가 존재하면 true, 없으면 false			
		}catch(Exception e) {
			System.out.println("checkID() 오류 발생"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		//DB메모리해제
		return check;
	}
	//3.우편번호 -> 우편번호 검색 -> 자동으로 주소를 입력
	//sql> select * from zipcode where area3 like '미아3동%';
	public Vector<ZipcodeDTO> zipcodeRead(String area3){
		Vector<ZipcodeDTO> vecList = new Vector(); // 리턴할 데이터를 미리 선언(비어있는 형태로)
		
		try {
			con = pool.getConnection();
			//sql = "select * from zipcode where area3 like ?"; // ? 를 쓰게되면  ?를 출력할 방법이 없다.
			//sql = "select * from zipcode where area3 like '미아3동%'";
			sql = "select * from zipcode where area3 like '"+area3+"%'"; // 형식 잘 볼 것, sqㅣ 문에서 문자열을 받는 ' ' 내부에 들어가는 내용
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			// 찾은 레코드가 1개 -> if(rs.next()), 한개 이상일때 -> while(rs.next())
			while(rs.next()) {
				//Vector or ZipcodeDTO에 담을 수도 있다. rs.getXXX 필드명
					ZipcodeDTO tempZipcode = new ZipcodeDTO();
					// 필드별로 담고, 필드별로 꺼내기 쉽게 하기 위해서
					tempZipcode.setZipcode(rs.getString("zipcode"));
					tempZipcode.setArea1(rs.getString("area1"));
					tempZipcode.setArea2(rs.getString("area2"));
					tempZipcode.setArea3(rs.getString("area3"));
					tempZipcode.setArea4(rs.getString("area4"));
					// Vector 또는 ArrayList 에 저장하는 구문
					vecList.add(tempZipcode);
			}
		}catch(Exception e) {
			System.out.println("zipcodeRead() 실행오류 : "+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vecList; // 웹상에서 method에 전달
		
		/*
		 * NullPointException 에러가 발생 -> 객체 생성이 되지 않고, 메소드를 호출 했을 경우에 보통 발생
		 */
	}
	
	
	//4. 회원가입 -> 오라클(실무,트렌젝션 처리 필요) or MySQL(외부의 도메인 등록업체, 트렌젝션 처리 필요X)
	// insert into member values(?,?,,,)  --> 반환값 boolean으로 (1=성공) (0=실패)
	// insert update delete는 반환값이 없고, 매개변수는 있다. 
		public boolean memberInsert(MemberDTO member) {//웹에 이미 저장된 상태의 값
			boolean check = false;  //s회원가입성공유무
			
			try {
				con = pool.getConnection();
				// 트랜잭션 처리 -> 여러개의 SQL 구문을 하나의 작업단위로 묶어주는 것
				con.setAutoCommit(false); // 자동 commit 을 하지 못하도록 설정 --> 하지 않으면 무조건 다 commit 되어서 복구가 안됨
				//SQL 구문 시작 
				sql = "insert into member values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getMem_id());
				pstmt.setString(2, member.getMem_passwd());
				pstmt.setString(3, member.getMem_name());
				pstmt.setString(4, member.getMem_email());
				pstmt.setString(5, member.getMem_phone());
				pstmt.setString(6, member.getMem_zipcode());
				pstmt.setString(7, member.getMem_address());
				pstmt.setString(8, member.getMem_job());
				int insert = pstmt.executeUpdate(); // 1성공 0 실패
				System.out.println("insert 데이터 입력 유무 :"+insert);
				if(insert >0) {//if (insert ==1)
					check = true;
				}
				con.commit();
			}catch(Exception e) {
				System.out.println("memberInsert() 실행오류:"+e);
			}finally {
				pool.freeConnection(con, pstmt);
			}
			return check;
			
		}
	
	//5. 회원 정보 수정을  위해 , 회원을 찾는 메서드 -> 특정상품 찾기 ,
	//select * from member where id='nup';	
	public MemberDTO getMember(String mem_id) { // public Scanner getScan()
		MemberDTO member=null;
		
		try {
			con=pool.getConnection();
			sql="select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			// 찾은 레코드가 1개 있다면 
			if(rs.next()) {
				member = new MemberDTO();
				// 찾은 필드값을 setter method로 저장 -> 웹에 출력하려면 -> getter Method 호출
				member.setMem_id(rs.getString("id"));
				member.setMem_passwd(rs.getString("passwd"));
				member.setMem_name(rs.getString("name"));
				member.setMem_phone(rs.getString("phone"));
				member.setMem_zipcode(rs.getString("zipcode"));
				member.setMem_address(rs.getString("address"));
				member.setMem_email(rs.getString("e_mail"));
				member.setMem_job(rs.getString("job"));
				
				// ArrayList에 저장하고 나서 계속 담는 작업을 진행 -> list.add(member);
			}
			
		}catch(Exception e) {
			System.out.println("getMember() 실행오류:"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return member;
		
	}
	//6.찾은 회원을 가지고 수정 
	public boolean memberUpdate(MemberDTO member) { 
		boolean check = false;  //s회원가입성공유무
		
		try {
			con = pool.getConnection();
			// 트랜잭션 처리 -> 여러개의 SQL 구문을 하나의 작업단위로 묶어주는 것 => insert,update,delete만 트랜잭션 처리를 함
			con.setAutoCommit(false); // 자동 commit 을 하지 못하도록 설정 --> 하지 않으면 무조건 다 commit 되어서 복구가 안됨
			//SQL 구문 시작 
			sql = "update member set passwd=?, name=?, e_mail=?,phone=?,zipcode=?,address=?,job=? where id=?";
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, member.getMem_passwd());
			pstmt.setString(2, member.getMem_name());
			pstmt.setString(3, member.getMem_email());
			pstmt.setString(4, member.getMem_phone());
			pstmt.setString(5, member.getMem_zipcode());
			pstmt.setString(6, member.getMem_address());
			pstmt.setString(7, member.getMem_job());
			pstmt.setString(8, member.getMem_id());
			
			int update = pstmt.executeUpdate(); // 1성공 0 실패
			System.out.println("update 데이터 입력 유무 :"+update);
			if(update == 1) {//if (insert ==1)
				check = true;
			}
			con.commit();
		}catch(Exception e) {
			System.out.println("memberInsert() 실행오류:"+e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return check;
			
		
	}
	//7.회원 탈퇴
	//하나의 method에 여러개의 SQL 구문이 나올 수 있다. -> All or Nothing 원자성
	// select passwd from member where id=?
	// delete from member where id=?
	public int deleteMember(String id, String passwd) {
		String dbpasswd = ""; // DB상에서 찾은 암호를 저장
		int x = -1; // 회원탈퇴 유무 -> 1 성공, 0 실패
		
		try {
			con = pool.getConnection();
			con.setAutoCommit(false);
			//1.id에 해당하는 암호를 먼저 찾기
			pstmt = con.prepareStatement("select passwd from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			//2. 암호가 존재한다면
			if(rs.next()) {
				dbpasswd = rs.getString("passwd"); // rs.getString(1) 과 같은 표현
				System.out.println("dbpasswd:"+dbpasswd); // 암호확인용 디버깅 -> 추후 꼭 제거해야하는 코드
				//3. dbpasswd(DB상에서 찾은 암호) == passwd(웹상에서 입력받은 값)
				if(dbpasswd.contentEquals(passwd)) {
					pstmt=con.prepareStatement("delete from member where id=?");
					pstmt.setString(1, id);
					int delete = pstmt.executeUpdate();
					System.out.println("delete 성공 :"+delete);
					con.commit();
					x = 1;
				}else {
					x=0; // 암호 틀림
				}
			}else {
				x=-1; // 암호가 존재하지 않는 경우
			}
		}catch(Exception e) {
			System.out.println("deleteMember()오류:"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return x;
	}
	
	

}
