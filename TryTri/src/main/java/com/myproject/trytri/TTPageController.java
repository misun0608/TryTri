package com.myproject.trytri;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.trytri.voes.MemberVO;
import com.myproject.trytri.voes.NoticeVO;
import com.myproject.trytri.voes.Page;

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
	public String header(HttpSession session) throws Exception{
		try {
			
		}catch(Exception e) {
			System.out.println("Error(TTPageController/header) : " + e.getMessage());
		}
		
		return "header";
	}
	
	// footer
	@RequestMapping(value = "footer.do")
	public String footer() throws Exception{
		try {
			
		}catch(Exception e) {
			System.out.println("Error(TTPageController/footer) : " + e.getMessage());
		}
		
		return "footer";
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
	public String login_process(MemberVO memberVO, HttpSession session) throws Exception{
		try {
			MemberVO result = tts.userChk(memberVO);
			
			if(result == null) {
				session.setAttribute("member_id", null);
				session.setAttribute("member_certificate", null);
				session.setAttribute("member_isadmin", null);
				System.out.println("로그인 실패");
			}else {
				session.setAttribute("member_id", result.getMember_id());
				session.setAttribute("member_certificate", result.getMember_certificate());
				session.setAttribute("member_isadmin", result.getMember_isadmin());
				System.out.println("로그인 성공");
			}
			
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html; charset=utf-8");
//			PrintWriter writer = response.getWriter();
			
//			if(result.equals("login_error")) {
//				System.out.println("로그인 오류");
//			}else if(result.equals("login_accept")) {
//				session.setAttribute("member_id", memberVO.getMember_id());
//				session.setAttribute("member_certificate", memberVO.getMember_certificate());
//				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());
//				System.out.println("로그인 성공");
//			}else if(result.equals("non_member")) {
//				System.out.println("회원아님");
//			}else if(result.equals("wrong_pw")) {
//				System.out.println("잘못된 비밀번호");
//			}
			
			
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
//	@RequestMapping(value = "/notice_page.do")
//	public String notice_page() throws Exception {
//		try {
//			
//		}catch(Exception e) {
//			System.out.println("Error(TTPageController/notice_page) : " + e.getMessage());
//		}
//	
//		return "board_notice_list";
//	}
	
	// Go to notice board write page
	@RequestMapping(value = "/notice_write_page.do")
	public String notice_write_page() {
		
		return "board_notice_write";
	}
	
//	// Notice board list
//	@GetMapping("/notice_list.do")
//	public ModelAndView notice_list(@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
//			,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) {
//		ModelAndView mav = new ModelAndView();
//		ArrayList<NoticeVO> nlist = null;
//		
//		if(pageNum <= 0) {									// 페이징에 처음뜨는 페이지수
//			pageNum = 1;
//		}
//		
//		if(pageNum > pageCount) {
//			pageNum = pageCount;
//		}
//		
//		int pageSize = 10;									// 한 페이지에 출력할 게시물 개수
//		int currentPage = pageNum;
//		int startRow = (currentPage-1) * pageSize + 1;		// 현재 페이지에 읽기 시작할 row 번호
//		int endRow = startRow + pageSize - 1;				// 현재 페이지에 읽을 마지막 row 번호
//		int count = 0;										// 게시글 총 개수
//		int number = 0;
//		
//		try {
//			count = tts.getNoticeBoardCount();	// startRow, endRow 파라미터로 필요없지 않나? / 게시글 총 개수 구하는
//			while(count < startRow) {
//				currentPage = currentPage - 1;
//				startRow = (currentPage - 1) * pageSize + 1;
//				endRow = startRow + pageSize - 1;
//			}
//			if(count > 0) {
//				nlist = tts.loadNoticeBoard(startRow, endRow);
//				number = count - (currentPage - 1) * pageSize;
//			}
//			mav.addObject("nlist", nlist);
//			mav.addObject("currentPage", currentPage);
//			mav.addObject("count", count);
//			mav.addObject("number", number);
//			mav.addObject("pageSize", pageSize);
//			
//		}catch(Exception e) {
//			System.out.println("Error(TTPageController/notice_list.do) : " + e.getMessage());
//		}
//		mav.setViewName("board_notice_list");
//		return mav;
//	}
	
	// Notice board list another version
	@GetMapping("/notice_list.do")
	public ModelAndView notice_list(@RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		ModelAndView mav = new ModelAndView();
		ArrayList<NoticeVO> nlist = null;
		Page page = new Page();
		
		try {
			page.setNum(num);
			
			// 게시물 총 개수
			page.setCount(tts.getNoticeBoardCount());
			
			nlist = tts.listPage(page.getDisplayPost(), page.getPostNum());
			
			mav.addObject("nlist", nlist);
			mav.addObject("pageNum", page.getPageNum());
			
			// 시작 및 끝 번호
			mav.addObject("startPageNum", page.getStartPageNum());
			mav.addObject("endPageNum", page.getEndPageNum());
			
			// 이전 및 다음
			mav.addObject("prev", page.isPrev());
			mav.addObject("next", page.isNext());
			
			// 현재 페이지
			mav.addObject("select", num);
			
		}catch(Exception e) {
			System.out.println("Error(TTPageController/notice_list.do) : " + e.getMessage());
		}
		mav.setViewName("board_notice_list");
		return mav;
	}
	
	// Write on notice board
	@RequestMapping(value = "/write_notice.do")
	public String write_notice(NoticeVO nv) throws Exception {
		try {
			tts.insertNoticeBoard(nv);
		}catch(Exception e) {
			System.out.println("Error(TTPageController/write_notice) : " + e.getMessage());
		}
		return "redirect:notice_list.do";
	}
	
	// Notice board detail
	@GetMapping("/notice_detail.do")
	public ModelAndView noticeBoardDetail(@RequestParam("notice_num")int notice_num) throws Exception {
		ModelAndView mav = new ModelAndView();
		NoticeVO noticeVO;
		try {
			noticeVO = tts.getNoticeDetail(notice_num);
			
			mav.addObject("noticeVO", noticeVO);
		}catch(Exception e) {
			System.out.println("Error(TTPageController/notice_detail) : " + e.getMessage());
		}
		mav.setViewName("board_notice_detail");
		return mav;
	}
	
	// Go to update notice
	@GetMapping("/notice_update_page")
	public ModelAndView go_update_notice(@RequestParam("notice_num")int notice_num) throws Exception{
		ModelAndView mav = new ModelAndView();
		NoticeVO noticeVO;
		try {
			noticeVO = tts.getNoticeDetail(notice_num);
			mav.addObject("noticeVO", noticeVO);
		}catch(Exception e) {
			System.out.println("Error(TTPageController/go_update_notice) : " + e.getMessage());
		}
		mav.setViewName("board_notice_update");
		return mav;
	}
	
	// Update notice
	@PostMapping("/update_notice")
	public String update_notice(NoticeVO nv) throws Exception{
		
		try {
			tts.updateNotice(nv);
		}catch(Exception e) {
			System.out.println("Error(TTPageController/update_notice) : " + e.getMessage());
		}
		
		return "redirect:notice_list.do";
	}
	
	// Delete notice
	
}
