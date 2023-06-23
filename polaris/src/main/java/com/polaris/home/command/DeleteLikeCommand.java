package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class DeleteLikeCommand implements SpCommand {
	@Override
	public void execute(Model model) {
		 Map<String, Object> map = model.asMap();
		 HttpServletRequest request = (HttpServletRequest) map.get("request");
	     String bookcode = request.getParameter("bookinfo");
	        
	     HttpSession session = request.getSession();
	       
	     PolarisDAO dao = new PolarisDAO();
		
		dao.deleteLike(bookcode, (String)session.getAttribute("userid"));
	}
}
