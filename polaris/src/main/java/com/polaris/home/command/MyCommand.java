package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookloanDTO;
import com.polaris.home.dto.MembersDTO;

public class MyCommand implements SpCommand {
	

	@Override
	public void execute(Model model) {
		
		PolarisDAO dao = new PolarisDAO();

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		
		List<MembersDTO> mdto = dao.choi_memList();
		List<BookloanDTO> bdto = dao.choi_loanList(userid);
		int pbdto = dao.choi_pastloanList(userid);
		int idto = dao.choi_interest(userid);
		
		model.addAttribute("memlist", mdto);
		model.addAttribute("loanList", bdto);
		model.addAttribute("pastloanList", pbdto);
		model.addAttribute("interest", idto);
	}
	


}