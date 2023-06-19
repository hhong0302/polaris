package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class HomeListCommand implements SpCommand {

	@Override
	public void execute(Model model) {

		PolarisDAO dao = new PolarisDAO();
		Map<String,Object> map = model.asMap();
		List<BookDTO> ndto = dao.hg_homenovel();
		List<BookDTO> edto = dao.hg_homeessay();
		model.addAttribute("hg_novel",ndto);
		model.addAttribute("hg_essay",edto);

	}

}
