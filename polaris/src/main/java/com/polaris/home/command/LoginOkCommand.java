package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class LoginOkCommand implements SpCommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		String userid = req.getParameter("userid");
		String userpass = req.getParameter("userpass");
		PolarisDAO dao = new PolarisDAO();
		int rs = dao.loginOk(userid, userpass);
		
		model.addAttribute("loginok", rs);
		
	}

}
