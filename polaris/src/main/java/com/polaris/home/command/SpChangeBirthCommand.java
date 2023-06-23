package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class SpChangeBirthCommand implements SpCommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        String userid =(String) request.getAttribute("userid");
        String newBirth = request.getParameter("new-birth");
        
        PolarisDAO dao = new PolarisDAO();
        dao.changeBirth(userid, newBirth);
		
	}

}
