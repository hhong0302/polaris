package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class FindPwCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
	    HttpServletRequest req = (HttpServletRequest) map.get("req");
	    req.getParameter("pw-userid");
	}

}
