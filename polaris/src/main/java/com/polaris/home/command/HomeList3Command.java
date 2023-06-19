package com.polaris.home.command;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public class HomeList3Command implements SpCommand {
	
	@Override
	public void execute(Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		HttpServletRequest res = (HttpServletRequest) map.get("response");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();

	}

}
