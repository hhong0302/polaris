package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;
import com.polaris.home.dto.InterestDTO;

public class HomeListCommand implements SpCommand {

	@Override
	public void execute(Model model) {

		PolarisDAO dao = new PolarisDAO();
		List<InterestDTO> idto = dao.hg_homeinterest();
		List<BookDTO> ndto = dao.hg_homeList("소설/시");
		List<BookDTO> edto = dao.hg_homeList("에세이");
		
		model.addAttribute("hg_novel",ndto);
		model.addAttribute("hg_essay",edto);
		model.addAttribute("hg_interest",idto);

	}

}
