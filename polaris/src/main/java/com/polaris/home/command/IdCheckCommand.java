package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class IdCheckCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		String userid = req.getParameter("userid");
		System.out.println(userid);
		PolarisDAO dao = new PolarisDAO();
		int rs = dao.checkid(userid);

		model.addAttribute("check", rs);
		
		
	}
	
}
