package com.sesoc.moneybook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.moneybook.dao.TestDAO;
import com.sesoc.moneybook.vo.MemberVO;
import com.sesoc.moneybook.vo.MoneybookVO;

@Controller
public class HomeController {
	
	
	@Autowired
	TestDAO dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signupForm";
	}
	
	@RequestMapping(value ="/login" ,method = RequestMethod.GET)
	public String login() {
		return "loginForm";
	}
	
	@RequestMapping(value ="/gobook", method= RequestMethod.GET)
	public String moneybook() {
		return "moneybook"; 
	}
	
	
	@RequestMapping(value="/sign",method= RequestMethod.POST)
	public String insertMember(MemberVO member) {
		int result = dao.insertMember(member); 
		if(result ==0) {
			return "signupForm"; 
		}
		return "loginForm"; 
	}
	
	@RequestMapping(value="/loginmember",method= RequestMethod.POST)
	public String loginMember(MemberVO member,HttpSession session) {
		MemberVO result = dao.select(member); 
		if(result ==null) {
			return "main"; 
		}else {
			session.setAttribute("loginId", result.getUserid());
		}
		return "main"; 
	}
	
	@RequestMapping(value="/logout",method= RequestMethod.GET)
	public String logoutMember(MemberVO member,HttpSession session) {
		session.invalidate();
		return "main"; 
	}
	
	@RequestMapping("/showlist")
	@ResponseBody
	public List<MoneybookVO> showmoneybook(MoneybookVO moneybook,HttpSession session) {
		String userid= (String)session.getAttribute("loginId"); 
		moneybook.setUserid(userid);
		List<MoneybookVO> result = dao.selectAll(moneybook);
		return result; 
	}
	
	@RequestMapping("/insertmoneybook")
	@ResponseBody
	public String insertmoneybook(MoneybookVO moneybook,HttpSession session) {
		String userid = (String)session.getAttribute("loginId"); 
		moneybook.setUserid(userid);
		int result = dao.insertmoneybook(moneybook);
		if(result==0) {
			return "false";
		}
		return "success"; 
	}
	
	@RequestMapping("/deletemoney")
	@ResponseBody
	public String deletemoney(int infonum) {
		int result = dao.deletebook(infonum);
		if(result==0) {
			return "false";
		}
		return "success"; 
	}
	
	
	
	
	
}
