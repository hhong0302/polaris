package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.cj.Session;
import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookloanDTO;
import com.polaris.home.dto.InterestDTO;
import com.polaris.home.dto.MembersDTO;
import com.polaris.home.dto.PageMakerDTO;
import com.polaris.home.dto.PagingCriteriaDTO;

public class MyCommand implements SpCommand {
	

	@Override
	public void execute(Model model) {
		
		PolarisDAO dao = new PolarisDAO();

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		
		List<MembersDTO> mdto = dao.choi_memList();
		List<BookloanDTO> bdto = dao.choi_loanList();
		int pbdto = dao.choi_pastloanList();
		int idto = dao.choi_interest(userid);
		
		model.addAttribute("memlist", mdto);
		model.addAttribute("loanList", bdto);
		model.addAttribute("pastloanList", pbdto);
		model.addAttribute("interest", idto);
	}
	


}