package com.polaris.home.command;


import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;


public class DetailCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		 Map<String, Object> map = model.asMap();
	        HttpServletRequest request = (HttpServletRequest) map.get("request");
	        String bookcode = request.getParameter("bookinfo");

	        PolarisDAO dao = new PolarisDAO();
	        ArrayList<BookDTO> binfo = dao.bookinfo(bookcode);

	        model.addAttribute("bookinfo", binfo);
    }
}
