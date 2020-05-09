package action;
/*
 * 기능은 다르지만 요청을 받아서 처리해주는 method가 필요
 * -> 공통의 method로 작성 -> 상속을 위한 interfaced 작성
 * 
 */

import javax.servlet.http.*; // request, response 객체가 필요하기 때문

public interface CommandAction {
	// 이동할 페이지의 경로와 페이지명이 필요(요청에 따른) -> 반환값이 String -> (Spring 에서는 Model and View)
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
