package com.myproject.trytri;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.trytri.voes.MemberVO;

@Controller
public class TTPageController {
	
	@Autowired
	private TrytriService tts;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:index.do";
	}
	
	// Main page
	@RequestMapping(value = "index.do")
	public String index() throws Exception{
		try {
			
		}catch(Exception e) {
			System.out.println("Error(TTPageController/index) : " + e.getMessage());
		}
		
		return "index";
	}
	
	// Header
	@RequestMapping(value = "header.do")
	public String header() throws Exception{
		try {
			
		}catch(Exception e) {
			System.out.println("Error(TTPageController/header) : " + e.getMessage());
		}
		
		return "header";
	}
	
	// Footer
	
	// Login page
	@RequestMapping(value = "login_page.do")
	public String login_page() throws Exception{
		try {
			
		}catch(Exception e) {
			System.out.println("Error(TTPageController/login_page) : " + e.getMessage());
		}
		
		return "login";
	}
	
	// Login process
	@PostMapping("/login_process.do")
	public String login_process(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws Exception{
		try {
			String result = tts.userChk(memberVO);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			
			if(result.equals("login_error")) {
				System.out.println("로그인 오류");
			}else if(result.equals("login_accept")) {
				session.setAttribute("member_id", memberVO.getMember_id());
				session.setAttribute("member_certificate", memberVO.getMember_certificate());
				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());
				System.out.println("로그인 성공");
			}else if(result.equals("non_member")) {
				System.out.println("회원아님");
			}else if(result.equals("wrong_pw")) {
				System.out.println("잘못된 비밀번호");
			}
		}catch(Exception e) {
			System.out.println("Error(TTPageController/login_process) : " + e.getMessage());
		}
		return "redirect:index.do";
	}
	
	// Logout
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("member_id");
		session.removeAttribute("member_certificate");
		session.removeAttribute("member_isadmin");
		
		return "redirect:index.do";
	}
	
	// Notice board
	@RequestMapping(value = "/notice_page.do")
	public String notice_page() throws Exception {
		try {
			
		}catch(Exception e) {
			System.out.println("Error(TTPageController/notice_page) + " + e.getMessage());
		}
	
		return "board_list";
	}
}
