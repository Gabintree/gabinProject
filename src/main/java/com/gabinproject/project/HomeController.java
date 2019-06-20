package com.gabinproject.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gabinproject.project.Dao.UDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "mainPage";
	}
	
	@RequestMapping(value = "/mainPage")
	public String mainPage(Model model) {
		logger.info("/mainPage()");
		return "mainPage";
	}
	
	@RequestMapping(value = "/loginForm")
	public String loginPage(Model model) {
		logger.info("/loginPage()");
		return "loginPage";
	}
	
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) {
		logger.info("/login()");
		
		int loginCheck;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UDao dao = new UDao();
		loginCheck = dao.login(id, pw);
		
		HttpSession session = request.getSession();
	
		if(loginCheck == 1) {
			session.setAttribute("id", id);
			return "redirect:mainPage";
		}else if(loginCheck == -1) {
			session.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:loginForm";
		}else if(loginCheck == 0){
			session.setAttribute("msg", "아이디가 존재하지 않습니다.");
			return "redirect:loginForm";
		}else {
			session.setAttribute("msg", "관리자에게 문의해주세요.");
			return "redirect:loginForm";
		}
	}
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		logger.info("/logout()");
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		return "redirect:mainPage";
	}
	
	
	@RequestMapping(value = "/joinForm")
	public String joinPage(Model model) {
		logger.info("/joinPage()");
		return "joinPage";
	}
	
	@RequestMapping(value = "/join")
	public String join(Model model) {
		logger.info("/join()");
		return "redirect:loginForm";
	}
	
	
	
	
}
