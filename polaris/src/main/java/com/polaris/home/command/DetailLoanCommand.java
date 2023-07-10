package com.polaris.home.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class DetailLoanCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        PolarisDAO dao = new PolarisDAO();
        HttpSession session = request.getSession();
        String bookcode = request.getParameter("bookinfo");
        String booktitle = request.getParameter("booktitle");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        int loanStatus = dao.loanStatus(bookcode, (String)session.getAttribute("userid"));
        int loanCount = dao.loanCount((String)session.getAttribute("userid"));
        
		
        if(loanCount < 3) {
        	if(loanStatus == 0) dao.loanBook(bookcode, (String)session.getAttribute("userid"), booktitle, author, publisher);
        	else dao.returnBook(bookcode, (String)session.getAttribute("userid"));			
        }else {
        	if(loanStatus == 1) dao.returnBook(bookcode, (String)session.getAttribute("userid"));	
        }
		
	}

}