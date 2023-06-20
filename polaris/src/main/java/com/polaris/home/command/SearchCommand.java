package com.polaris.home.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class SearchCommand implements SpCommand{

	@Override
	public void execute(Model model) {

		PolarisDAO dao = new PolarisDAO();
		ArrayList<BookDTO> dtos = dao.search();
		ArrayList<BookDTO> dto = dao.totalsearch();
		
		model.addAttribute("search", dtos);
		model.addAttribute("totalsearch", dto);
		
	}

	
}
