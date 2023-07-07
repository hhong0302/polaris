package com.polaris.home.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class MenuSearchCommand implements SpCommand{
	
    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        
        String genre = request.getParameter("genre");
        String bookcode = request.getParameter("bookinfo");

        PolarisDAO dao = new PolarisDAO();
        HttpSession session = request.getSession();
        int userLike = dao.userLike(bookcode, (String)session.getAttribute("userid"));
        ArrayList<BookDTO> dto = dao.totalsearch();
        ArrayList<BookDTO> segen = dao.genresearch(genre);
        
        System.out.println(userLike);
       
        model.addAttribute("userLike", userLike);
        model.addAttribute("totalsearch", dto);
        model.addAttribute("genresearch", segen);

    }
}
