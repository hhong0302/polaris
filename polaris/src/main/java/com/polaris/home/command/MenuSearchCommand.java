package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class MenuSearchCommand implements SpCommand{
	
    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        
        String genre = request.getParameter("genre");
        
        PolarisDAO dao = new PolarisDAO();
        HttpSession session = request.getSession();
        List<BookDTO> dto = dao.totalsearch((String)session.getAttribute("userid"));
        List<BookDTO> segen = dao.genresearch(genre, (String)session.getAttribute("userid"));     
        
        for(BookDTO searchloancount: dto) {
        	int scount = dao.loanStatus(searchloancount.getBookcode(), (String)session.getAttribute("userid"));
        	searchloancount.setSearchloancount(scount);
        }
        for(BookDTO searchloancount: segen) {
        	int scount = dao.loanStatus(searchloancount.getBookcode(), (String)session.getAttribute("userid"));
        	searchloancount.setSearchloancount(scount);
        }
       
        model.addAttribute("totalsearch", dto);
        model.addAttribute("genresearch", segen);
      

    }
}
