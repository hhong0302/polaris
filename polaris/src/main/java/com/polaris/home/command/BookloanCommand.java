package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class BookloanCommand  implements SpCommand {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpSession session = req.getSession();
		PolarisDAO dao = new PolarisDAO();
		int num = Integer.parseInt(req.getParameter("num"));
		String bookcode = req.getParameter("choi_loanList");
		
        dao.choi_bookLoan(bookcode, num);

		
	}
}
