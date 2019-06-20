package com.gabinproject.project.Command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gabinproject.project.Dao.BDao;
import com.gabinproject.project.Dto.BDto;

public class BReplyViewCommand implements BCommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String bid = request.getParameter("bid");
		
		BDao dao = new BDao();
		BDto dto = dao.reply_view(bid);
		
		model.addAttribute("board_reply_view", dto);
	}
	

}
