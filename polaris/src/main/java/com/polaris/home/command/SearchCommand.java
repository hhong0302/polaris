package com.polaris.home.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class SearchCommand implements SpCommand {
    


    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        

        String name = request.getParameter("query");


        PolarisDAO dao = new PolarisDAO();
        ArrayList<BookDTO> dtos = dao.search(name);


        model.addAttribute("search", dtos);

    }
}