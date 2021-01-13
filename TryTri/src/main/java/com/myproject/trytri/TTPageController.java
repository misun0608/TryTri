package com.myproject.trytri;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
