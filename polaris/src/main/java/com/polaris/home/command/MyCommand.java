package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookloanDTO;
import com.polaris.home.dto.InterestDTO;
import com.polaris.home.dto.MembersDTO;

public class MyCommand implements SpCommand {
	

	@Override
	public void execute(Model model) {
		
		PolarisDAO dao = new PolarisDAO();

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String memlist = request.getParameter("memlist");
		String loanlist = request.getParameter("loanlist");
		String interest = request.getParameter("interest");
		
		List<MembersDTO> mdto = dao.choi_memList();
		List<BookloanDTO> bdto = dao.choi_loanList();
		List<InterestDTO> idto = dao.choi_interest();
		
		model.addAttribute("memlist", mdto);
		model.addAttribute("loanList", bdto);
		model.addAttribute("interest", idto);
	}

}
