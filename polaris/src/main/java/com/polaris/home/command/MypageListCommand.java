package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookloanDTO;

public class MypageListCommand implements SpCommand {
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("request");
		HttpSession session = req.getSession();
		PolarisDAO dao = new PolarisDAO();
		String bookcode = req.getParameter("bookinfo");
		List<BookloanDTO> pageCount = dao.choi_pageAllList();
		
	}

}
