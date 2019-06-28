package com.gabinproject.project.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gabinproject.project.Command.BCommand;
import com.gabinproject.project.Command.BContentCommand;
import com.gabinproject.project.Command.BDeleteCommand;
import com.gabinproject.project.Command.BListCommand;
import com.gabinproject.project.Command.BModifyCommand;
import com.gabinproject.project.Command.BModifyViewCommand;
import com.gabinproject.project.Command.BReplyCommand;
import com.gabinproject.project.Command.BReplyViewCommand;
import com.gabinproject.project.Command.BWriteCommand;

@Controller
public class Bcontroller {
	
	BCommand command = null;
	
	@RequestMapping("/board_list")
	public String list(HttpServletRequest request, RedirectAttributes redirect, Model model) {
		System.out.println("리스트를 보여줍니다.");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id")== null) {
			redirect.addFlashAttribute("msg", "회원만 접근이 가능합니다. 로그인 해주세요.");
			 return "redirect:loginForm";
		}
		
		command = new BListCommand();
		command.execute(model);
		return "board_list";
	}
	
	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("board_write_view  입니다.");
		
		
		
		 return "board_write_view";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("board_write() 보여줍니다.");
		
		model.addAttribute("request", request);
		
		command = new BWriteCommand();
		command.execute(model);
		
		return "redirect:board_list";
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("board_content_view()");
		model.addAttribute("request", request);
		
		command = new BContentCommand();
		command.execute(model);
		
		return "board_content_view";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("board_delete() 보여줍니다.");
		
		model.addAttribute("request", request);
		
		command = new BDeleteCommand();
		command.execute(model);
		
		return "redirect:board_list";
	}
	
	@RequestMapping("/modify_view")
	public String modify_view(HttpServletRequest request, Model model) {
		System.out.println("modify_view()");
		
		model.addAttribute("request", request);
		command = new BModifyViewCommand();
		command.execute(model);
		
		return "board_modify_view";
	}
	
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("modify()");
		
		model.addAttribute("request", request);
		command = new BModifyCommand();
		command.execute(model);
		 		
		return "redirect:board_list";
	}
			
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		System.out.println("reply_view()");
		
		model.addAttribute("request", request);
		command = new BReplyViewCommand();
		command.execute(model);
		
		return "board_reply_view";
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request, Model model) {
		System.out.println("board_reply()");
		
		model.addAttribute("request", request);
		command = new BReplyCommand();
		command.execute(model);
		
		return "redirect:board_list";
	}

	

	
	
	
	
	

	
	
}
