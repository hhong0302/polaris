package com.polaris.home.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookloanDTO;
import com.polaris.home.dto.InterestDTO;
import com.polaris.home.dto.MembersDTO;
import com.polaris.home.dto.PageMakerDTO;
import com.polaris.home.dto.PagingCriteriaDTO;

public class MyCommand implements SpCommand {
	

	@Override
	public void execute(Model model) {
		
		PolarisDAO dao = new PolarisDAO();

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<MembersDTO> mdto = dao.choi_memList();
		List<BookloanDTO> bdto = dao.choi_loanList();
		List<BookloanDTO> pbdto = dao.choi_pastloanList();
		List<InterestDTO> idto = dao.choi_interest();
		
		model.addAttribute("memlist", mdto);
		model.addAttribute("loanList", bdto);
		model.addAttribute("pastloanList", pbdto);
		model.addAttribute("interest", idto);
	}
	
	@RequestMapping("/mypage")
	public String paging(PagingCriteriaDTO cri, Model model) {
		
		PolarisDAO dao = new PolarisDAO();
		int total = dao.choi_pagingTotal();
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
	    
	    List<InterestDTO> interestList = dao.choi_InterestList(cri);
	    
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("interestList", interestList);
		
		List<MembersDTO> mdto = dao.choi_memList();
		List<BookloanDTO> bdto = dao.choi_loanList();
		List<BookloanDTO> pbdto = dao.choi_pastloanList();
		List<InterestDTO> idto = dao.choi_interest();
		
		return "mypage";
		
	}

}