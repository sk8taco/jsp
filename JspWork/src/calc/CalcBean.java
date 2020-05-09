package calc;
//자바빈즈 -> 웹상에 값으 ㄹ입력, 출력하거나, 메서드를 호출할때 필요로 하는 클래스(DTO)
//반드시 public 클래스로 줘야 외부에서 접근 가능

public class CalcBean {
	 private int num1,num2,result=0; // "5","3" <%=num1+num2%>
	 private String operator=""; //연산자를 저장할 변수
	 
	 public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) { // 많은 데이터를 입력할 때는 액션태그 사요ㅕㅇ
		this.num1 = num1;
		System.out.println("setNum1() 호출");
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public int getResult() {
		return result;
	}
	public void calculate() {
		 if(operator.equals("+")) {
			 result = num1+num2;
		 }
		 if(operator.contentEquals("-")) {
			 result = num1-num2;
		 }
		 if(operator.contentEquals("*")) {
			 result = num1*num2;
		 }
		 if(operator.contentEquals("/")) {
			 result = num1/num2;
		 }
		 
	 }
}
