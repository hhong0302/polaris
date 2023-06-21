package com.polaris.home.command;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;


public class DetailCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		BookDTO bdto = new BookDTO();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		bdto.setBookcode((String) req.getParameter("bookcode"));
		
		PolarisDAO dao = new PolarisDAO();
		String booktitle = dao.booktitle(bdto.getBookcode());
		
		model.addAttribute("booktitle",booktitle);
	}
}
