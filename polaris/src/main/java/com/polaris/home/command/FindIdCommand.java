package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class FindIdCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    String username = request.getParameter("mj-name");
	    String birth = request.getParameter("mj-birth");
	    String tel = request.getParameter("mj-tel");
	    PolarisDAO dao = new PolarisDAO();
	    String findMyId = dao.findMyId(username,birth,tel);
	    if(!findMyId.equals(""))
	    {
	    	model.addAttribute("userid", findMyId);
	    }
	    else
	    {
	    	model.addAttribute("userid", "NotFoundYourId");
	    }
	    
	}

}
