package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class ReviewWriteCommand implements SpCommand {

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
	    HttpServletRequest req = (HttpServletRequest) map.get("req");
	    HttpSession session = req.getSession();
	    PolarisDAO dao = new PolarisDAO();
	    String bookcode = req.getParameter("bookcode");
	    String userid = (String) session.getAttribute("userid");
	    String reviewtitle = req.getParameter("reviewtitle");
	    String reviewcontent = req.getParameter("reviewcontent");
	    int isReview = dao.hg_reviewWriteCount(bookcode, userid);
	    if(isReview==0) dao.hg_reviewWrite(bookcode,userid,reviewtitle,reviewcontent);
	    else dao.hg_reviewModify(bookcode, userid, reviewtitle, reviewcontent);
	    //model.addAttribute("isReviewWrited",1);
	}

}
