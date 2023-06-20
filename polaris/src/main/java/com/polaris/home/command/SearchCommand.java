package com.polaris.home.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class SearchCommand implements SpCommand {
    private PolarisDAO dao;

    // dao 객체 주입을 위한 setter 메서드
    public void setDao(PolarisDAO dao) {
        this.dao = dao;
    }

    @Override
    public void execute(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        String genre = request.getParameter("genre");
        ArrayList<BookDTO> dtos = dao.search();
        ArrayList<BookDTO> dto = dao.totalsearch();
        ArrayList<BookDTO> segen = dao.genresearch(genre);

        model.addAttribute("search", dtos);
        model.addAttribute("totoalsearch", dto);
        model.addAttribute("genresearch", segen);
    }
}