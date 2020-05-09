package hewon;
// 데이터저장빈 -> ~~DTO 로 저장하는 관례 => 테이블의 필드와 관련 -> 필드별로 데이터를 저장, 꺼내와서 출력함
public class MemberDTO {
	//멤버변수 -> 웹상에서 입력받는 input box의 갯수와 보통 같다. (필드 수와 거의 같다)
	//멤버변수 명은 필드명과 같아도 되고 같지 않아도된디ㅏ
	// 회원가입폼의 input type ="text" name=" " <<-- 와는 반드시 같아야한다. 액션태그때문
	private String mem_id;
	private String mem_passwd;
	private String mem_name;//이름
	private String mem_email;//메일
	private String mem_phone;//전번
	private String mem_zipcode;//우편번호
	private String mem_address;//주소
	private String mem_job;//직업
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_passwd() {
		return mem_passwd;
	}
	public void setMem_passwd(String mem_passwd) {
		this.mem_passwd = mem_passwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_job() {
		return mem_job;
	}
	public void setMem_job(String mem_job) {
		this.mem_job = mem_job;
	}
	
}
