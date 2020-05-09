package test; // 패키지를 만들어 기능별로 분류한다. 회원관리/게시판/관리자...
/*
 * 빈즈클래스를 만드는 조건
 * 1. 반드시 public class 로 작성해야함. 누구나 접근할 수 있어햐 하기 때문
 * 									> 웹상에서 불러다 사용할 수 있도록
 * 									> 메서드를 호출하기 위해서
 * 2. 멤버변수(입력받는 부분)은 반드시 캡슐화하여야 한다. => private
 * 3. Setter, Getter Method 작성
 */
public class BeanDTO {
	//field
	private String name;
	private String addr;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
		System.out.println("setName() called");
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
		System.out.println("setAddr() called");
	}
}
