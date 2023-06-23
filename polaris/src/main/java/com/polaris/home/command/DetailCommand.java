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
	        String bookcode = request.getParameter("bookinfo");
	        String booktitle = request.getParameter("booktitle");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			
	        HttpSession session = request.getSession();
	       
	        
	        PolarisDAO dao = new PolarisDAO();
	        ArrayList<BookDTO> binfo = dao.bookinfo(bookcode);	        
			
	        
	        int likeCount = dao.likeCount(bookcode);
	        int userLike = dao.userLike(bookcode, (String)session.getAttribute("userid"));
	        
	        dao.deleteLike(bookcode, (String)session.getAttribute("userid"));
	        dao.insertLike(bookcode, (String)session.getAttribute("userid"), booktitle, author, publisher);
	        
	        

	        model.addAttribute("bookinfo", binfo);
	        model.addAttribute("likeCount", likeCount);
	        model.addAttribute("userLike", userLike);
    }
}
