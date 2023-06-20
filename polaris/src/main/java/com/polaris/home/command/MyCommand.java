package com.polaris.home.command;

import java.util.List;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.MembersDTO;

public class MyCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		
		PolarisDAO dao = new PolarisDAO();
		List<MembersDTO> mdto = dao.choi_memList();
		
		model.addAttribute("choi_memlist", mdto);
	}

}
