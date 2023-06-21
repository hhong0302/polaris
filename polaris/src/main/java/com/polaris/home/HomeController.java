package com.polaris.home;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.polaris.home.command.DetailCommand;
import com.polaris.home.command.HomeListCommand;
import com.polaris.home.command.IdCheckCommand;
import com.polaris.home.command.RegisterCommand;
import com.polaris.home.command.SearchCommand;
import com.polaris.home.command.SpCommand;
import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;
import com.polaris.home.util.Static;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//모든 command가 갖고 있는 인터페이스 타입을 선언
		SpCommand command;
			
		//jdbc Spring template
		public JdbcTemplate template;
		
		@Autowired
		public void setTemplate(JdbcTemplate template)
		{
			this.template = template;
			Static.template=this.template;
		}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		SpCommand command = new HomeListCommand();
		command.execute(model);
		
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mainHotController")
	
	public void mainHotController(HttpServletRequest req,HttpServletResponse res) throws Exception {
		PolarisDAO dao = new PolarisDAO();
		String name = req.getParameter("name");
		List<BookDTO> dto = (List<BookDTO>) dao.hg_hotList(name);
		PrintWriter out = res.getWriter();
		String gson = new Gson().toJson(dto);
		out.println(gson);
		out.close();
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(HttpServletRequest request,Model model) {
		String query = request.getParameter("query");
		model.addAttribute("request", request);
		model.addAttribute("searchresult", query);

	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "search");
	    return "search";
	}

	@RequestMapping(value = "totalsearch")
	public String totalsearch(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("searchresult", "전체");

	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "totalsearch");
	    	return "search"; 
	}
	
	@RequestMapping(value = "genresearch", method = RequestMethod.GET)
	public String genresearch(HttpServletRequest request, Model model) {
		String genre = request.getParameter("genre");
		model.addAttribute("request", request);
		model.addAttribute("searchresult", genre);

	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "genresearch");
	    
	    return "search";
	}

	
	
	@RequestMapping(value = "detail")
	public String detail(HttpServletRequest request, Model model) {
        String bookcode = request.getParameter("bookinfo");
        model.addAttribute("bookcode", bookcode);
        
		return "detail";	// detail.jsp 호출!!!
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String bookinfo(HttpServletRequest request, Model model) {
		String bookcode = request.getParameter("bookinfo");
		model.addAttribute("request", request);
		model.addAttribute("bookcode", bookcode);

	    command = new DetailCommand();
	    command.execute(model);
	    
	    return "detail";
	}
	
	
	@RequestMapping(value = "mypage")
	public String mypage(Model model) {
		return "mypage";	// detail.jsp 호출!!!
	}
	
	@RequestMapping(value = "register")
	public String register(Model model) {
		return "register";	// register.jsp 호출!!!
	}
	@RequestMapping(value = "registerok")
	public String registerok(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new RegisterCommand();
		command.execute(model);
		
		return "redirect:/";
		
	}
	@RequestMapping("/idcheck")
		public String idcheck(HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			command = new IdCheckCommand();
			command.execute(model);
			return "check";
		}
	
	@RequestMapping(value = "login")
	public String login(Model model) {
		return "login";	// login.jsp 호출!!!
	}

}
