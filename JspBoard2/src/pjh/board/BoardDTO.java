package pjh.board;

// 게시물의 작성 날짜
import java.sql.Timestamp;

// 웹상에서 테이블의 필드별로 저장,추출할 목적으로 사용하는 클래스(method의 매개변수, 반환형을 이용)
public class BoardDTO {
	// 눈에 보이는 필드부터
	private int num; // 게시물 번호
	private String writer; //작성자
	private String subject; //글제목
	private String email; //이메일
	private String content; //글내용
	private String passwd; //게시글비밀번호
	// 눈에 안보이는 경우 -> 직접  입력할 수 없음 ( 시스템에서 읽어들여서 입력됨)
	private Timestamp reg_date; // 작성날짜 -> sysdate <-> now() (MySQL,에서 사용하는 함수)
	private int readcount; // 조회수 
	private String ip; // 작성자 ip주소를 출력 -> 관리
	// 공지사항, 자유게시판 + 3개의 필드추가 (답변형)
	private int ref; // 글 그룹번호 (분류별,  단독으로 사용하게 되면 게시물 번호와 역할이 같음)
	private int re_step; // 답변글의 순서르 지정(=같은 그룹일때의 답변글 순서)
	private int re_level; //다변글의 답변에 대한 깊이(depth);
	// 자료실 추가
	// private STring file; // 업로드 되는 파일의 정보 추가(자료실)
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
		
}
