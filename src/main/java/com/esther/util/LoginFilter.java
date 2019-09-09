package com.esther.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest httpRequest=(HttpServletRequest)request;//자식객체로 형변환 한다음
		 HttpSession session=httpRequest.getSession(); //세션 객체를 얻어온다.

		 //로그인 했는지 아닌지에 대한 여부
		 boolean isLogin=false;

		 String id=(String)session.getAttribute("admin_session");

		 if(id !=null){
			 	chain.doFilter(request, response);  //로그인 된 경우에는 요청된 작업을 계속한다.
		 }else{

			 //로그인 하지 않은 경우
			 //ServletResponse 객체를 자식 객체로 형변환 한다음
			 HttpServletResponse httpResponse=(HttpServletResponse)response;
	
			 //안내페이지 혹은 login 페이지로 강제 이동시킨다.
			 httpResponse.sendRedirect("/adminBoard/login");
			 
		 }
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
