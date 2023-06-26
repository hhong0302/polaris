package com.polaris.home.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;

public class DetailSuggestCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    PolarisDAO dao = new PolarisDAO();
	    
	    String bookcode = request.getParameter("bookinfo");
	    String genre = dao.sgGenre(bookcode);
	    
	    ArrayList<BookDTO> suggest = dao.suggest(bookcode, genre);
	    
        model.addAttribute("suggest", suggest);
	}

}
