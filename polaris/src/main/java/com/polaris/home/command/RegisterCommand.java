package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class RegisterCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		
		String userid = req.getParameter("userid");
		String userpass = req.getParameter("userpass");
		String username = req.getParameter("username");
		String birth = req.getParameter("birth");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		
		PolarisDAO dao = new PolarisDAO();
		dao.registerok(userid, userpass, username, birth, tel, email);
	}

}
