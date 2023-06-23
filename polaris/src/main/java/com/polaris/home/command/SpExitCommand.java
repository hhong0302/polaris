package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class SpExitCommand implements SpCommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        String userid =(String) request.getAttribute("userid");
        
        PolarisDAO dao = new PolarisDAO();
        dao.exit(userid);
		
	}

}
