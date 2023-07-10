package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class OrderSearchCommand implements SpCommand{

    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        HttpSession session = request.getSession();
        
 
        String order = request.getParameter("order");
        PolarisDAO dao = new PolarisDAO();

        List<BookDTO> ordse = dao.ordersearch(order, (String)session.getAttribute("userid"));
        for(BookDTO searchloancount: ordse) {
        	int scount = dao.loanStatus(searchloancount.getBookcode(), (String)session.getAttribute("userid"));
        	searchloancount.setSearchloancount(scount);
        }


        model.addAttribute("ordersearch", ordse);
    }
}

