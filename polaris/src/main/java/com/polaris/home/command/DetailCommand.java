package com.polaris.home.command;


import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;


public class DetailCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		 Map<String, Object> map = model.asMap();
	        HttpServletRequest request = (HttpServletRequest) map.get("request");
	        PolarisDAO dao = new PolarisDAO();
	        HttpSession session = request.getSession();
	        String bookcode = request.getParameter("bookinfo");
	        
	        int likeCount = dao.likeCount(bookcode);
	        int userLike = dao.userLike(bookcode, (String)session.getAttribute("userid"));
	        int loanStatus = dao.loanStatus(bookcode, (String)session.getAttribute("userid"));
	        System.out.println(loanStatus);
	        ArrayList<BookDTO> binfo = dao.bookinfo(bookcode);	        
			
	        
//	        if(userLike == 0) dao.insertLike(bookcode, (String)session.getAttribute("userid"), booktitle, author, publisher);
//	        else dao.deleteLike(bookcode, (String)session.getAttribute("userid"));

	        model.addAttribute("bookinfo", binfo);
	        model.addAttribute("likeCount", likeCount);
	        model.addAttribute("userLike", userLike);
	        model.addAttribute("loanStatus", loanStatus);
    }
}
