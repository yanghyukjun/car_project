package com.sesoc.moneybook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("loginId");
		if(userid==null) {
			String contextpath = request.getContextPath();
			response.sendRedirect(contextpath+"/gologin");
			return false;
		}
		
		return true;
	}

	
	
	
	
	/*@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(); 
		String userid = (String)session.getAttribute("loginId"); 
		
		if(userid==null) {
			String contextpath = request.getContextPath();
			response.sendRedirect(contextpath+"/login");
			return false; 
		}
		return true;
	}*/
}


