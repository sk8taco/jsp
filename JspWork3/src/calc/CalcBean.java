package calc;

import java.io.PrintWriter;

public class CalcBean {

	private int num1;
	private int num2;
	private String operator;
	public int result;
	
	
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
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
	public int calc() {
		if(operator.equals("+")) {
			result = this.num1+this.num2;
		} else if(operator.contentEquals("-")) {
			result = this.num1-this.num2;
		} else if(operator.contentEquals("*")) {
			result = this.num1*this.num2;
		} else if(operator.contentEquals("/")) {
			result = this.num1/this.num2;
		} 
		return result;
	}
	

}
