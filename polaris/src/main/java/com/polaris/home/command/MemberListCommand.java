package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.MembersDTO;

public class MemberListCommand implements SpCommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
//        ModelAndView mv = new ModelAndView();
//        mv.
        String userid =(String) request.getAttribute("userid");
        System.out.println(userid);
        System.out.println(userid);
        PolarisDAO dao = new PolarisDAO();
        MembersDTO rs = dao.memberInfo(userid);

        model.addAttribute("userInfo", rs);
		
	}

}
