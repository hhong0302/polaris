package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
public class LikeCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        System.out.println();
        PolarisDAO dao = new PolarisDAO();
        HttpSession session = request.getSession();
        String bookcode = request.getParameter("bookinfo");
        String booktitle = request.getParameter("booktitle");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		int userLike = dao.userLike(bookcode, (String)session.getAttribute("userid"));
                
		
        if(userLike == 1) dao.deleteLike(bookcode, (String)session.getAttribute("userid"));
        else dao.insertLike(bookcode, (String)session.getAttribute("userid"), booktitle, author, publisher);        

		
	}

}
