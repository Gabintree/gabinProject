package com.gabinproject.project.Command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.gabinproject.project.Dao.BDao;
import com.gabinproject.project.Dto.BDto;

public class BListCommand implements BCommand{

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		BDao dao = new BDao();
		ArrayList<BDto> dtos = dao.list();
		model.addAttribute("board_list", dtos);
	}
	
	
}
