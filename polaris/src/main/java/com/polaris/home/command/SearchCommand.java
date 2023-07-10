package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class SearchCommand implements SpCommand {
    


    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        

        String name = request.getParameter("query");

        PolarisDAO dao = new PolarisDAO();
        HttpSession session = request.getSession();
        List<BookDTO> dtos = dao.search(name, (String)session.getAttribute("userid"));
        for(BookDTO searchloancount: dtos) {
        	int scount = dao.loanStatus(searchloancount.getBookcode(), (String)session.getAttribute("userid"));
        	searchloancount.setSearchloancount(scount);
        }


        model.addAttribute("search", dtos);

    }
}